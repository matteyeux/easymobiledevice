#include "easymobiletools.h"
#include "functions.c"
#include "prototypes.h"
#include <stdio.h>
#include <stdlib.h>

int ideviceactivation()
{	
	int choice;
	system("clear");
	printf("1) Activate\n");
	printf("2) Deactivate\n");
	choice = fgetn();
	if (choice == 1)
	{	
		printf("Activation\n");
		system("ideviceactivation activate");
	}
	if (choice == 2)
	{
		printf("Desactivation\n");
		system("ideviceactivation deactivate");
	}
	return EXIT_SUCCESS;
}

int idevicebackup ()
{	
	int choice;
	float version;
	char path[120];
	char buildCommand[1024];

	system("clear");
	printf("1) Backup\n");
	printf("2) Restore backup\n");
	choice = fgetn();
	printf("iOS version : ");
	version = fgetf();

	if (version < 4)
	{
		printf("Your iOS version is less than iOS 4.\n");

		if (choice == 1)
		{
			printf("Enter the directory to copy the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup backup %s", path);
			system(buildCommand);
		}
		if (choice == 2)
		{
			printf("Enter the directory to the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup restore %s", path);
			system(buildCommand);
		}

	}
	else 
	{
		printf("Your iOS version is lower than iOS 4.\n");

		if (choice == 1)
		{
			printf("Enter the directory to copy the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup2 backup %s", path);
			system(buildCommand);
		}
		if (choice == 2)
		{
			printf("Enter the directory to the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup restore %s", path);
			system(buildCommand);
		}
	}
	return EXIT_SUCCESS;
}

int idevicecrashreport()
{	
	int choice;
	char path[1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Extract raw crash report into separate '.crash' file\n");
	printf("2) Copy but do not remove crash reports from device\n");
	choice = fgetn();

	if (choice == 1)
	{
		printf("Enter the directory to copy the file : ");
		fget(path, 1024);

		sprintf(buildCommand, "idevicecrashreport -e %s", path);
		system(buildCommand);
	}
	if (choice == 2)
	{
		printf("Enter the directory to copy the file : ");
		fget(path, 1024);

		sprintf(buildCommand, "idevicecrashreport -k %s", path);
		system(buildCommand);
	}
	return EXIT_SUCCESS;
}

int idevicedate()
{	
	system("clear; idevicedate");
	return EXIT_SUCCESS;
}

int idevicedebug()
{	
	char cmd[1024];
	char option[1024];
	char buildCommand[1024];

	system("clear");
	printf("Enter command : ");
	fget(cmd, 1024);
	printf("Entrer option : ");
	fget(option, 1024);

	sprintf(buildCommand, "idevicedebug -d %s %s", option, cmd);
	system(buildCommand);
	return EXIT_SUCCESS;
}

int idevicedebugserverproxy()
{	
	int port;
	char buildCommand[1024];

	system("clear");
	printf("Port : ");
	port = fgetn();
	sprintf(buildCommand, "idevicedebugserverproxy -d %d",port);
	system(buildCommand);
	return EXIT_SUCCESS;
}

int idevicediagnostics()
{	
	int choice;
	char cmd[80];
	char buildCommand[1024];
	system("clear");
	printf("1) Print diagnostics informations from device by TYPE (All, WiFi, GasGauge, NAND)\n");
	printf("2) print mobilegestalt keys passed as arguments seperated by a space.\n");
	printf("3) print IORegistry of device, optionally by PLANE (IODeviceTree, IOPower, IOService) (iOS 5+ only)\n");
	printf("4) Shutdown device\n");
	printf("5) Restart device\n");
	printf("6) Put device into sleep mode\n");
	choice = fgetn();

	if (choice == 1)
	{
		printf("Enter the type of the command : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics diagnostics -d %s", cmd);
		system(buildCommand);
	}
	if (choice == 2)
	{
		printf("Enter the keys : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics mobilegestalt -d KEY %s", cmd);
		system(buildCommand);
	}
	if (choice == 3 )
	{
		printf("Enter command : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics ioreg %s", cmd);
		system(buildCommand);
	}
	if (choice == 4)
	{
		printf("The device will shutdown...\n");
		system("idevicediagnostics shutdown");
	}
	if (choice == 5)
	{
		printf("The device will restart...\n");
		system("idevicediagnostics restart");
	}
	if (choice == 6)
	{
		printf("Putting device into sleep mode...\n");
		system("idevicediagnostics sleep");
	}
	return EXIT_SUCCESS;
}

int ideviceenterrecovery()
{	
	char buildCommand[1024];
	char UDID[80];
	system("clear");
	printf("Enter UDID : ");
	fget(UDID, 80);
	sprintf(buildCommand, "ideviceenterrecovery %s", UDID);
	system(buildCommand);
	return EXIT_SUCCESS;
}

int idevice_id()
{	
	system("clear; idevice_id");
	return EXIT_SUCCESS;
}

int ideviceimagemounter()
{	
	char buildCommand[1024];
	char option[80];
	char imgfile[80];
	system("clear");
	printf("Enter option : ");
	fget(option, 80);
	printf("Enter directory to the image file : ");
	fget(imgfile, 80);

	sprintf(buildCommand, "ideviceimagemounter %s %s ", option, imgfile);
	system(buildCommand);
	return EXIT_SUCCESS;
}

int ideviceinfo()
{	
	system("clear; ideviceinfo");
	return EXIT_SUCCESS;
}

int ideviceinstaller()
{	
	int apps;
	int choice;
	char appid[80];
	char path[120];
	char buildCommand[1024];

	system("clear");
	printf("1) List apps\n");
	printf("2) Install archive\n");
	printf("3) Uninstall APPID\n");
	printf("4) Upgrade archive\n");
	printf("5) List archive\n");
	printf("6) Archive APPID\n");
	printf("7) Remove APPID\n");
	printf("8) Restore APPID\n");

	choice = fgetn();

	if (choice == 1)
	{	
		printf("1) Mobile apps\n");
		printf("2) System apps\n");
		printf("3) All apps\n");
		apps = fgetn();

		if (apps == 1)
		{
			system("ideviceinstaller -l -o list_user");
		}
		if (apps == 2)
		{
			system("ideviceinstaller -l -o list_system");
		}
		if (apps == 3)
		{
			system("ideviceinstaller -l -o list_all");
		}
	}
	if (choice == 2)
	{
		printf("Enter the directory from the archive : ");
		fget(path, 120);
		sprintf(buildCommand, "ideviceinstaller -i %s",path);
		system(buildCommand);
	}
	if (choice == 3)
	{	
		printf("Enter APPID to uninstall : ");
		fget(appid, 80);
		sprintf(buildCommand,"ideviceinstaller -U %s", appid);
		system(buildCommand);
	}
	if (choice == 4)
	{
		printf("Enter archive to upgrade : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -g %s", appid);
		system(buildCommand);		
	}
	if (choice == 5)
	{
		system("ideviceinstaller -L");
	}
	if (choice == 6)
	{
		printf("This command will uninstall the package after making an archive, enter the APPID : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -a uninstall %s", appid);
		system(buildCommand);
	}
	if (choice == 7)
	{
		printf("Restore archived app specified by APPID, enter APPID : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -r %s", appid);
		system(buildCommand);
	}
	if (choice == 8)
	{
		printf("Remove app archive specified by APPID, enter the APPID : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -R %s", appid);
		system(buildCommand);
	}

	return EXIT_SUCCESS;
}

int idevicename()
{
	system("clear; idevicename");
	return EXIT_SUCCESS;
}

int idevicenotificationproxy ()
{	
	int choice;
	int ID;
	char buildCommand[1024];
	printf("1) POST ID\n");
	printf("2) Observe ID\n");
	choice = fgetn();
	if (choice == 1)
	{
		printf("ID : ");
		ID = fgetn();
		sprintf(buildCommand, "idevicenotificationproxy -d post %d", ID);
		system(buildCommand);
	}
	if (choice == 2)
	{
		printf("ID : ");
		ID = fgetn();
		sprintf(buildCommand, "idevicenotificationproxy -d observe %d", ID);
		system(buildCommand);
	}
	return EXIT_SUCCESS;
}

int idevicepair()
{
	int choice;
	printf("1) Pair\n");
	printf("2) Unpair\n");
	printf("3) List devices paired with this host\n");
	choice = fgetn();
	if (choice == 1)
	{
		system("idevicepair pair");
	}
	if (choice == 2)
	{
		system("idevicepair unpair");
	}
	if (choice == 3)
	{
		system("idevicepair list");
	}
	return EXIT_SUCCESS;
}

int ideviceprovision()
{	
	int choice;
	char buildCommand[1024];
	char path[1024];
	char UUID[80];
	system("clear");
	printf("1) Install a validate profile\n");
	printf("2) List all profiles installed on the device\n");
	printf("3) Copy all profiles from the device to the host\n");
	printf("4) Remove profile using his UUID\n");
	printf("5) Display informations about a profile\n");
	choice = fgetn();

	if (choice == 1)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "ideviceprovision install %s", path);
		system(buildCommand);
	}
	if (choice == 2)
	{
		system("ideviceprovision list");
	}										/* 420 <3 */
	if (choice == 3)
	{
		printf("Enter the directory to copy the files : ");
		fget(path, 1024);
		sprintf(buildCommand, "ideviceprovision copy %s", path);
		system(buildCommand);
	}
	if (choice == 4)
	{
		printf("Enter the UUID of the profile : ");
		fget(UUID, 80);
		sprintf(buildCommand, "ideviceprovision remove %s", UUID);
		system(buildCommand);
	}
	if (choice == 5)
	{
		printf("Enter the directory to the file to dump : ");
		fget(path, 1024);
		sprintf(buildCommand,"ideviceprovision dump %s", path);
		system(buildCommand);
	}
	return EXIT_SUCCESS;
}
int idevicescreenshot()
{	
	char path[1024];
	char buildCommand[1024];

	system("clear");
	printf("Enter the directory to copy the screenshot : ");
	fget(path, 1024);
	sprintf(buildCommand, "idevicescreenshot %s", path);
	system(buildCommand);
	return EXIT_SUCCESS;
}
int idevicerestore()
{	
	int choice;
	int ipsw;
	char path[1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Restore and keep DATA\n");
	printf("2) Restore device\n");
	printf("3) Restore using a Custom Firmware\n");
	choice = fgetn();

	if (choice == 1)
	{
		printf("Do you want to use an IPSW file ?\n");
		printf("1) YES\n");
		printf("2° NO\n");
		ipsw = fgetn();
		if (ipsw == 1)
		{
			printf("Enter the directory to the file : ");
			fget(path, 1024);
			sprintf(buildCommand, "idevicerestore -d %s", path);
			printf("%s\n",buildCommand);
			//system(buildCommand);
		}
		else
		{	
			printf("Restoring with the latest signed iOS firmware...\n");
			system("idevicerestore -d -l");
		}

	}
	if (choice == 2)
	{
		printf("Do you have an ipsw or shall i download it ?\n");
		printf("1) Yes i've got an ipsw.\n");
		printf("2) No, please download the ipsw file.\n");
		ipsw = fgetn();
		if (ipsw == 1)
		{	
			printf("Enter the directory to the file : ");
			fget(path, 1024);
			sprintf(buildCommand, "idevicerestore -d -e %s", path);
			printf("%s\n",buildCommand);
			system(buildCommand);
		}
		if (ipsw == 2)
		{
			system("idevicerestore -d  -e -l");
		}
	}
	if (choice == 3)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "idevicerestore -d -c %s", path);
		system(buildCommand);
	}

	return EXIT_SUCCESS;
}

int idevicesyslog()
{	
	system("clear");
	printf("Press Ctrl + C to stop the process\n");
	system("idevicesyslog");
	return EXIT_SUCCESS;
}

int irecovery()
{	
	int choice;
	char path [1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Send file to device \n");
	printf("2) Send limera1n USB exploit payload\n");
	printf("3) Reboot device into normal mode\n");
	printf("4) Execute recovery script\n");
	printf("5) Start an interactive shell\n");
	choice = fgetn();
	if (choice == 1)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -f %s", path);
		system(buildCommand);
	}
	if (choice == 2)
	{
		printf("Entrer the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -k %s", path);
		system(buildCommand);
	}
	if (choice == 3)
	{
		printf("The device will exit recovery loop...\n");
		system("sudo irecovery -n");
	}
	if (choice == 4)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -e %s", path);
		system(buildCommand);
	}
	if (choice == 5)
	{
		system("sudo irecovery -s");
	}
	return EXIT_SUCCESS;
}

int option()
{	
	char choice[80];
	printf("Copy easymobiledevice in PATH (Linux & OS X only) ? : ");
    fget(choice, 80);
    cmin(choice);

    if (strcmp(choice, "yes")==0 || )
    {
    	system("sudo cp easymobiledevice /usr/local/bin/");
    }
    else if(strcmp(choice, "no")==0)
    {
    	return EXIT_SUCCESS;
    }
}
