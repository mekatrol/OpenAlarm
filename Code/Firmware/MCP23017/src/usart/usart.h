#ifndef __USART_H__
#define __USART_H__

#include <avr/io.h>

#include "common.h"

#ifndef USART_BUFFER_SIZE
#define USART_BUFFER_SIZE 255
#endif

#if USART_BUFFER_SIZE >= 256
#error "The maximum USART buffer size supported in 255 bytes"
#endif

#ifndef USART_BAUD
#define USART_BAUD 115200
#endif
const uint16_t UBRR = (F_CPU / 16) / (USART_BAUD - 1);

void UsartInit();
void UsartResetRx();
void UsartTransmit(uint8_t *data, uint8_t data_len);

uint8_t UsartGetRxData(uint8_t *buffer);
bool UsartGetNextRxByte(uint8_t *byte, uint8_t offset);
bool UsartTxSending();

void UsartSetRxEndCallback(void (*)(void));
void UsartSetTxEndCallback(void (*function)(void));

#endif // __USART_H__