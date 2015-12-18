CC = gcc
	
all:
		@echo 'ERROR: no platform defined.'
		@echo 'LINUX USERS: make linux'
		@echo 'MAC OS X USERS: make macos'
	 	@echo 'WINDOWS USERS: make win'

linux : 
		@echo 'Building easymobiledevice for Linux...'
		@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h -o easymobiledevice
		@echo 'Succesfully built easymobiledevice for Linux'

macos : 
		@echo 'Building easymobiledevice for OS X...'
		@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h
		@ mv a.out easymobiledevice
		@echo 'Succesfully built easymobiledevice for OS X'

win :
		@echo 'Building easymobiledevice for Windows...'
		@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h -o easymobiledevice
		@echo 'Succesfully built easymobiledevice for Windows'
