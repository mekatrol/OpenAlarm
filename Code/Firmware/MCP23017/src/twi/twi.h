#ifndef __TWI_H__
#define __TWI_H__

#include <inttypes.h>

/***********************************************************************************************************
 * Two Wire Interface clock frequency values
 ***********************************************************************************************************/
#define F_TWI_100_KHZ 100000UL
#define F_TWI_400_KHZ 400000UL
#define F_TWI_1_MHZ 1000000UL

#ifndef F_TWI
#define F_TWI F_TWI_400_KHZ
#endif

#ifndef TWI_TWBR
#if F_CPU >= 1600000UL && F_TWI <= F_TWI_1_MHZ && F_TWI >= F_TWI_100_KHZ
// Calculate TWBR based on CPU frequency and TWI frequency
#define TWI_TWBR ((F_CPU / F_TWI) - 16) / 2
#else
// For CPU frequencies less than 16MHZ or TWI frequences outside 100KHz to 400KHz,
// the SCL frequency will be set to:
//   SCLf = CPUf/((16 + (2 * TWBR)) * Prescaler)
//        = CPUf/((16 + (2 * 2)) * 1) ; where TWBR is 2 and Prescaler Value is 1
//        = CPUf/20
// So when:
//    CPU frequency (CPUf) = 8MHz, SCLf will equal 400kHz
//    CPU frequency (CPUf) = 4MHz, SCLf will equal 200kHz
//    CPU frequency (CPUf) = 2MHz, SCLf will equal 100kHz
//    CPU frequency (CPUf) = 1MHz, SCLf will equal  50kHz
#define TWI_TWBR 2
#endif // F_CPU >= 1600000UL && F_TWI <= F_TWI_400_KHZ && F_TWI >= F_TWI_100_KHZ
#endif // TWI_TWBR

/***********************************************************************************************************
 * Two Wire Interface pull up resistor configuration
 ***********************************************************************************************************/
#ifndef TWI_USE_INTERNAL_PULL_UP
#define TWI_USE_INTERNAL_PULL_UP false
#endif

/***********************************************************************************************************
 * Define send / recv buffer size
 ***********************************************************************************************************/
#ifndef TWI_BUFFER_LENGTH
#define TWI_BUFFER_LENGTH 16
#endif

/***********************************************************************************************************
 * Timeout period
 ***********************************************************************************************************/
// The spec http://smbus.org/specs/SMBus_3_1_20180319.pdf (page 17 - SMBus AC specifications)
// defines 25ms minimum for 100KHz, 400KHz and 1MHZ bus speeds
#ifndef TWI_TIMEOUT_PERIOD
#define TWI_TIMEOUT_PERIOD 25
#endif

/***********************************************************************************************************
 * Define result codes
 ***********************************************************************************************************/
#define TWI_RESULT_OK 0
#define TWI_RESULT_UNKNOWN_ERROR 1
#define TWI_RESULT_TIMEOUT 2
#define TWI_RESULT_ADDRESS_NAK_RECEIVED 3
#define TWI_RESULT_DATA_NAK_RECEIVED 4
#define TWI_RESULT_SEND_OVERFLOW 5
#define TWI_RESULT_INVALID_STATE 6
#define TWI_RESULT_NOT_IDLE 7
#define TWI_RESULT_NOT_PENDING_REP_START 8

/***********************************************************************************************************
 * The possible state modes the twi machine can be in.
 ***********************************************************************************************************/
#define TWI_STATE_MST 0x10 // In master mode
#define TWI_STATE_SLV 0x20 // In slave mode
#define TWI_STATE_RX 0x01  // In read mode
#define TWI_STATE_TX 0x02  // In write mode

// The possible states the twi machine can be in.
// It can only be in one of these states at a time (they are all mutally exclusive).
#define TWI_STATE_IDLE 0x00                             // TWI is currently idle
#define TWI_STATE_MST_TX (TWI_STATE_MST | TWI_STATE_TX) // TWI is in master transmit mode
#define TWI_STATE_MST_RX (TWI_STATE_MST | TWI_STATE_RX) // TWI is in master receive mode
#define TWI_STATE_SLV_TX (TWI_STATE_SLV | TWI_STATE_TX) // TWI is in slave transmit mode
#define TWI_STATE_SLV_RX (TWI_STATE_SLV | TWI_STATE_RX) // TWI is in slave receive mode

/***********************************************************************************************************
 * TWI status codes (all but TWI_NO_ERROR taken from the ATmega328p datasheet)
 ***********************************************************************************************************/
#define TWI_BUS_ERROR 0x00       // Bus error due to an illegal START or STOP condition
#define TWI_START 0x08           // A START condition has been transmitted (for both SLA+W and SLA+R)
#define TWI_RESTART 0x10         // A repeated START condition has been transmitted (for both SLA+W and SLA+R)
#define TWI_MT_SLAW_ACK 0x18     // SLA+W has been transmitted; ACK has been received
#define TWI_MT_SLAW_NAK 0x20     // SLA+W has been transmitted; NOT ACK has been received
#define TWI_MT_DATA_ACK 0x28     // Data byte has been transmitted; ACK has been received (Master Write)
#define TWI_MT_DATA_NAK 0x30     // Data byte has been transmitted; NOT ACK has been received (Master Write)
#define TWI_M_ARB_LOST 0x38      // Arbitration lost in SLA+W/R, data bytes or NAK bit (for both master SLA+W and SLA+R)
#define TWI_MR_SLAR_ACK 0x40     // SLA+R has been transmitted; ACK has been received
#define TWI_MR_SLAR_NAK 0x48     // SLA+R has been transmitted; NOT ACK has been received
#define TWI_MR_DATA_ACK 0x50     // Data byte has been received; ACK has been returned (Master Read)
#define TWI_MR_DATA_NAK 0x58     // Data byte has been transmitted; NOT ACK has been received (master Read)
#define TWI_SR_SLAW_ACK 0x60     // Own SLA+W has been received; ACK has been returned
#define TWI_SR_ARB_LOST 0x68     // Arbitration lost in SLA+R/W as Master; own SLA+W has been received; ACK has been returned
#define TWI_SR_GEN_CALL_RX 0x70  // General call address has been received; ACK has been returned
#define TWI_SR_GEN_ARB_LOST 0x78 // Arbitration lost in SLA+R/W as Master; General call address has been received; ACK has been returned
#define TWI_SR_OWN_SLAR_ACK 0x80 // Previously addressed with own SLA+W; data has been received; ACK has been returned
#define TWI_SR_OWN_SLAR_NAK 0x88 // Previously addressed with own SLA+W; data has been received; NOT ACK has been returned
#define TWI_SR_GEN_CALL_ACK 0x90 // Previously addressed with general call; data has been received; ACK has been returned
#define TWI_SR_GEN_CALL_NAK 0x98 // Previously addressed with general call; data has been received; NOT ACK has been returned
#define TWI_SR_STOP_REP 0xA0     // A STOP condition or repeated START condition has been received while still addressed as Slave
#define TWI_ST_OWN_SLAR_ACK 0xA8 // Own SLA+R has been received; ACK has been returned
#define TWI_ST_OWN_SLAR_NAK 0xB0 // Arbitration lost in SLA+R/W as Master; own SLA+R has been received; ACK has been returned
#define TWI_ST_DATA_ACK 0xB8     //  Data byte in TWDR has been transmitted; ACK has been received
#define TWI_ST_DATA_NAK 0xC0     // Data byte in TWDR has been transmitted; NOT ACK has been received
#define TWI_ST_LAST_BYTE_TX 0xC8 // Last data byte in TWDR has been transmitted (TWEA = "0"); ACK has been received
#define TWI_UNK_ERROR 0xF8       // No relevant state information available; TWINT = "0"
#define TWI_NO_ERROR 0xFF        // Code indicates no current error (this is not defined in datasheet, arbitarily picked)

/***********************************************************************************************************
 * Public functions
 ***********************************************************************************************************/
void TwiInit();
void TwiCleanup();
void TwiReset();
uint8_t TwiWaitForState(uint8_t wait_state, uint32_t timeout_period);
void TwiSetSlaveDeviceAddress(uint8_t address, uint8_t answer_general_call);

uint8_t TwiGetState();
uint8_t TwiGetError();
uint8_t TwiClearError();

uint8_t TwiCopyReadData(uint8_t *buffer, uint8_t len);

uint8_t TwiMasterDeviceWrite(uint8_t dev_addr, uint8_t *tx_data, int tx_len, void (*finishedCallback)(void));
uint8_t TwiMasterDeviceRead(uint8_t dev_addr, uint8_t *tx_data, int tx_len, uint8_t *rx_data, uint8_t rx_len, void (*finishedCallback)(void));

uint8_t TwiSlaveDeviceWrite(uint8_t *data, int data_len);

#endif // __TWI_H__