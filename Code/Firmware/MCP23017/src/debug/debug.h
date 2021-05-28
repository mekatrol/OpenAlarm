#ifndef __DEBUG_H__
#define __DEBUG_H__

#include <inttypes.h>

void DebugReset();
void DebugReset(uint8_t start_byte);
void DebugAdd(uint8_t value);
void DebugAdd(uint8_t *values, int len);
void DebugAdd32(uint32_t value);
void DebugAddMilliTicks();
void DebugDump();

#endif // __DEBUG_H__