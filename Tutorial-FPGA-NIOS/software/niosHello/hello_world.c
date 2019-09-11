#include <stdio.h>
#include "system.h"
#include <alt_types.h>
#include <io.h> /* Leiutura e escrita no Avalon */
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

//https://johnloomis.org/NiosII/pio/PIO_example1.html

#define PIO_1_BASE 0x51000
#define PIO_1_BASE_B 0x51005

/*
 void init_pio()
 {
     // Recast the edge_capture pointer to match the alt_irq_register() function
      // prototype.
     void* edge_capture_ptr = (void*) &edge_capture;
     // Enable first four interrupts.
     IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_BASE, 0xf);
     // Reset the edge capture register.
     IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_BASE, 0x0);
    // Register the interrupt handler.
     alt_irq_register( PIO_IRQ, edge_capture_ptr,
    		 handle_button_interrupts );
 }*/


int main(void){
  unsigned int led = 0;
  int button = 0;

  while(1){
	  button = IORD_ALTERA_AVALON_PIO_DATA(PIO_1_BASE);




      if (led <= 5){

    	  if ((button & 32)== 0){
    		  IOWR_32DIRECT(PIO_0_BASE, 0, 0x4);
    	  } else {
    		  IOWR_32DIRECT(PIO_0_BASE, 0, 0x01 << led++);
    		  usleep(500*button);
    	  }




      }
      else{
          led = 0;
      }
  };

  return 0;
}


