#!/usr/bin/perl
#Last update : 27/07/2015
#Command line interface to use Libimobiledevice easily
#Utility developed by Mathieu Hautebas (MatteYeux), thanks to Elro74 to bring Libimobiledevice easier to compile
#<libimobiledevice.org>
use strict;
use warnings;
system("clear");
print "What de you need : \n";
print " 1) ideviceactivation \n";
print " 2) idevicebackup\n";
print " 3) idevicecrashreport\n";
print " 4) idevicedate\n";
print " 5) idevicedebug\n";
print " 6) idevicedebugserverproxy\n";
print " 7) idevicediagnostics\n";
print " 8) ideviceenterrecovery\n";
print " 9) idevice_id \n";
print "10) ideviceimagemounter\n";
print "11) ideviceinfo\n";
print "12) ideviceinstaller\n";
print "13) idevicename\n";
print "14) idevicenotificationproxy\n";
print "15) idevicepair\n";
print "16) ideviceprovision\n";
print "17) idevicerestore\n";
print "18) idevicescreenshot\n";
print "19) idevicesyslog\n";
print "20) iRecovery\n\n";
print "Commande : ";
my $command = <>;
chomp $command; 

if ($command eq "ideviceactivation || $command == 1") 
{
	print "1) Activate\n";
	print "2) Deactivate\n";
	my $activator = <>;
	chomp $activator;
	if ($activator == 1) {
		system("ideviceactivation activate");
	}
	if ($activator == 2) {

		system("ideviceactivation deactivate");
	}
}
if ($command == 2 || $command eq "idevicebackup") 
{
	system("clear");
	print "1) Backup\n";
	print "2) Restore backup\n";
	my $backup = <>;
	chomp $backup;

	if ($backup == 1) {
		print "iOS version :  ";
		my $version = <>;
		chomp $version;

		print "$version\n";
		if ($version < 4) {
			print "Your iOS version is less than iOS 4.";
			print "Enter the directory to copy the backup : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup backup $PATH"); 
		}
		else {
			print "Your iOS version is lower than iOS 4.\n";
			print "Enter the directory to copy the backup : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup2 backup $PATH");
		}
	}
	if ($backup == 2) {
		print "iOS version :  ";
		my $version = <>;
		chomp $version;

		if ($version < 4 ) {
			print "Your iOS version is less than iOS 4.\n";
			print "Enter the directory to the backup : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup restore $PATH");
		}
		else {
			print "Your iOS version is less than iOS 4.\n";
			print "Enter the directory to the backup : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup2 restore $PATH");
		}

	}
}	
if ($command eq "idevicecrashreport" || $command == 3) 
{
	system("clear");
	print "1) Extract raw crash report into separate '.crash' file\n";
	print "2) Copy but do not remove crash reports from device\n";
	my $crashreport = <>;
	chomp $crashreport;

	if ($crashreport == 1) {
		print "Enter the directory to copy the file : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicecrashreport --extract $PATH");
	}
	if ($crashreport == 2) {
		print "Enter the directory to copy the file : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicecrashreport --keep $PATH");
	}
}
if ($command == 4 || $command eq "idevicedate") 
{
	system("clear");
	print "\n";
	system("idevicedate");
}
if ($command == 5 || $command eq "idevicedebug")
{
	system("clear");
	print "Enter command : ";
	my $cmd = <>;
	chomp $cmd;
	print "Enter option : ";
	my $option = <>;
	chomp $option;
	system("idevicedebug -d $option $cmd");  
}
if ($command == 6 || $command eq "idevicedebugserverproxy") 
{
	system("clear");
	print "Port : ";
	my $port = <>;
	chomp $port;
	system("idevicedebugserverproxy $port -d"); #Fixer le probleme de port pour le .c
}
if ($command == 7 || $command eq "idevicediagnostics") 
{
	system("clear");
	print "1) Print diagnostics informations from device by TYPE (All, WiFi, GasGauge, NAND)\n";
	print "2) print mobilegestalt keys passed as arguments seperated by a space.\n";
	print "3) print IORegistry of device, optionally by PLANE (IODeviceTree, IOPower, IOService) (iOS 5+ only)\n";
	print "4) Shutdown device\n";
	print "5) Restart device\n";
	print "6) Put device into sleep mode\n";
	my $diagnostics = <>;
	chomp $diagnostics;

	if ($diagnostics == 1) {
		print "Enter the type of the command (All, WiFi, GasGauge, NAND) : ";
		my $action = <>;
		chomp $action;
		system("idevicediagnostics diagnostics $action");
	}
	if ($diagnostics == 2) {
		print "Enter keys : ";
		my $keys = <>;
		chomp $keys;
		system("idevicediagnostics mobilegestalt $keys");
	}
	if ($diagnostics == 3) {
		print "\niOS 5 ou ulterieur\n";
		print "Enter args (IODeviceTree, IOPower, IOService) : ";
		my $ioreg = <>;
		chomp $ioreg;
		system("idevicediagnostics ioreg $ioreg");
	}
	if ($diagnostics == 4) {
		system("idevicediagnostics shutdown");
	}
	if ($diagnostics == 5) {
		system("idevicediagnostics restart");
	}
	if ($diagnostics == 6) {
		system("sleep");
	}
}

if ($command == 8) {
	system("clear");
	print "Enter UDID : ";
	my $UDID = <>;
	chomp $UDID;
	system("ideviceenterrecovery $UDID");

}
if ($command == 9) {
	system("clear");
	system("idevice_id -l");
}
if ($command == 10) {
	system("clear");
	print "Enter directory to the image file : ";
	my $PATH = <>;
	chomp $PATH;
	system("ideviceimagemounter $PATH");
}
if ($command == 11) {
	system("clear");
	system("ideviceinfo");
}
if ($command == 12) {
	system("clear");
	print "1) List apps\n";
	print "2) Install archive\n";
	print "3) Uninstall APPID\n";
	print "4) Upgrade archive\n";
	print "5) List archive\n";
	print "6) Archive APPID\n";
	print "7) Remove APPID\n";
	print "8) Restore APPID\n";
	my $installer = <>;
	chomp $installer;

	if ($installer == 1) {
		print "1) Mobile apps\n";
		print "2) System apps\n";
		print "3) All apps\n";
		my $list = <>;
		chomp $list;

		if ($list == 1) {
			system("ideviceinstaller -l -o list_user");
		}
		if ($list == 2) {
			system("ideviceinstaller -l -o list_system");
		}
		if ($list == 3) {
			system("ideviceinstaller -l -o list_all");
		}
	}	
	if ($installer == 2) {
		print "Enter the directory from the archive : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceinstaller -i $PATH");
	}
	if ($installer == 3) {
		print "Enter the APPID to uninstall : ";
		my $APPID = <>;
		chomp $APPID;
		system("ideviceinstaller -U $APPID");
	}
	if ($installer == 4) {
		print "Enter archive to upgrade : ";
		my $archive = <>;
		chomp $archive;
		system("ideviceinstaller -g $archive");
	}
	if ($installer == 5) {
		system("ideviceinstaller -L");
	}
	if ($installer == 6) {
		printf("This command will uninstall the package after making an archive, enter the APPID : ");
		my $archive = <>;
		chomp $archive;
		system("ideviceinstaller -a uninstall $archive");
	}
	if ($installer == 7) {
		print "Restore archived app specified by APPID, enter APPID : ";
		my $appid = <>;
		chomp $appid;
		system("ideviceinstaller -r $appid");
	}
	if ($installer == 8) {
		print "Remove app archive specified by APPID, enter the APPID : ";
		my $appid = <>;
		chomp $appid;
	}
}
if ($command == 13) {
	system("idevicename");
}
if ($command == 14) {
	print "1) Post ID\n";
	print "2) Observe ID\n";
	my $notification = <>;
	chomp $notification;
	if ($notification == 1) {
		print "ID : ";
		my $ID = <>;
		chomp $ID;
		system("idevicenotificationproxy -d post $ID");
	}
	if ($notification == 2) {
		print "ID : ";
		my $ID = <>;
		chomp $ID;
		system("idevicenotificationproxy -d observe $ID");
	}
}
if ($command == 15) {
	print "1) Pair device\n";
	print "2) Unpair device\n";
	print "3) List of paired devices\n";
	my $idevicepair = <>;
	chomp $idevicepair;
	
	if ($idevicepair == 1) {
		system("idevicepair pair -d");
	}
	if ($idevicepair == 2) {
		system("idevicepair unpair");
	}

}
if ($command == 16) {
	system("clear");
	print "1) Install a validate profile\n";
	print "2) List all profiles installed on the device\n";
	print "3) Copy all profiles from the device to the host\n";
	print "4) Remove profile using his UUID\n";
	print "5) Display informations about a profile\n";
	my $provision = <>;
	chomp $provision;

	if ($provision == 1) {
		print "Enter the directory to the file : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision install $PATH");
	}
	if ($provision == 2) {
		system("ideviceprovision list");
	}
	if ($provision == 3) {
		print "Enter the directory to copy the files : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision copy $PATH");
	}
	if ($provision == 4) {
		print "Enter the UUID of the profile : ";
		my $UUID = <>;
		chomp $UUID;
		system("ideviceprovision remove $UUID");
	}
	if ($provision == 5) {
		print "Enter the directory to copy the files";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision dump $PATH");
	}
}
if ($command == 17) {
	print "1) Restore\n";
	print "2) Restore with a custom firmware\n";
	my $restore = <>;
	chomp $restore;

	if ($restore == 1) {
		print "Do you want to download the last signed iOS version ?\n";
		print "1) YES\n";
		print "2) NO\n";
		my $dlversion = <>;
		chomp $dlversion;
		if ($dlversion == 1) {
			system("idevicerestore -d -l");
		}
		if ($dlversion == 2) {
			print "Enter the directory to the ipsw file : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicerestore -d $PATH");
		}
	}
	if ($restore == 2) {
		print "Enter the directory to the custom firmware : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicerestore -d -c $PATH");
	}
}
if ($command == 18) {
	print "Enter the directory to save the screenshot";
	my $PATH = <>;
	chomp $PATH;
	system("idevicescreenshot");
}
if ($command == 19) {
	print "Press Ctrl + C to stop the syslog\n";
	sleep 3;
	system"idevicesyslog";
}
if ($command == 20 || $command eq "irecovery") 
{
	system("clear");
	print "1) Send file to device \n";
	print "2) Send limera1n USB exploit payload\n";
	print "3) Reboot device into normal mode\n";
	print "4) Execute recovery script\n";
	print "5) Start an interactive shell\n";
	my $recovery = <>;
	chomp $recovery;
	if ($recovery == 1) {
		print "Enter the directory to the file : ";
		my $PATH = <>;
		chomp $PATH;

		system("irecovery -f $PATH");
	}
	if ($recovery == 2) {
		print "Enter the directory to the file : ";
		my $PATH = <>;
		chomp $PATH;

		system("irecovery -k $PATH");
	}
	if ($recovery == 3) {
		system ("sudo irecovery -n");
	}
	if ($recovery == 4) {
		print "Enter the directory to the file : "; 
		my $PATH = <>;
		chomp $PATH;
		system("irecovery -e $PATH");
	}	
	if ($recovery == 5) {
		system("sudo irecovery -s");
	}
}


