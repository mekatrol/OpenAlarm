#include <Arduino.h>

static const PROGMEM unsigned long crc_table[16] = {
    0x00000000, 0x1db71064, 0x3b6e20c8, 0x26d930ac,
    0x76dc4190, 0x6b6b51f4, 0x4db26158, 0x5005713c,
    0xedb88320, 0xf00f9344, 0xd6d6a3e8, 0xcb61b38c,
    0x9b64c2b0, 0x86d3d2d4, 0xa00ae278, 0xbdbdf21c
};

unsigned long UpdateCrc(unsigned long crc, unsigned char data)
{
    unsigned char tbl_idx;
    tbl_idx = crc ^ (data >> (0 * 4));
    crc =  pgm_read_dword_near(crc_table + (tbl_idx & 0x0f)) ^ (crc >> 4);
    tbl_idx = crc ^ (data >> (1 * 4));
    crc = pgm_read_dword_near(crc_table + (tbl_idx & 0x0f)) ^ (crc >> 4);
    
    return crc;
}

unsigned long GenerateMessageCrc(unsigned char *msg, int msgLen)
{
  unsigned long crc = ~0L;
  for(int i = 0; i < msgLen; i++)
  {
    crc = UpdateCrc(crc, msg[i]);
  }
  crc = ~crc;
  return crc;
}

bool ValidateMessageCrc(unsigned char* msg, int msgLen)
{
  // Must be more than just CRC data in message
  if(msgLen <= (int) sizeof(long)) return false;
  
  unsigned long crc = GenerateMessageCrc(msg, msgLen - sizeof(long));
  
  byte * crcData = &msg[msgLen - 4];
  unsigned long msgCrc = *((unsigned long *) crcData);
  
  return msgCrc == crc;
}
