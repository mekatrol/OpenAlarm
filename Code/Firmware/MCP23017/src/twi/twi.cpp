#include <inttypes.h>
#include <avr/interrupt.h>

#include "common.h"
#include "timer.h"
#include "twi.h"

// Set SCL and SDA port and pins
#ifndef TWI_PORT
#define TWI_PORT PORTC
#endif

#ifndef TWI_SDA
#define TWI_SDA PINC4
#endif

#ifndef TWI_SCL
#define TWI_SCL PINC5
#endif

// TWI ACK/NAK bit values
#define TWI_ACK 1
#define TWI_NAK 0

// TWI READ/WRITE bit values
#define TWI_READ 1
#define TWI_WRITE 0

// Set to non zero if the device should reset (TwiCleanup then TwiInit) upon a timeout
#ifndef TWI_RESET_ON_TIMEOUT
#define TWI_RESET_ON_TIMEOUT 0
#endif

/***************************************************************************************************************
 * Internal TWI variables
 ***************************************************************************************************************/
static volatile uint8_t _twi_state;     // The current internal machine state of the TWI
static volatile uint8_t _twi_error;     // The most recent error that occurred (if one has occurred)
static volatile uint8_t _sla_rw;        // The slave device address combined with the R/W flag
static volatile uint8_t _transmit_stop; // True if the current sequence should be terminated with a stop condition
static volatile uint8_t _stopping;      // True if stop condition has transmitted, but idle state not yet achieved

// The data buffer
static volatile uint8_t _tx_buffer[TWI_BUFFER_LENGTH]; // The buffer to queue tranmit data
static volatile uint8_t _tx_buffer_index;              // The index in the buffer of the next byte to transmit
static volatile uint8_t _tx_buffer_count;              // The number of items initially queued

// Pointer to receive buffer and expected receive length
static volatile uint8_t *_rx_buffer;             // The caller supplies the rx buffer, this just points to it
static volatile uint8_t _rx_buffer_index;        // The next available index in the rx buffer
static volatile uint8_t _rx_buffer_expected_len; // The number of bytes TWI should try and receive

/***************************************************************************************************************
 * Lookahead functions
 ***************************************************************************************************************/
void TwiStart();
void TwiStop();
uint8_t TwiWaitForStop();
uint8_t TwiCheckStateAndWaitForStop(uint8_t wait_state);

/***************************************************************************************************************
 * Callback functions
 ***************************************************************************************************************/
void (*TwiTransmitFinishedCallback)(void);
void (*TwiReceiveFinishedCallback)(void);

/***************************************************************************************************************
 * Initialises the two wire interface (TWI). 
 ***************************************************************************************************************/
void TwiInit()
{
    // Default to idle state
    _twi_state = TWI_STATE_IDLE;
    _transmit_stop = true;
    _twi_error = TWI_NO_ERROR;

#if TWI_USE_INTERNAL_PULL_UP
    // Enable two wire clock and data pin pullups
    TWI_PORT |= (1 << TWI_SDA | 1 << TWI_SCL);
#else
    // Disable two wire clock and data pin pullups
    TWI_PORT &= ~(1 << TWI_SDA | 1 << TWI_SCL);
#endif

    // Clear TWPS1 (b1) and TWPS0 (b2) [set to 0], making prescaler value = 1
    TWSR = ~((1 << TWPS0) | (1 << TWPS1));

    // Set the TWI bit rate register
    // It is calculated using:
    // SCL freq = F_CPU / (16 + 2 * TWBR * PrescalerValue)
    TWBR = TWI_TWBR;

    // Enable two wire interface (TWEN)
    // Enable TWI interrupts(TWIE)
    // From data sheet:
    //   The TWEA bit must be written to one to enable the acknowledgement of the
    //   device’s own slave device address or the general call address. TWSTA and TWSTO must be
    //   written to zero.
    TWCR = (1 << TWEN) | (1 << TWIE) | (1 << TWEA);
}

/***************************************************************************************************************
 * Turns off the two wire interface (TWI) and frees up the TWI pins.
 ***************************************************************************************************************/
void TwiCleanup()
{
    // Turn off the TWI enable bit, interrupt and address ACK response
    TWCR &= ~((1 << TWEN) | (1 << TWIE) | (1 << TWEA));

    // Disable two wire clock and data pin pullups (return inputs to reset state)
    TWI_PORT &= ~(1 << TWI_SDA | 1 << TWI_SCL);
}

/***************************************************************************************************************
 * Get the current TWI state
 ***************************************************************************************************************/
uint8_t TwiGetState()
{
    return _twi_state;
}

/***************************************************************************************************************
 * Get the current error state
 ***************************************************************************************************************/
uint8_t TwiGetError()
{
    return _twi_error;
}

/***************************************************************************************************************
 * Reset the current error state (returns the error was set to prior to reset)
 ***************************************************************************************************************/
uint8_t TwiClearError()
{
    // Save previous error
    uint8_t previous_error = _twi_error;

    // Clear error
    _twi_error = TWI_NO_ERROR;

    // Return previous error
    return previous_error;
}

/***************************************************************************************************************
 * Set the address that will be used when the TWI is acting in the slave device mode.
 * Can also set the TWGCE bit to enable answering general calls on the bus from a master device.
 ***************************************************************************************************************/
void TwiSetSlaveDeviceAddress(uint8_t address, uint8_t answer_general_call)
{
    // Set slave device address (address is high 7 bits of TWAR)
    // Enable answer general call if specified (TWGCE is bit 0 of TWAR).
    TWAR = (address << 1) | (answer_general_call & 0x01);
}

/***************************************************************************************************************
 * Transmit stop condition
 ***************************************************************************************************************/
void TwiStop()
{
    // We have moved to an idle state (even though we are still stopping)
    _twi_state = TWI_STATE_IDLE;

    // Transmit stop condition
    TWCR = (1 << TWEN) | (1 << TWIE) | (1 << TWINT) | (1 << TWSTO) | (1 << TWEA);

    // Flag stopping condition
    _stopping = true;
}

/***************************************************************************************************************
 * Transmit start condition
 ***************************************************************************************************************/
void TwiStart()
{
    TWCR = (1 << TWEN) | (1 << TWIE) | (1 << TWEA) | (1 << TWINT) | (1 << TWSTA);
}

/***************************************************************************************************************
 * Write data as master device to the slave device.
 *    dev_addr         - the address of the slave device
 *    data             - the buffer containing the data
 *    data_len         - the length of the data to send
 *    send_stop        - true to send stop after write, 
 *                       false if write will be followed by restart (ie don't release bus)
 *    finishedCallback - Callback to call when received sequence complete
 ***************************************************************************************************************/
uint8_t TwiMasterDeviceWrite(uint8_t dev_addr, uint8_t *tx_data, int tx_len, void (*finishedCallback)(void))
{
    // Make sure TWI is idle, and wait if there is a pending stop
    if (TwiCheckStateAndWaitForStop(TWI_STATE_IDLE) != TWI_RESULT_OK)
    {
        // Return zero to indicate no data transmitted and that
        // caller should check the error code
        return 0;
    }

    // Set to master device state transmitting
    _twi_state = TWI_STATE_MST_TX;

    // Reset any previous errors
    _twi_error = TWI_NO_ERROR;

    // Update send stop flag
    _transmit_stop = true;

    // Reset the index
    _tx_buffer_index = 0;

    // Set the tranmist finished callback, will be null if no callback
    TwiTransmitFinishedCallback = finishedCallback;

    // Copy the transmit data to the internal TWI transmit buffer
    _tx_buffer_count = 0;
    while (_tx_buffer_count < tx_len)
    {
        _tx_buffer[_tx_buffer_count] = tx_data[_tx_buffer_count];
        _tx_buffer_count++;
    }

    // Build sla+w = slave device address + w bit
    _sla_rw = (dev_addr << 1 | TWI_WRITE);

    // Send start condition
    TwiStart();

    // Successfully buffered write data, send number of bytes buffered
    return tx_len;
}

/***************************************************************************************************************
 * Read data as master device from the slave device. Ability to write registers (eg reg addr being read) before read
 *    dev_addr         - the address of the slave device
 *    data             - the buffer where read data will be placed in read (SLA+R) mode
 *    data_len         - the length of the data to receive
 *    send_stop        - true to send stop after write, 
 *                       false if write will be followed by restart (ie don't release bus)
 *    finishedCallback - Callback to call when received sequence complete
 ***************************************************************************************************************/
uint8_t TwiMasterDeviceRead(uint8_t dev_addr, uint8_t *tx_data, int tx_len, uint8_t *rx_data, uint8_t rx_len, void (*finishedCallback)(void))
{
    // Make sure TWI is idle, and wait if there is a pending stop
    if (TwiCheckStateAndWaitForStop(TWI_STATE_IDLE) != TWI_RESULT_OK)
    {
        // Return zero to indicate no data received and that
        // caller should check the error code
        return 0;
    }

    // Set to master device state receiving
    _twi_state = TWI_STATE_MST_RX;

    // Reset any previous errors
    _twi_error = TWI_NO_ERROR;

    // Are we sending data to slave device first?
    if (tx_len > 0)
    {
        // Reset the tx index
        _tx_buffer_index = 0;

        // Copy the transmit data to the internal TWI transmit buffer
        _tx_buffer_count = 0;
        while (_tx_buffer_count < tx_len)
        {
            _tx_buffer[_tx_buffer_count] = tx_data[_tx_buffer_count];
            _tx_buffer_count++;
        }

        // Set the number of pending bytes to recieve
        _tx_buffer_count = tx_len;

        // Start in transmit mode
        // Build sla+w = slave device address + w bit
        _sla_rw = (dev_addr << 1 | TWI_WRITE);

        // We are receiving data after the send, so do not send stop condition
        _transmit_stop = false;
    }
    else
    {
        // Start in receive mode
        // Build sla+r = slave device address + r bit
        _sla_rw = (dev_addr << 1 | TWI_READ);

        // We are going straight to receive mode, send stop condition when finished
        _transmit_stop = true;
    }

    // Set rx buffer pointer
    _rx_buffer = rx_data;
    _rx_buffer_index = 0;
    _rx_buffer_expected_len = rx_len;

    // Set the received finished callback, will be null if no callback
    TwiReceiveFinishedCallback = finishedCallback;

    // Send start condition
    TwiStart();

    // Successfully initiated read data, send number of pending bytes to receive
    return rx_len;
}

/***************************************************************************************************************
 * Write data as slave device to the master device.
 *    data      - the buffer containing the data to send
 *    data_len  - the length of the data to send
 ***************************************************************************************************************/
uint8_t TwiSlaveDeviceWrite(uint8_t *data, int data_len)
{
}

/***************************************************************************************************************
 * Set TWI to continue next action if one pending (eg transmit address or data)
 ***************************************************************************************************************/
void TwiContinue(uint8_t withAck)
{
    // TWI is enabled (TWEN)
    // TWI interrupts are enabled (TWIE)
    // Clear TWINT (by setting TWINT to 1), this initiates the transmit
    // The TWEA bit must be set to send an ACK, or clear to send a NAK
    TWCR = (1 << TWEN) | (1 << TWIE) | (1 << TWINT) | ((withAck & 0x01) << TWEA);
}

/***************************************************************************************************************
 * Perform any neccassary reset actions
 ***************************************************************************************************************/
void TwiReset()
{
    // Clean up and init TWI
    TwiCleanup();
    TwiInit();
}

/***************************************************************************************************************
 * Wait till state is idle or timeout.
 ***************************************************************************************************************/
uint8_t TwiWaitForState(uint8_t wait_state, uint32_t timeout_period)
{
    // Get the tick at the time we are starting the wait
    uint32_t start_tick = TimerMilliTicks();

    // Wait for idle state (up to timeout milliseconds)
    while (_twi_state != wait_state)
    {
        if (TimerCheckForTimeout(start_tick, timeout_period) == true)
        {
            // We timed out, so return error
            return TWI_RESULT_TIMEOUT;
        }
    }

    // No timeout
    return TWI_RESULT_OK;
}

/***************************************************************************************************************
 * Clear stopping flag and wait for stop conditon to be finished (if _stopping set)
 ***************************************************************************************************************/
uint8_t TwiWaitForStop()
{
    // NOTE: the _stopping flag is 8 bits wide, so atomic in nature
    //       (no critical sections required to sync with ISR code)
    if (!_stopping)
    {
        return TWI_RESULT_OK;
    }

    // Clear stopping flag
    _stopping = false;

    // Get the tick at the time we are starting the wait
    uint32_t start_tick = TimerMilliTicks();

    // Wait for stop completion (up to timeout milliseconds)
    while (TWCR & (1 << TWSTO))
    {
        if (TimerCheckForTimeout(start_tick, TWI_TIMEOUT_PERIOD) == true)
        {
            // We timed out, so return error
            return TWI_RESULT_TIMEOUT;
        }
    }

    // No timeout
    return TWI_RESULT_OK;
}

/***************************************************************************************************************
 * Make sure we are currently idle and waoit for stop if needed.
 * Will return TWI_RESULT_OK if all is OK to proceed, else will return error result
 * _twi_error will be set to TWI_RESULT_OK if all successful, else will be set to relevant error code
 ***************************************************************************************************************/
uint8_t TwiCheckStateAndWaitForStop(uint8_t wait_state)
{
    // Clear any previous error
    _twi_error = TWI_RESULT_OK;

    // Make sure we are idle
    if (_twi_state != wait_state)
    {
        uint8_t error = wait_state == TWI_STATE_IDLE ? TWI_RESULT_NOT_IDLE : TWI_RESULT_NOT_PENDING_REP_START;

        // Set the error
        _twi_error = error;

        // return that we are not idle
        return TWI_RESULT_NOT_IDLE;
    }

    // Make sure we wait for stop if needed
    if (TwiWaitForStop() == TWI_RESULT_TIMEOUT)
    {
        // Set the error
        _twi_error = TWI_RESULT_TIMEOUT;

        // We timed out
        return TWI_RESULT_TIMEOUT;
    }

    return TWI_RESULT_OK;
}

/***************************************************************************************************************
 * Transmit next queued byte if available and return true to indicate next byte transmit started
 * Return false if no byte was queued to transmit (ie transmit condition not set)
 ***************************************************************************************************************/
bool TwiTransmitNext()
{
    // Any more data to transmit?
    if (_tx_buffer_index < _tx_buffer_count)
    {
        // Get next data byte to transmit
        uint8_t data = _tx_buffer[_tx_buffer_index++];

        // Copy next byte to transmit
        TWDR = data;

        // Transmit byte with ACK
        TwiContinue(TWI_ACK);

        // Return without further action
        return true;
    }

    if (_transmit_stop)
    {
        // If caller has flagged a transmit stop then set stop condition
        TwiStop();
    }
    else if (_twi_state == TWI_STATE_MST_RX)
    {
        // Switch to recieve mode (keep current slave device address and set read bit)
        _sla_rw |= TWI_READ;

        // We send stop at end of recieve mode
        _transmit_stop = true;

        // Send repeated start
        TwiStart();
    }

    // If the TX callback set, then callback
    if (TwiTransmitFinishedCallback)
    {
        TwiTransmitFinishedCallback();
    }

    // No more data to transmit, so return false
    return false;
}

/***************************************************************************************************************
 * Receive next byte in the data buffer
 * Return true if there are more bytes to be received, else false to indicate no more bytes will be recieved
 ***************************************************************************************************************/
bool TwiReceiveNext()
{
    uint8_t data = TWDR;

    // Add received data to buffer
    _rx_buffer[_rx_buffer_index] = data;

    // Any more data to receive?
    if (++_rx_buffer_index < _rx_buffer_expected_len)
    {
        // Continue with ACK telling slave device we are
        // ready to receive next byte
        TwiContinue(TWI_ACK);

        // Return without further action
        return true;
    }

    // Tell slave device we are done receiving data
    TwiContinue(TWI_NAK);

    // If the RX callback set, then callback
    if (TwiReceiveFinishedCallback)
    {
        TwiReceiveFinishedCallback();
    }

    // No more data to receive, so return false
    return false;
}

uint8_t TwiCopyReadData(uint8_t *buffer, uint8_t len)
{
    uint8_t i = 0;
    while (i < _tx_buffer_count && i < len)
    {
        buffer[i] = _tx_buffer[i];
        i++;
    }

    return i;
}

/***************************************************************************************************************
 * The ISR to handle condition status updates and twi machine state
 ***************************************************************************************************************/
ISR(TWI_vect)
{
    // This ISR is called whenever the TWINT bit is set, indicating
    // that there is a new status available to read. The status is used in
    // combination with the current state (_twi_state) to determine the next action
    // to take.

    // Get the status from the TWSR. Mask the prescaller bits
    // TWPS1 (bit 1) & TWPS0 (bit 0) and bit 2 (reserved)
    uint8_t status = TWSR & 0b11111000;

    switch (status)
    {
    case TWI_START:   // 0x08 - A master device start condition transmitted
    case TWI_RESTART: // 0x10 - A master device repeat start condition transmitted
        // Next we transmit the slave device address and read/write flag
        // this was set up in one of the methods TwiMasterDeviceWrite or TwiMasterDeviceRead
        TWDR = _sla_rw;

        // Initiate ready with ACK
        TwiContinue(TWI_ACK);

        // Next interrupt event should be TWI_MST_SLV_ACK
        break;

    case TWI_MT_SLAW_ACK: // 0x18 - A master device transmitter SLAW byte acknowledged
    case TWI_MT_DATA_ACK: // 0x28 - A master device transmitter DATA byte acknowledged
        // In both cases we continue with transmitting data until no more to transmit.
        // TwiTransmitNext will move to the next state when transmitting complete.
        TwiTransmitNext();
        break;

    case TWI_MR_SLAR_ACK: // 0x40 - A master device receiver SLAR byte acknowledged
        // Tell slave device we are ready to recieve data
        TwiContinue(TWI_ACK);
        break;

    case TWI_MR_DATA_ACK: // 0x50 - A master device receiver DATA byte acknowledged
        // Receive data until no more to recieve.
        // TwiReceiveNext will move to the next state when receiving complete.
        TwiReceiveNext();
        break;

    case TWI_MR_DATA_NAK: // 0x58 - Slave device indicated no more data
        if (_transmit_stop)
        {
            // If caller has flagged a transmit stop then set stop condition
            TwiStop();
        }
        break;

    default:
        _twi_error = TWI_UNK_ERROR;
        break;
    }
}