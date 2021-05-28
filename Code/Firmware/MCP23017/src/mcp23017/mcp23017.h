#ifndef __MCP23017_H__
#define __MCP23017_H__

#include "common.h"

#define MCP23017_ADDRESS 0x20 // MCP23017 Address

// registers
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

#define MCP23017_INT_ERR 255 // Interrupt error

bool Mcp23017Init(uint8_t dev_addr);
uint8_t Mcp23017WriteRegister(uint8_t dev_addr, uint8_t reg_addr, uint8_t reg_value, bool wait);
uint8_t Mcp23017ReadRegister(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data, uint8_t data_len, bool send_stop, bool wait);

#endif // __MCP23017_H__