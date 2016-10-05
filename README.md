#Easymobiledevice 

Easymobiledevice is a command line interface to help you to use libimobiledevice.

Before executing this program you'll need to install libimobiledevice.
Linux & OS users can use [library-iphone.sh](https://github.com/matteyeux/easymobiledevice/blob/master/library-iphone.sh) which installs dependencies and compile it automatically.

For Windows you have to download [Libimobiledevice for Windows](https://github.com/elrhk/Libimobiledevice-idevicerestore-for-Windows). Windows binary (.exe).

#Installing libimobiledevice
You can now run `library-iphone.sh` for OS X & Linux, the script will automaticaly build Libimobiledevice for your Operating System <br>
It also works for other Operating Systems

For this error : `ERROR: Could not connect to lockdownd, error code -2`<br>
Please run `killall usbmuxd & u bmuxd -u -f -v`.<br>

#Credits

Utility developed by Mathieu Hautebas ([@matteyeux](https://twitter.com/matteyeux)).<br> 
- Libimobiledevice team to build awesome tools.<br> 
- [@Dev__Jam](https://twitter.com/Dev__Jam) for Libimobiledevice for Windows & initial script.<br> 
- Lilo Colson([@Pwn1d](https://twitter.com/Pwn1d)) for contributed by adding some functions to clean code.
