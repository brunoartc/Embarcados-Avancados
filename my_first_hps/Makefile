#
TARGET = main_cpp

ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT = $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -g -Wall   -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)   -I$(HWLIBS_ROOT)/include/
LDFLAGS =  -g -Wall 
CC = $(CROSS_COMPILE)gcc
ARCH= arm

build: $(TARGET)

$(TARGET): main.o 
	$(CC) $(LDFLAGS)   $^ -o $@ 

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~


.PHONY: deploy
deploy:
	scp ./$(TARGET) root@10.102.32.32:/home/root

.PHONY: run
run:
	ssh  root@10.102.32.32 /home/root/main_cpp

.PHONY: gdb
gdb:
	echo "####################################"
	echo "# connect gdb to 10.102.32.32:6666 #"
	echo "####################################"
	ssh  root@10.102.32.32 "gdbserver 0.0.0.0:6666 /home/root/main_cpp --remote-debug"
	