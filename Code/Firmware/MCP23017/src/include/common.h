#ifndef __COMMON_H__
#define __COMMON_H__

#include "debug.h"

#ifndef F_CPU
#define F_CPU 16000000
#endif

#define false 0x0
#define true 0x1

#define LOW 0
#define HIGH 1
#define CHANGE 1
#define FALLING 2
#define RISING 3

#define INPUT 0x0
#define OUTPUT 0x1
#define INPUT_PULLUP 0x2

// Macros to clear/set bit in register
#define _CB(register, bit) (_SFR_BYTE(register) &= ~_BV(bit))
#define _SB(register, bit) (_SFR_BYTE(register) |= _BV(bit))

#define BitRead(value, bit) (((value) >> (bit)) & 0x01)
#define BitSet(value, bit) ((value) |= (1 << (bit)))
#define BitClear(value, bit) ((value) &= ~(1 << (bit)))
#define BitToggle(value, bit) ((value) ^= (1 << (bit)))
#define BitWrite(value, bit, bitvalue) ((bitvalue) ? BitSet(value, bit) : BitClear(value, bit))

#endif // __COMMON_H__