#include <inttypes.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#include "debug.h"
#include "mcp23017raw.h"
#include "usart.h"

#define MCP23017_ADDRESS 0x20 // MCP23017 Address

// Port A registers
#define MCP23017_IODIRA 0x00   // I/O direction register A
#define MCP23017_IPOLA 0x02    // Input polarity port register A
#define MCP23017_GPINTENA 0x04 // Interrupt-on-change pins A
#define MCP23017_DEFVALA 0x06  // Default value register A
#define MCP23017_INTCONA 0x08  // Interrupt-on-change control register A
#define MCP23017_IOCONA 0x0A   // I/O expander configuration register A
#define MCP23017_GPPUA 0x0C    // GPIO pull-up resistor register A
#define MCP23017_INTFA 0x0E    // Interrupt flag register A
#define MCP23017_INTCAPA 0x10  // Interrupt captured value for port register A
#define MCP23017_GPIOA 0x12    // General purpose I/O port register A
#define MCP23017_OLATA 0x14    // Output latch register 0 A

// Port B registers
#define MCP23017_IODIRB 0x01   // I/O direction register B
#define MCP23017_IPOLB 0x03    // Input polarity port register B
#define MCP23017_GPINTENB 0x05 // Interrupt-on-change pins B
#define MCP23017_DEFVALB 0x07  // Default value register B
#define MCP23017_INTCONB 0x09  // Interrupt-on-change control register B
#define MCP23017_IOCONB 0x0B   // I/O expander configuration register B
#define MCP23017_GPPUB 0x0D    // GPIO pull-up resistor register B
#define MCP23017_INTFB 0x0F    // Interrupt flag register B
#define MCP23017_INTCAPB 0x11  // Interrupt captured value for port register B
#define MCP23017_GPIOB 0x13    // General purpose I/O port register B
#define MCP23017_OLATB 0x15    // Output latch register 0 B

#define MCP23017_INT_ERR 0xFF // Interrupt error

#define TWI_F 400000UL
#define TWI_TWBR ((F_CPU / TWI_F) - 16) / 2
#define TWI_ACK 1
#define TWI_NAK 0
#define TWI_READ 1
#define TWI_WRITE 0

uint8_t tx_buffer[32];
uint8_t rx_buffer[32];

void Mcp23017RawInit()
{
    // Disable two wire clock and data pin pullups
    PORTC &= ~(1 << PINC4 | 1 << PINC5);

    // Clear TWPS1 (b1) and TWPS0 (b2) [set to 0], making prescaler value = 1
    TWSR = ~((1 << TWPS0) | (1 << TWPS1));

    // Set the TWI bit rate register
    // It is calculated using:
    // SCL freq = F_CPU / (16 + 2 * TWBR * PrescalerValue)
    TWBR = TWI_TWBR;

    // Enable two wire interface (TWEN)
    // From data sheet:
    //   The TWEA bit must be written to one to enable the acknowledgement of the
    //   device’s own slave address or the general call address. TWSTA and TWSTO must be
    //   written to zero.
    TWCR = _BV(TWEN) | _BV(TWEA);
}

void Mcp23017RawCleanup()
{
    // Turn off the TWI enable bit, interrupt and address ACK response
    TWCR &= ~(_BV(TWEN) | _BV(TWIE) | _BV(TWEA));

    // Disable two wire clock and data pin pullups (return inputs to reset state)
    PORTC &= ~(1 << PINC4 | 1 << PINC5);
}

void Mcp23017RawWaitTwint()
{
    // The TWINT Flag is set in the following situations:
    //    * After the TWI has transmitted a START/REPEATED START condition.
    //    * After the TWI has transmitted SLA+R/W.
    //    * After the TWI has transmitted an address byte.
    //    * After the TWI has lost arbitration.
    //    * After the TWI has been addressed by own slave address or general call.
    //    * After the TWI has received a data byte.
    //    * After a STOP or REPEATED START has been received while still addressed as a Slave.
    //    * When a bus error has occurred due to an illegal START or STOP condition.
    while (!(TWCR & (1 << TWINT)))
        ;
}

uint8_t Mcp23017RawStart()
{
    TWCR = _BV(TWEN) | _BV(TWINT) | _BV(TWSTA) | _BV(TWEA);
    Mcp23017RawWaitTwint();
    return TWSR;
}

void Mcp23017RawStop()
{
    TWCR = _BV(TWEN) | _BV(TWINT) | _BV(TWSTO);

    // Wait for bus idle. A bus is considered idle when
    // both SCL and SDA lines are high
    while (!(PINC & ((1 << PORTC4) | (1 << PORTC5))))
        ;
}

void Mcp23017RawContinue(uint8_t setTwea)
{
    // TWI is enabled (TWEN)
    // Clear TWINT (by setting TWINT to 1), this initiates the transmit
    TWCR = _BV(TWEN) | _BV(TWINT) | ((setTwea & 0x01) << TWEA);
}

uint8_t Mcp23017RawSend(uint8_t data)
{
    TWDR = data;
    Mcp23017RawContinue(TWI_ACK);
    Mcp23017RawWaitTwint();
    return TWSR;
}

uint8_t Mcp23017RawSetRegister(uint8_t reg_addr, uint8_t data_value)
{
    uint8_t status;

    // Do start
    status = Mcp23017RawStart();
    DebugAdd(status);
    switch (status)
    {
    case 0x08: // A START condition has been transmitted
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send device address
    status = Mcp23017RawSend(MCP23017_ADDRESS << 1 | TWI_WRITE);
    DebugAdd(status);
    switch (status)
    {
    case 0x18: // SLA+W transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send data byte (register address)
    status = Mcp23017RawSend(reg_addr);
    DebugAdd(status);
    switch (status)
    {
    case 0x28: // SLA+W transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send data byte (register value)
    status = Mcp23017RawSend(data_value);
    DebugAdd(status);
    switch (status)
    {
    case 0x28: // Data transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Do stop
    Mcp23017RawStop();

    // Return the lasty valid status
    return status;
}

uint8_t Mcp23017RawRecv(uint8_t *buffer, uint8_t rx_len)
{
    uint8_t i = 0;
    while (i < rx_len)
    {
        // Tell TWI to continue in master rx mode
        Mcp23017RawContinue(TWI_ACK);

        // Wait for data to be ready
        Mcp23017RawWaitTwint();

        DebugAdd(TWSR);

        // Read data
        buffer[i++] = TWDR;
    }

    // Tell TWI slave end of read by sending a NAK
    Mcp23017RawContinue(TWI_NAK);

    // Wait for data to be ready
    Mcp23017RawWaitTwint();

    return i;
}

uint8_t Mcp23017RawReadRegister(uint8_t reg_addr, uint8_t *reg_value)
{
    uint8_t status;

    // Do start
    status = Mcp23017RawStart();
    DebugAdd(status);
    switch (status)
    {
    case 0x08: // A START condition has been transmitted
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send device address
    status = Mcp23017RawSend(MCP23017_ADDRESS << 1 | TWI_WRITE);
    DebugAdd(status);
    switch (status)
    {
    case 0x18: // SLA+W transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send data byte (register address)
    status = Mcp23017RawSend(reg_addr);
    DebugAdd(status);
    switch (status)
    {
    case 0x28: // SLA+W transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    status = Mcp23017RawStart(); // This is a restart
    DebugAdd(status);
    switch (status)
    {
    case 0x10: // A START condition has been transmitted
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    // Send device address
    status = Mcp23017RawSend(MCP23017_ADDRESS << 1 | TWI_READ);
    DebugAdd(status);
    switch (status)
    {
    case 0x40: // SLA+R transmitted, ACK recieved
        break;

    default:
        Mcp23017RawStop();
        return status;
    }

    uint8_t rx_len = Mcp23017RawRecv((uint8_t *)reg_value, 1);

    // Do stop
    Mcp23017RawStop();

    if (rx_len != 1)
    {
        DebugAdd(status);
    }
    else
    {
        DebugAdd(*reg_value);
    }

    // Return last good status
    return status;
}

void Mcp23017Raw()
{
    uint8_t status;

    // Init
    Mcp23017RawInit();

    // Set port A to all outputs
    status = Mcp23017RawSetRegister(MCP23017_IODIRA /* We are setting the port A direction register */, 0x00 /* outputs */);

    // Turn port B pull up
    status = Mcp23017RawSetRegister(MCP23017_GPPUB /* We are setting the port B pullup values */, 0xFF /* value */);

    // Turn port A outputs on
    status = Mcp23017RawSetRegister(MCP23017_GPIOA /* We are setting the port A values */, 0x00 /* value */);

    DebugReset(0xAA);

    // Read port B register
    uint8_t portB;
    status = Mcp23017RawReadRegister(MCP23017_GPIOB, &portB);

    // Turn port A outputs on (from port B)
    status = Mcp23017RawSetRegister(MCP23017_GPIOA /* We are setting the port A values */, portB /* value */);

    DebugDump();

    // Cleanup
    Mcp23017RawCleanup();
}