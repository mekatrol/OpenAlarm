#include <avr/pgmspace.h>

#include "common.h"
#include "mcp23017.h"
#include "twi.h"

extern volatile uint8_t debug;

bool Mcp23017Init(uint8_t dev_addr)
{
  // Set port A to outputs
  if (Mcp23017WriteRegister(dev_addr, MCP23017_IODIRA, 0x00, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  // Set port B to inputs
  if (Mcp23017WriteRegister(dev_addr, MCP23017_IODIRB, 0xFF, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  // Disable interrupt triggers
  if (Mcp23017WriteRegister(dev_addr, MCP23017_GPINTENA, 0x00, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  if (Mcp23017WriteRegister(dev_addr, MCP23017_GPINTENB, 0x00, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  // Disable port a pull up resistors
  if (Mcp23017WriteRegister(dev_addr, MCP23017_GPPUA, 0x00, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  // Enable port B pullup resistors
  if (Mcp23017WriteRegister(dev_addr, MCP23017_GPPUB, 0xFF, true) == 0)
  {
    // If an error occurred no point continuing
    return false;
  }

  return true;
}

uint8_t Mcp23017Write(uint8_t dev_addr, uint8_t *data, uint8_t data_len, bool send_stop, bool wait_for_state, uint8_t wait_state, void (*finishedCallback)(void))
{
  // Write to TWI
  uint8_t len_buffered = TwiMasterDeviceWrite(MCP23017_ADDRESS | dev_addr, data, data_len, finishedCallback);

  // Was there an issue buffering the data?
  if (len_buffered == 0)
  {
    // Return 0 to indicate there was an issue (the caller should check the TWI error value)
    return 0;
  }

  // If caller wants to wait then wait for the appropriate state
  if (wait_for_state)
  {
    // Block and wait for specified state while transmitting (waiting for up to 50ms)
    if (TwiWaitForState(TWI_STATE_IDLE, TWI_TIMEOUT_PERIOD) != TWI_RESULT_OK)
    {
      // Failed to wait for specified state
      return 0;
    }

    // Even though the wait for idle was successful, the operation may have still failed
    // so return 0 if there is an error flagged
    if (TwiGetError() != TWI_NO_ERROR)
    {
      return 0;
    }
  }

  // Return the buffered length (this will also be the sent length if the caller waited for the state)
  return len_buffered;
}

uint8_t Mcp23017WriteRegister(uint8_t dev_addr, uint8_t reg_addr, uint8_t reg_value, bool wait)
{
  uint8_t data[2];
  data[0] = reg_addr;
  data[1] = reg_value;

  // Write to TWI, data is made up of the register address and the register value
  // We set send_stop to true to release the bus, and don't need a callback when done
  uint8_t count = Mcp23017Write(MCP23017_ADDRESS | dev_addr, data, 2, true, wait, TWI_STATE_IDLE, nullptr);

  return count;
}

uint8_t Mcp23017ReadRegister(uint8_t dev_addr, uint8_t reg_addr, uint8_t *rx_buffer, uint8_t rx_len, bool send_stop, bool wait)
{
  // Initiate the read and get the number of bytes pending read (should match rx_len).
  //  0 is returned to indicate an error.
  uint8_t rx_len_pending = TwiMasterDeviceRead(
      MCP23017_ADDRESS | dev_addr, // The device address
      &reg_addr, 1,                // The command to write (ie, the register address)
      rx_buffer, rx_len,           // The receive buffer and expecte length
      nullptr);                    // No callback needed

  if (rx_len_pending == 0)
  {
    // Return 0 to indicate there was an issue (the caller should check the TWI error value)
    return 0;
  }

  // If caller wants to wait then wait for the appropriate state
  if (wait)
  {
    // Block and wait for specified state while transmitting (waiting for up to 50ms)
    if (TwiWaitForState(TWI_STATE_IDLE, TWI_TIMEOUT_PERIOD) != TWI_RESULT_OK)
    {
      // Failed to wait for specified state
      return 0;
    }

    // Even though the wait for idle was successful, the operation may have still failed
    // so return 0 if there is an error flagged
    if (TwiGetError() != TWI_NO_ERROR)
    {
      return 0;
    }
  }

  return rx_len_pending;
}

// uint8_t McpReadRegister(uint8_t dev_addr, uint8_t reg_addr)
// {
//   return TwiBufferRx(MCP23017_ADDRESS | dev_addr, reg_addr, true);
// }

// void McpUpdateRegisterBit(uint8_t dev_addr, uint8_t port, uint8_t io_number, uint8_t io_value)
// {
//   // Read the current register values
//   uint8_t port_value = McpReadRegister(dev_addr, port);

//   // Set the bit value for the pin
//   BitWrite(port, io_number, io_value);

//   // Write the values back to the device
//   Mcp23017WriteRegister(dev_addr, port, port_value);
// }

// void Mcp23017PinMode(uint8_t dev_addr, uint8_t port, uint8_t io_number, uint8_t io_mode)
// {
//   McpUpdateRegisterBit(dev_addr, port, io_number, (io_mode == INPUT));
// }

// void Mcp23017WritePin(uint8_t dev_addr, uint8_t port, uint8_t io_number, uint8_t io_value)
// {
//   // Assume port A latch
//   uint8_t latch = MCP23017_OLATA;

//   // Change to port B latch if writing to port B
//   if (port == MCP23017_GPIOB)
//   {
//     latch = MCP23017_OLATB;
//   }

//   // Get the current output latch values
//   uint8_t gpio = 0; //McpReadRegister(dev_addr, latch);

//   // Set the specified IO number in the latch value
//   BitWrite(gpio, io_number, io_value);

//   // Update the output latch
//   Mcp23017WriteRegister(dev_addr, port, gpio);
// }

// uint8_t Mcp23017ReadPin(uint8_t dev_addr, uint8_t port, uint8_t io_number)
// {
//   return McpReadRegister(dev_addr, port);
// }

// uint8_t McpBitForPin(uint8_t pin);
// uint8_t McpRegisterForPin(uint8_t pin, uint8_t port_a_addr, uint8_t port_b_addr);

// uint8_t McpReadRegister(uint8_t dev_addr, uint8_t reg_addr);

// void McpUpdateRegisterBit(uint8_t dev_addr, uint8_t port, uint8_t pin, uint8_t pin_value);

// uint8_t McpBitForPin(uint8_t pin) { return pin % 8; }

// uint8_t McpRegisterForPin(uint8_t pin, uint8_t port_a_addr, uint8_t port_b_addr)
// {
//   return (pin < 8) ? port_a_addr : port_b_addr;
// }

// uint16_t mcp_read_gpio_ab(uint8_t dev_addr)
// {
//   uint8_t rx_buffer[2];
//   TwiBufferRx(MCP23017_ADDRESS | dev_addr, (uint8_t)MCP23017_GPIOA, rx_buffer, sizeof(rx_buffer), true);

//   uint16_t ba = rx_buffer[0] << 8 | rx_buffer[1];

//   return ba;
// }

// uint8_t mcp_read_gpio(uint8_t dev_addr, uint8_t b)
// {
//   uint8_t reg_addr;

//   if (b == 0)
//   {
//     reg_addr = MCP23017_GPIOA;
//   }
//   else
//   {
//     reg_addr = MCP23017_GPIOB;
//   }

//   uint8_t rx_buffer[1];
//   TwiBufferRx(MCP23017_ADDRESS | dev_addr, reg_addr, rx_buffer, sizeof(rx_buffer), true);

//   return rx_buffer[0];
// }

// void mcp_write_gpio_ab(uint8_t dev_addr, uint16_t ba)
// {
//   TwiBufferTx(MCP23017_ADDRESS | dev_addr, MCP23017_GPIOA, ba, false, true);
// }

// void McpSetupInterrupts(uint8_t dev_addr, uint8_t mirroring, uint8_t openDrain, uint8_t polarity)
// {
//   // configure the port A
//   uint8_t ioconfValue = McpReadRegister(dev_addr, MCP23017_IOCONA);
//   BitWrite(ioconfValue, 6, mirroring);
//   BitWrite(ioconfValue, 2, openDrain);
//   BitWrite(ioconfValue, 1, polarity);
//   Mcp23017WriteRegister(dev_addr, MCP23017_IOCONA, ioconfValue);

//   // Configure the port B
//   ioconfValue = McpReadRegister(dev_addr, MCP23017_IOCONB);
//   BitWrite(ioconfValue, 6, mirroring);
//   BitWrite(ioconfValue, 2, openDrain);
//   BitWrite(ioconfValue, 1, polarity);
//   Mcp23017WriteRegister(dev_addr, MCP23017_IOCONB, ioconfValue);
// }
