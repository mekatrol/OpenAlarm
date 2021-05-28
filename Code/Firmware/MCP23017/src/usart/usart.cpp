#include <avr/interrupt.h>

#include "usart.h"

// The rx buffer is a circular buffer
static uint8_t _rx_buffer[USART_BUFFER_SIZE];
static volatile uint8_t _rx_buffer_tail;
static volatile uint8_t _rx_buffer_head;
static volatile bool _rx_buffer_overrun;

// The transmit buffer is a straight buffer
static uint8_t _tx_buffer[USART_BUFFER_SIZE];
static volatile uint8_t _tx_buffer_index;
static volatile uint8_t _tx_buffer_length;

static void (*RxEndCallback)(void);
static void (*TxEndCallback)(void);

void UsuartFlush(void)
{
    // The uART may need flushing if there was an error, in
    // which case we just read the UDR until the RXC flag is clear
    uint8_t nop;
    while (UCSR0A & (1 << RXC0))
    {
        nop = UDR0;
    }
}

void UsartResetRx()
{
    _rx_buffer_tail = 0;
    _rx_buffer_head = 0;
    _rx_buffer_overrun = false;

    UsuartFlush();
}

void UsartResetTx()
{
    _tx_buffer_index = 0;
    _tx_buffer_length = 0;
}

void UsartInit()
{
    // Set baud rate
    UBRR0H = (uint8_t)(UBRR >> 8);
    UBRR0L = (uint8_t)UBRR;

    // Enable receiver and transmitter (with interrupts)
    UCSR0B = (1 << RXEN0) | (1 << TXEN0) | (1 << RXCIE0) | (1 << TXCIE0);

    // Set frame format to N81
    UCSR0C = (3 << UCSZ00);

    // Set RTS to output and turn off (ready for receiving)
    DDRB |= (1 << PORTB0);
    PORTB &= ~(1 << PORTB0);

    UsartResetRx();
    UsartResetTx();
}

bool UsartTransmitReady()
{
    // Return tru if empty transmit buffer
    return (UCSR0A & (1 << UDRE0));
}

void UsartTransmit(uint8_t *data, uint8_t data_len)
{
    // Wait for empty transmit buffer (in case previously transmitting)
    while (!UsartTransmitReady())
    {
    }

    uint8_t save_sreg = SREG;
    uint8_t i = 0;
    cli();

    // Set RTS line
    PORTB |= (1 << PORTB0);

    // Reset tx buffer
    _tx_buffer_index = 1; // Skip first byte in buffer we will manually send
    _tx_buffer_length = data_len;

    // Queue transmit buffer
    for (uint8_t i = 0; i < data_len; i++)
    {
        _tx_buffer[i] = data[i];
    }

    SREG = save_sreg;

    // Transmit the first byte, this will trigger the remaining bytes to
    // be sent once the transmit interrupt is triggered
    UDR0 = _tx_buffer[0];
}

bool UsartReceiveReady()
{
    // Return true is received data ready
    return (UCSR0A & (1 << RXC0));
}

uint8_t UsartReceive()
{
    // Wait for data to be received
    while (!UsartReceiveReady())
    {
    }

    // Get and return received data from buffer
    return UDR0;
}

bool UsartRxAvailable()
{
    // If the tail has not caught the head then there are bytes available
    return _rx_buffer_tail != _rx_buffer_head;
}

bool UsartTxSending()
{
    // Return the number of bytes still to transmit in the tx buffer
    return _tx_buffer_index < _tx_buffer_length;
}

uint8_t UsartGetRxData(uint8_t *buffer)
{
    bool rx_available = false;
    uint8_t save_sreg = SREG;
    uint8_t i = 0;
    cli();

    while (_rx_buffer_tail != _rx_buffer_head)
    {
        buffer[i++] = _rx_buffer[_rx_buffer_tail];

        // Have we circled past end of buffer, if so reset to begining
        if (++_rx_buffer_tail >= USART_BUFFER_SIZE)
        {
            _rx_buffer_tail = 0;
        }
    }

    SREG = save_sreg;
    return i;
}

bool UsartGetNextRxByte(uint8_t *byte, uint8_t offset)
{
    bool rx_available = false;
    uint8_t save_sreg = SREG;
    cli();

    if (_rx_buffer_tail != _rx_buffer_head)
    {
        byte[offset] = _rx_buffer[_rx_buffer_tail];
        rx_available = true;

        // Have we circled past end of buffer, if so reset to begining
        if (++_rx_buffer_tail >= USART_BUFFER_SIZE)
        {
            _rx_buffer_tail = 0;
        }
    }

    SREG = save_sreg;
    return rx_available;
}

void UsartSetRxEndCallback(void (*function)(void))
{
    RxEndCallback = function;
}

void UsartSetTxEndCallback(void (*function)(void))
{
    TxEndCallback = function;
}

ISR(USART_RX_vect)
{
    // Read UDR register to reset received flag
    unsigned char data = UDR0;

    // Check for error (Frame Error, Data Overrun & Parity Error)
    if ((UCSR0A & ((1 << FE0) | (1 << DOR0) | (1 << UPE0))) == 0)
    {
        // Add the received byte to the head of the buffer
        _rx_buffer[_rx_buffer_head] = data;

        // Reset to zero if head has passed end of buffer
        if (++_rx_buffer_head >= USART_BUFFER_SIZE)
        {
            _rx_buffer_head = 0;
        }

        if (RxEndCallback)
        {
            if (data == '#')
            {
                RxEndCallback();
            }
        }

        // Check if head caught tail
        if (_rx_buffer_head == _rx_buffer_tail)
        {
            // We have caught the tail so an overrun has occurred
            _rx_buffer_overrun = true;
        }
    }
}

ISR(USART_TX_vect)
{
    if (_tx_buffer_index < _tx_buffer_length)
    {
        // Transmit next byte, this will trigger the remaining bytes to
        // be sent once the transmit interrupt is triggered
        UDR0 = _tx_buffer[_tx_buffer_index];
        _tx_buffer_index++;

        return;
    }

    // Transmit complete, clear RTS line and reset buffer
    PORTB &= ~(1 << PORTB0);
    _tx_buffer_index = 0;
    _tx_buffer_length = 0;

    if (TxEndCallback)
    {
        TxEndCallback();
    }
}
