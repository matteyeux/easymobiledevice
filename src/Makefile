easymobiledevice : easymobiledevice.o easymobiletools.o
	gcc -o easymobiledevice easymobiledevice.o easymobiletools.o
	cp easymobiledevice ../
easymobiledevice.o : easymobiledevice.c
	gcc -c easymobiledevice.c
easymobiletools.o : easymobiletools.c easymobiletools.h
	gcc -c easymobiletools.c
