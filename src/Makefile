easymobiledevice : easymobiledevice.o easymobiletools.o
	gcc -o easymobiledevice easymobiledevice.o easymobiletools.o
	cp easymobiledevice ../
	rm *.o

easymobiledevice.o : easymobiledevice.c
	gcc -c easymobiledevice.c

easymobiletools.o : easymobiletools.c easymobiletools.h
	gcc -c easymobiletools.c
