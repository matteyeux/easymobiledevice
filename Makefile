CC = gcc

win : 
	@echo 'Building easymobiledevice...'
	@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h -o easymobiledevice
	@echo 'Sucessfully built easymobiledevice fot Windows !'

linux : 
	@echo 'Building easymobiledevice...'
	@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h -o easymobiledevice
	@echo 'Sucessfully built easymobiledevice !'

macos : 
	@echo 'Building easymobiledevice...'
	@$(CC) src/easymobiledevice.c src/easymobiletools.c src/easymobiletools.h
	@ mv a.out easymobiledevice
	@echo 'Sucessfully built easymobiledevice !'
