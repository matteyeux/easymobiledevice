CC = gcc

all : 
	@echo 'Building easymobiledevice...'
	@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h -o easymobiledevice
	@echo 'Sucessfully built easymobiledevice !'