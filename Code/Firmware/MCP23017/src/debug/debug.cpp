#include <avr/interrupt.h>
#include <util/delay.h>

#include "debug.h"
#include "timer.h"
#include "usart.h"

#define DEBUG_BUFFER_SIZE 100

static volatile uint8_t _debug_buffer[DEBUG_BUFFER_SIZE + 1];
static volatile uint8_t _debug_buffer_index;

void DebugReset(uint8_t start_byte)
{
    uint8_t save_sreg = SREG;
    cli();
    _debug_buffer[0] = start_byte;
    _debug_buffer_index = 1;
    SREG = save_sreg;
}

void DebugInternalAdd(uint8_t value)
{
    // Don't overflow!
    if (_debug_buffer_index <= DEBUG_BUFFER_SIZE)
    {
        _debug_buffer[_debug_buffer_index] = value;
        _debug_buffer_index++;
    }
}

void DebugAdd(uint8_t value)
{
    uint8_t save_sreg = SREG;
    cli();
    DebugInternalAdd(value);
    SREG = save_sreg;
}

void DebugAdd(uint8_t *values, int len)
{
    uint8_t i = 0;
    uint8_t save_sreg = SREG;
    cli();
    while (i < len)
    {
        DebugInternalAdd(values[i++]);
    }
    SREG = save_sreg;
}

void DebugAdd32(uint32_t value)
{
    uint8_t save_sreg = SREG;
    cli();
    DebugInternalAdd(((value >> 24) & 0xFF));
    DebugInternalAdd(((value >> 16) & 0xFF));
    DebugInternalAdd(((value >> 8) & 0xFF));
    DebugInternalAdd(((value >> 0) & 0xFF));
    SREG = save_sreg;
}

void DebugAddMilliTicks()
{
    DebugAdd32(TimerMilliTicks());
}

void DebugDump()
{
    uint8_t save_sreg = SREG;
    cli();

    _debug_buffer[_debug_buffer_index++] = '\r';

    uint8_t tmp_buffer[DEBUG_BUFFER_SIZE + 1];
    uint8_t i = 0;

    while (i < _debug_buffer_index)
    {
        tmp_buffer[i] = _debug_buffer[i];

        i++;
    }

    // Reset to start
    _debug_buffer_index = 1;

    SREG = save_sreg;

    UsartTransmit((uint8_t *)tmp_buffer, i);

    _delay_ms(100);
}