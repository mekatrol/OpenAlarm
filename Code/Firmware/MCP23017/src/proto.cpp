#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include "common.h"
#include "timer.h"
#include "mcp23017.h"
#include "mcp23017raw.h"
#include "twi.h"
#include "usart.h"

#define MCP23017_ADDR 0

#define USE_RAW_MCP23017 0

volatile uint8_t _rx_end_character_rxd = false;
volatile uint8_t _tx_end_character_txd = true;

void ProcessRxData();
static void RxEndCallback(void);
static void TxEndCallback(void);

void ErrorMode()
{
    while (true)
    {
        PORTB |= (1 << PORTB1);
        PORTB &= ~(1 << PORTB2);
        _delay_ms(500);
        PORTB &= ~(1 << PORTB1);
        PORTB |= (1 << PORTB2);
        _delay_ms(500);
    }
}

int main(void)
{
    // Set PORTD4 to input with pull up
    DDRD &= ~(1 << PORTD4); // Input
    PORTD |= (1 << PORTD4); // Pullup

    TimerInit();
    UsartInit();

    UsartSetRxEndCallback(RxEndCallback);
    UsartSetTxEndCallback(TxEndCallback);

    sei();

    DDRB |= (1 << PORTB1);
    DDRB |= (1 << PORTB2);
    PORTB &= ~(1 << PORTB1);
    PORTB &= ~(1 << PORTB2);

    if (!USE_RAW_MCP23017)
    {
        // Initialise two wire bus using no slave address
        TwiInit();

        // Initialise Mcp device with address pins A0,A1,A2 set to 0
        if (!Mcp23017Init(MCP23017_ADDR | 0 /* address pins can set address to any of 0 to 7 */))
        {
            ErrorMode();
        }

        // Set port A pin value
        Mcp23017WriteRegister(MCP23017_ADDR, MCP23017_GPIOA, 0x12, true);
    }

    while (1)
    {
        if (USE_RAW_MCP23017)
        {
            Mcp23017Raw();
            _delay_ms(2000);
            continue;
        }

        uint8_t port_b = 0xAA;
        uint8_t read_len = Mcp23017ReadRegister(MCP23017_ADDR, MCP23017_GPIOB, &port_b, 1, true, true);
        if (read_len != 0)
        {
            if (Mcp23017WriteRegister(MCP23017_ADDR, MCP23017_GPIOA, port_b, true) == 0)
            {
                _delay_ms(500);

                uint8_t error = TwiGetError();
                uint8_t state = TwiGetState();

                DebugReset(0xFF);
                DebugAdd(error);
                DebugAdd(state);
                DebugDump();
            }
        }
        else
        {
            _delay_ms(500);

            uint8_t error = TwiGetError();
            uint8_t state = TwiGetState();

            DebugReset(0xFF);
            DebugAdd(error);
            DebugAdd(state);
            DebugDump();
            TwiReset();
            ErrorMode();
        }
        _delay_ms(200);

        // uint8_t sw_on = BitRead(PIND, PORTD4);
        //if (sw_on == 0)
        // {
        //     Mcp23017Raw();
        // }

        // int8_t io_number = 7;
        // while (io_number > 0)
        // {
        //     Mcp23017WritePin(MCP23017_ADDR, MCP23017_GPIOA, io_number, 1);
        //     ProcessRxData();
        //     _delay_ms(100);
        //     io_number--;
        // }

        // io_number = 0;

        // while (io_number < 7)
        // {
        //     Mcp23017WritePin(MCP23017_ADDR, MCP23017_GPIOA, io_number, 1);
        //     ProcessRxData();
        //     _delay_ms(100);
        //     io_number++;
        // }

        // ProcessRxData();

        // if (_tx_end_character_txd)
        // {
        //     _tx_end_character_txd = false;
        // }

        // _delay_ms(1000);
    }

    return 0;
}

static void RxEndCallback(void)
{
    _rx_end_character_rxd = true;
}

static void TxEndCallback(void)
{
    _tx_end_character_txd = true;
}

void ProcessRxData()
{
    if (_rx_end_character_rxd)
    {
        _rx_end_character_rxd = false;

        uint8_t buffer[USART_BUFFER_SIZE + 1];
        uint8_t len = UsartGetRxData(buffer);
        // while (UsartGetNextRxByte((uint8_t *)buffer, i++))
        // {
        // }

        if (len > 0)
        {
            UsartTransmit(buffer, len);
            UsartResetRx();
        }
    }
}
