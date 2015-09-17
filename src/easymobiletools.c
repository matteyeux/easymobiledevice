#include "easymobiletools.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>

int ideviceactivation()
{	
	char choice[80];
	system("clear");
	printf("1) Activate\n");
	printf("2) Deactivate\n");
	fget(choice, 80);
	if (strmcmp(choice, "activate")==0 || strmcmp(choice, "1")==0)
	{	
		printf("Activation\n");
		system("ideviceactivation activate");
	}
	if (strmcmp(choice, "deactivate")==0 || strmcmp(choice, "2")==0)
	{
		printf("Desactivation\n");
		system("ideviceactivation deactivate");
	}
	return EXIT_SUCCESS;
}

int idevicebackup ()
{	
	char choice[80];
	float version;
	char path[120];
	char buildCommand[1024];

	system("clear");
	printf("1) Backup\n");
	printf("2) Restore backup\n");
	fget(choice, 80);
	printf("iOS version : ");
	version = fgetf();

	if (version < 4)
	{
		printf("Your iOS version is less than iOS 4.\n");

		if (strmcmp(choice, "backup")==0 || strmcmp(choice, "1")==0)
		{
			printf("Enter the directory to copy the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup backup %s", path);
			system(buildCommand);
		}
		if (strmcmp(choice, "restore backup")==0 || strmcmp(choice, "2")==0)
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

		if (strmcmp(choice, "backup")==0 || strmcmp(choice, "1")==0)
		{
			printf("Enter the directory to copy the backup : ");
			fget(path, 120);
			sprintf(buildCommand, "idevicebackup2 backup %s", path);
			system(buildCommand);
		}
		if (strmcmp(choice, "restore")==0 || strmcmp(choice, "2")==0)
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
	char choice[80];
	char path[1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Extract raw crash report into separate '.crash' file\n");
	printf("2) Copy but do not remove crash reports from device\n");
	fget(choice, 80);

	if (strmcmp(choice, "extract")==0 || strmcmp(choice, "1")==0)
	{
		printf("Enter the directory to copy the file : ");
		fget(path, 1024);

		sprintf(buildCommand, "idevicecrashreport -e %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "copy")==0 || strmcmp(choice, "2")==0)
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
	char choice[80];
	char cmd[80];
	char buildCommand[1024];
	system("clear");
	printf("1) Print diagnostics informations from device by TYPE (All, WiFi, GasGauge, NAND)\n");
	printf("2) print mobilegestalt keys passed as arguments seperated by a space.\n");
	printf("3) print IORegistry of device, optionally by PLANE (IODeviceTree, IOPower, IOService) (iOS 5+ only)\n");
	printf("4) Shutdown device\n");
	printf("5) Restart device\n");
	printf("6) Put device into sleep mode\n");
	fget(choice, 80);

	if (strmcmp(choice, "diagnostics")==0 || strmcmp(choice, "1")==0)
	{
		printf("Enter the type of the command : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics diagnostics -d %s", cmd);
		system(buildCommand);
	}
	if (strmcmp(choice, "mobilegestalt")==0 || strmcmp(choice, "2")==0)
	{
		printf("Enter the keys : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics mobilegestalt -d KEY %s", cmd);
		system(buildCommand);
	}
	if (strmcmp(choice, "ioreg")==0 || strmcmp(choice, "3")==0)
	{
		printf("Enter command : ");
		fget(cmd, 80);
		sprintf(buildCommand, "idevicediagnostics ioreg %s", cmd);
		system(buildCommand);
	}
	if (strmcmp(choice, "shutdown")==0 || strmcmp(choice, "4")==0)
	{
		printf("The device will shutdown...\n");
		system("idevicediagnostics shutdown");
	}
	if (strmcmp(choice, "restart")==0 || strmcmp(choice, "5")==0)
	{
		printf("The device will restart...\n");
		system("idevicediagnostics restart");
	}
	if (strmcmp(choice, "sleep")==0 || strmcmp(choice, "6")==0)
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
	char apps[120];
	char choice[80];
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
	printf("7) Restore APPID\n");
	printf("8) Remove APPID\n");

	fget(choice, 80);

	if (strmcmp(choice, "list")==0 || strmcmp(choice, "1")==0)
	{	
		printf("1) Mobile apps\n");
		printf("2) System apps\n");
		printf("3) All apps\n");
		fget(apps, 120);

		if (strmcmp(apps, "mobile")==0 || strmcmp(apps, "1")==0)
		{
			system("ideviceinstaller -l -o list_user");
		}
		if (strmcmp(apps, "system")==0 || strmcmp(apps, "2")==0)
		{
			system("ideviceinstaller -l -o list_system");
		}
		if (strmcmp(apps, "all")==0 || strmcmp(apps, "3")==0)
		{
			system("ideviceinstaller -l -o list_all");
		}
	}
	if (strmcmp(choice, "install")==0 || strmcmp(choice, "2")==0)
	{
		printf("Enter the directory from the archive : ");
		fget(path, 120);
		sprintf(buildCommand, "ideviceinstaller -i %s",path);
		system(buildCommand);
	}
	if (strmcmp(choice, "uninstall")==0 || strmcmp(choice, "3")==0)
	{	
		printf("Enter APPID to uninstall : ");
		fget(appid, 80);
		sprintf(buildCommand,"ideviceinstaller -U %s", appid);
		system(buildCommand);
	}
	if (strmcmp(choice, "upgrade")==0 || strmcmp(choice, "4")==0)
	{
		printf("Enter archive to upgrade : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -g %s", appid);
		system(buildCommand);		
	}
	if (strmcmp(choice, "list archive")==0 || strmcmp(choice, "5")==0)
	{
		system("ideviceinstaller -L");
	}
	if (strmcmp(choice, "archive")==0 || strmcmp(choice, "6")==0)
	{
		printf("This command will uninstall the package after making an archive, enter the APPID : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -a uninstall %s", appid);
		system(buildCommand);
	}
	if (strmcmp(choice, "restore")==0 || strmcmp(choice, "7")==0)
	{
		printf("Restore archived app specified by APPID, enter APPID : ");
		fget(appid, 80);
		sprintf(buildCommand, "ideviceinstaller -r %s", appid);
		system(buildCommand);
	}
	if (strmcmp(choice, "remove")==0 || strmcmp(choice, "8")==0)
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
	if (strmcmp(choice, "post")==0 || strmcmp(choice, "1")==0)
	{
		printf("ID : ");
		ID = fgetn();
		sprintf(buildCommand, "idevicenotificationproxy -d post %d", ID);
		system(buildCommand);
	}
	if (strmcmp(choice, "observe")==0 || strmcmp(choice, "2")==0)
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
	char choice[80];
	printf("1) Pair\n");
	printf("2) Unpair\n");
	printf("3) List devices paired with this host\n");
	fget(choice, 80);
	if (strmcmp(choice, "pair")==0 || strmcmp(choice, "1")==0)
	{
		system("idevicepair pair");
	}
	if (strmcmp(choice, "unpair")==0 || strmcmp(choice, "2")==0)
	{
		system("idevicepair unpair");
	}
	if (strmcmp(choice, "list")==0 || strmcmp(choice, "3")==0)
	{
		system("idevicepair list");
	}
	return EXIT_SUCCESS;
}

int ideviceprovision() /////////////////////////////////////////////////////////////////////
{	
	char choice[80];
	char buildCommand[1024];
	char path[1024];
	char UUID[80];
	system("clear");
	printf("1) Install a validate profile\n");
	printf("2) List all profiles installed on the device\n");
	printf("3) Copy all profiles from the device to the host\n");
	printf("4) Remove profile using his UUID\n");
	printf("5) Display informations about a profile\n");
	fget(choice, 80);

	if (strmcmp(choice, "install")==0 || strmcmp(choice, "1")==0)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "ideviceprovision install %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "list")==0 || strmcmp(choice, "2")==0)
	{
		system("ideviceprovision list");
	}										
	if (strmcmp(choice, "copy")==0 || strmcmp(choice, "3")==0)
	{
		printf("Enter the directory to copy the files : ");
		fget(path, 1024);
		sprintf(buildCommand, "ideviceprovision copy %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "remove")==0 || strmcmp(choice, "4")==0)
	{
		printf("Enter the UUID of the profile : ");
		fget(UUID, 80);
		sprintf(buildCommand, "ideviceprovision remove %s", UUID);
		system(buildCommand);
	}
	if (strmcmp(choice, "display")==0 || strmcmp(choice, "5")==0)
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
	char choice[80];
	char ipsw[10];
	char path[1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Restore and keep DATA\n");
	printf("2) Restore device\n");
	printf("3) Restore using a Custom Firmware\n");
	fget(choice, 80);

	if (strmcmp(choice, "keep")==0 || strmcmp(choice, "1")==0)
	{
		printf("Do you want to use an IPSW file ?\n");
		printf("1) YES\n");
		printf("2° NO\n");
		fget(choice, 10);
		if (strmcmp(choice, "yes")==0 || strmcmp(choice, "1")==0)
		{
			printf("Enter the directory to the file : ");
			fget(path, 1024);
			sprintf(buildCommand, "idevicerestore -d %s", path);
			printf("%s\n",buildCommand);
			system(buildCommand);
		}
		else
		{	
			printf("Restoring with the latest signed iOS firmware...\n");
			system("idevicerestore -d -l");
		}

	}
	if (strmcmp(choice, "restore")==0 || strmcmp(choice, "2")==0)
	{
		printf("Do you have an ipsw ?\n");
		printf("1) Yes i've got an ipsw.\n");
		printf("2) No, please download the ipsw file.\n");
		fget(ipsw, 80);
		if (strmcmp(ipsw, "yes")==0 || strmcmp(ipsw, "1")==0)
		{	
			printf("Enter the directory to the file : ");
			fget(path, 1024);
			sprintf(buildCommand, "idevicerestore -d -e %s", path);
			printf("%s\n",buildCommand);
			system(buildCommand);
		}
		if (strmcmp(ipsw, "no")==0 || strmcmp(ipsw, "2")==0)
		{
			system("idevicerestore -d  -e -l");
		}
	}
	if (strmcmp(choice, "custom")==0 || strmcmp(choice, "3")==0)
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
	char choice[80];
	char path [1024];
	char buildCommand[1024];

	system("clear");
	printf("1) Send file to device \n");
	printf("2) Send limera1n USB exploit payload\n");
	printf("3) Reboot device into normal mode\n");
	printf("4) Execute recovery script\n");
	printf("5) Start an interactive shell\n");
	fget(choice, 80);
	if (strmcmp(choice, "send file")==0 || strmcmp(choice, "1")==0)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -f %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "send payload")==0 || strmcmp(choice, "2")==0)
	{
		printf("Entrer the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -k %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "reboot")==0 || strmcmp(choice, "3")==0)
	{
		printf("The device will exit recovery loop...\n");
		system("sudo irecovery -n");
	}
	if (strmcmp(choice, "execute")==0 || strmcmp(choice, "4")==0)
	{
		printf("Enter the directory to the file : ");
		fget(path, 1024);
		sprintf(buildCommand, "sudo irecovery -e %s", path);
		system(buildCommand);
	}
	if (strmcmp(choice, "shell")==0 || strmcmp(choice, "5")==0)
	{
		system("sudo irecovery -s");
	}
	return EXIT_SUCCESS;
}
 
int path()
{	
	char choice[80];
	printf("Copy easymobiledevice in PATH (Linux & OS X only) ? : ");
    fget(choice, 80);
    cmin(choice);

    if (strmcmp(choice, "yes")==0)
    {
    	system("sudo cp easymobiledevice /usr/local/bin/");
    	return EXIT_SUCCESS;
    }
    else if(strmcmp(choice, "no")==0)
    {
    	return EXIT_SUCCESS;
    }
}

void nBuffer()

{
   int c;
   while (c != '\n' && c != EOF)
   {
       c = getchar();
   }
}

int fget(char *chain, int sizee)

{
   char *charn = NULL;
   if (fgets(chain, sizee, stdin) != NULL)
   {
       charn = strchr(chain, '\n');
       if (charn != NULL)
       {
           *charn = '\0';
       }
       else
       {
           nBuffer();
       }
       return(EXIT_SUCCESS);
   }
   else
   {
       nBuffer();
       return(EXIT_FAILURE);
   }
}

int fgetn()
{
	char chain[64];
	fget(chain, 64);
	return atoi(chain);
}

float fgetf()
{
	char chain[64];
	fgetf(chain, 64);
	return atof(chain);
}

int cmin(char *chain)
{
    int i;
        for (i=0; i<strlen(chain); i++)
        {
            chain[i]=tolower(chain[i]);
        }
    return(EXIT_SUCCESS);
}

int option()
{
	char option[10];
	printf("Continue ? \n");
	printf("1) YES\n");
	printf("2) NO\n");
	scanf("%s", option);
	if (strmcmp(option, "YES")==0 || strmcmp(option, "yes")==0 || strmcmp(option, "1")==0)
	{
	}
	else if (strmcmp(option, "NO")==0 || strmcmp(option, "no")==0 || strmcmp(option, "2")==0)
	{
		return 0;
	}
	return 0;
}

int strmcmp(char chain1, char chain2)
{
    cmin(chain1);
    cmin(chain2);
    if (strcmp(chain1, chain2)== 0)
    {
        return 0;
    }
    else if (strcmp(chain1, chain2)== 1)
    {
        return 1;
    }
    return EXIT_FAILURE;
}