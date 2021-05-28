.DEFAULT_GOAL := Burn

#Main application file name
MAIN_APP = proto

#Main hex file path in windows format
MAIN_HEX_PATH = $(MAIN_APP).hex

# Compiler and other Section
CC = avr-g++
OBJCOPY = avr-objcopy.exe
AVRDUDE := "${AVRDUDE_EXE_PATH}/avrdude.exe"
MCU = atmega328p

#Options for avr-gcc
CFLAGS =  -g -Os
CFLAGS += -mmcu=$(MCU)
CFLAGS += -DF_CPU=16000000L
CFLAGS += -o

#Linking options for avr-gcc
LFLAGS = -Os -mmcu=$(MCU) -o

#Options for HEX file generation
HFLAGS = -j .text -j .data -O ihex

# Options for avrdude to burn the hex file
# MMCU model here according to avrdude options
DUDEFLAGS =  -c usbasp 
DUDEFLAGS += -p m328p
DUDEFLAGS += -U flash:w:$(MAIN_HEX_PATH):i
DUDEFLAGS += -U lfuse:w:0xFF:m
DUDEFLAGS += -U hfuse:w:0xDA:m
DUDEFLAGS += -C "${AVRDUDE_CONFIG_PATH}/avrdude.conf"

# Sources files needed for building the application 
SRC =  src/$(MAIN_APP).cpp
SRC += src/debug/debug.cpp
SRC += src/mcp23017/mcp23017.cpp
SRC += src/mcp23017/mcp23017raw.cpp # Only include this when testing mcp23017 features (non interrupt mode)
SRC += src/timer/timer.cpp
SRC += src/twi/twi.cpp
SRC += src/usart/usart.cpp

# The headers files needed for building the application
INCLUDE =  -I. 
INCLUDE += -Isrc/debug
INCLUDE += -Isrc/include
INCLUDE += -Isrc/mcp23017
INCLUDE += -Isrc/timer
INCLUDE += -Isrc/twi
INCLUDE += -Isrc/usart

# Commands Section
Clean :
	del *.elf 
	del *.hex 
	del *.o 

Burn : Build
	$(AVRDUDE) $(DUDEFLAGS)

Build : $(MAIN_APP).elf
	$(OBJCOPY) $(HFLAGS) $< $(MAIN_APP).hex
	
$(MAIN_APP).elf: $(MAIN_APP).o
	$(CC) $(SRC) $(INCLUDE) $(LFLAGS) $@
	
$(MAIN_APP).o:$(SRC)
	$(CC) $^ $(INCLUDE) $(CFLAGS) $@