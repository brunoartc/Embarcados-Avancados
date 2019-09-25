#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */

//#define SIM

// LED Peripheral
#define REG_DATA_OFFSET 1


#define PERIPHERAL_PS2_0_BASE 0x61000


// PS2
#define WRITE_PS2 0

#define READ_PS2 1

#define init_offset 1



int PS2_init(unsigned int *base_address){

	*(base_address+WRITE_PS2) = (0x1 << 0);

	printf("%x", *(base_address+2) );
	return *(base_address+WRITE_PS2) & (0x1);
}

int PS2_halt(unsigned int *base_address){
	*(base_address+WRITE_PS2) = (0x0 << 0);
	return *(base_address+WRITE_PS2);
}

int PS2_read_clickLeft(unsigned int *base_address){
	uint tmp = *(base_address+READ_PS2);
	return (*(base_address+READ_PS2) & (0x1 << 0));
}

int PS2_read_clickRight(unsigned int *base_address){
	return (*(base_address+READ_PS2) & (0x1 << 1)) >> 1;
}

int PS2_read_clickMid(unsigned int *base_address){
	return (*(base_address+READ_PS2) & (0x1 << 2)) >> 2;
}

int PS2_read_xO(unsigned int *base_address){
	return (*(base_address+READ_PS2) & (0xff << 3)) >> 3;
}

int PS2_read_Y0(unsigned int *base_address){
	return (*(base_address+READ_PS2) & (0xff << 11)) >> 11;
}




int main(void){

  int flag_true = 0, button_clicked = 0;
  unsigned int led = 0;
  volatile unsigned int *p_led = (unsigned int *) PERIPHERAL_LED_0_BASE;
  volatile unsigned int *p_p2 = (unsigned int *) PERIPHERAL_PS2_0_BASE;
  if (!flag_true){
  		  flag_true = PS2_init(p_p2);
  		  printf("%d", flag_true);
  	  }
  while (1){
	  button_clicked = PS2_read_clickLeft(p_p2);

	  printf("%d\n", button_clicked);
	  usleep(300);
	  if (button_clicked){
		  *(p_led+REG_DATA_OFFSET) = (0x1 << 3);
	  } else {
		  *(p_led+REG_DATA_OFFSET) = (0x0 << 3);
	  }

  }

  return 0;
}
