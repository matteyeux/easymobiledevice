easymobiledevice : src/easymobiledevice.o src/easymobiletools.o
	gcc -o easymobiledevice src/easymobiledevice.o src/easymobiletools.o
	cp src/easymobiledevice ../
easymobiledevice.o : src/easymobiledevice.c
	gcc -c src/easymobiledevice.c
easymobiletools.o : src/easymobiletools.c src/easymobiletools.h
	gcc -c src/easymobiletools.c
