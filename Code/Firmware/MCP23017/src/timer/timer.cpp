#include <avr/io.h>
#include <avr/interrupt.h>

#include "common.h"

#define ONE_MILLION 1000000L
#define TIMER0_PRESCALER 64L

// Calculate the number of microseconds per overflow tick (timer 0 overflow).
// This should equate to 1024 for 16MHz clock
#define MICROSECONDS_PER_TIMER0_OVF_TICK (ONE_MILLION / (F_CPU / 1L / TIMER0_PRESCALER / 256L))
#if (MICROSECONDS_PER_TIMER0_OVF_TICK) != 1024L
#warning "MICROSECONDS_PER_TIMER0_OVF_TICK calculated value incorrect! Expected 1024 when using 16MHz clock!"
#endif

// Calculate the number of microseconds per TCNT0 tick.
// This should equate to 4 for 16MHz clock
#define MICROSEONDS_PER_TCNT0_TICK (TIMER0_PRESCALER / (F_CPU / ONE_MILLION))
#if (MICROSEONDS_PER_TCNT0_TICK) != 4L
#warning "MICROSEONDS_PER_TCNT0_TICK calculated value incorrect! Expected 4 when using 16MHz clock!"
#endif

static volatile uint32_t timer0_overflow_count = 0;

void TimerInit()
{
    /********************************************************************************************************************************
     * Initialise timer 0 - Timer 0 is used as the internal tick counter at a known rate (frequency).
     *                      Is is calculated as:
     *                      = F_CPU / System Clock Prescaler / Timer Prescaler / 8 bit overflow
     *                      = 16MHz / 1 / 64 / 256
     *                      = 976.5625Hz (or every 0.001024s, 1.024ms)
     *                      This provides a tick about every 1ms, with TCNT0 incrementing every 4us
     ********************************************************************************************************************************/

    // Set prescaler to 64: CS02 = 0, CS01 = 1, CS00 = 1
    TCCR0B |= (0 << CS02 | 1 << CS01 | 1 << CS00);

    // Enable timer 0 interrupt on overflow
    // The ISR will be called every time the timer counter value (TCNT0) overflows
    // (ie the TOV0 bit in the TIFR0 is set when TCNT0 rolls over from 255 to 0).
    _SB(TIMSK0, TOIE0);
}

uint32_t TimerMilliTicks()
{
    // Save SREG including the global interrupt bit
    uint8_t save_sreg = SREG;

    // Disable interrupts while reading the count registers
    // so that the count values are consistent (not changed by interrupt mid stream)
    cli();

    // Capture ticks value while interrupt disabled
    uint32_t ticks = timer0_overflow_count;

    // Re-enable interrupts now that we have snapshotted count values
    // so we do not need to explicity call sei() if interrupts were peviously enabled
    SREG = save_sreg;

    // Return the ticks snapshotted value
    return ticks;
}

uint32_t TimerMicroTicks()
{
    // Save SREG including the global interrupt bit
    uint8_t save_sreg = SREG;

    // Disable interrupts while reading the count registers
    // so that the count values are consistent (not changed by an interrupt mid read)
    cli();

    // Capture the current count values
    uint32_t overflow_count = timer0_overflow_count;
    uint8_t count = TCNT0;

    // Re-enable interrupts now that we have snapshotted count values
    // so we do not need to explicity call sei() if interrupts were peviously enabled
    SREG = save_sreg;

    // Return the count as a long value, high 24 bits are overflow count
    // and low 8 bits are TCNT0 value. Multiply by the number of us per TCNT0 tick
    return ((overflow_count << 8) + count) * MICROSEONDS_PER_TCNT0_TICK;
}

uint8_t TimerCheckForTimeout(uint32_t start_tick, uint32_t timeout_period)
{
    // Note using subtraction works even for rolloved over ticks using 'unsigned' value maths
    uint32_t now_tick = TimerMilliTicks();
    uint32_t delta_ticks = now_tick - start_tick;

    // Have we timed out?
    if (delta_ticks > timeout_period)
    {
        // We have timed out
        return true;
    }

    // We have not yet timed out
    return false;
}

ISR(TIMER0_OVF_vect)
{
    // This interrupt occurs every 1024us (approx) as per prescaler and clock source configurations

    // Timer 0 overflow interrupt occurred (TOV0 flag in TIFR0 register was set)
    // The TOV0 flag is automatically reset when this ISR is called, so we do not need to
    // manually reset it.

    // Increment the overflow counter
    timer0_overflow_count++;
}
