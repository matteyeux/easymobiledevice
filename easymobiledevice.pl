#!/usr/bin/perl
#Command line interface to use Libimobiledevice
#Utility developed by Mathieu Hautebas
#

use strict;
use warnings;
system("clear");
print "Que souhaitez-vous faire : \n";
print " 1) ideviceactivation \n";
print " 2) idevicebackup *restauration de la sauvegarde\n";
print " 3) idevicecrashreport\n";
print " 4) idevicedate\n";
print " 5) idevicedebug *\n";
print " 6) idevicedebugserverproxy *\n";
print " 7) idevicediagnostics\n";
print " 8) ideviceenterrecovery\n";
print " 9) idevice_id \n";
print "10) ideviceimagemounter *\n";
print "11) ideviceinfo\n";
print "12) ideviceinstaller *\n";
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

if ($command == 1 ) {
	system("clear");
	print "Entrez votre UDID\n";
	my $UDID = <>;
	chomp $UDID;

	print "1) Activer\n";
	print "2) Desactiver\n";
	my $activator = <>;
	chomp $activator;
	if ($activator == 1) {
		print "Activation...\n";
		system("ideviceactivation activate $UDID");
	}
	if ($activator == 2) {
		print "Desactivation...\n";
		system("ideviceactivation deactivate $UDID");
	}
}
if ($command == 2) { #Check du code source de idevicebackup pour voir comment il detecte la version
	system("clear");
	print "1) Sauvegarde\n";
	print "2) Restaurer une sauvegarde\n";
	my $backup = <>;
	chomp $backup;

	if ($backup == 1) {
		print "Version de votre appareil :  ";
		my $version = <>;
		chomp $version;

		print "$version\n";
		if ($version < 4) {
			print "version inferieure ou egale à iOS 3";
			print "Entrer le repertoire ou va etre copiée la sauvegarde : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup backup $PATH"); 
		}
		else {
			print "Version superieure à iOS 3\n";
			print "Entrer le repertoire ou va etre copiee la sauvegarde : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup2 backup $PATH");
		}
	}
	if ($backup == 2) {
		print "Version de votre appareil :  ";
		my $version = <>;
		chomp $version;

		if ($version < 4 ) {
			print "version inferieure à iOS 3\n";
			print "Entrer le repertoire vers la copie de sauvegarde : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup restore $PATH");
		}
		else {
			print "version superieure à iOS 4\n";
			print "Entrer le repertoire vers la copie de sauvegarde : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicebackup2 restore $PATH");
		}

	}
}	
if ($command == 3) {
	system("clear");
	print "1) Extraire le rapport de crash dans un fichier separé .crash\n";
	print "2) Copier sans supprimerle rapport de crash de l'appareil\n";
	my $crashreport = <>;
	chomp $crashreport;

	if ($crashreport == 1) {
		print "Entrer le repertoire ou va être extrait le rapport de crash : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicecrashreport --extract $PATH");
	}
	if ($crashreport == 2) {
		print "Entrer le repertoire ou va être copié le rapport de crash : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicecrashreport --keep $PATH");
	}
}
if ($command == 4) {
	system("clear");
	print "\n";
	system("idevicedate");
}
if ($command == 5) {
	system("clear");
	print "Entrer les variables d'environement : ";
	my $variable = <>;
	chomp $variable;
	print "Entrer la commande : ";
	my $cmd = <>;
	chomp $cmd;
	system("idevicedebug -d -e $variable $cmd");  
	
}
if ($command == 6) {
	system("clear");
	print "port : ";
	my $port = <>;
	chomp $port;
	system("idevicedebugserverproxy $port -d"); #Fixer le probleme de port pour le .c
}
if ($command == 7) {
	system("clear");
	print "1) Diagnostics\n";
	print "2) Mobilegestalt\n";
	print "3) IOreg\n";
	print "4) Shutdown\n"; 
	print "5) Restart\n";
	print "6) Sleep\n";
	my $diagnostics = <>;
	chomp $diagnostics;

	if ($diagnostics == 1) {
		print "Entrer le type de diagnostic (All, WiFi, GasGauge, NAND) : ";
		my $action = <>;
		chomp $action;
		system("idevicediagnostics diagnostics $action");
	}
	if ($diagnostics == 2) {
		print "Entrer les clés avec en séparant par des espaces : ";
		my $keys = <>;
		chomp $keys;
		system("idevicediagnostics mobilegestalt $keys");
	}
	if ($diagnostics == 3) {
		print "\niOS 5 ou ulterieur\n";
		print "Entrer des arguments (IODeviceTree, IOPower, IOService) : ";
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
	print "Entrez votre UDID\n";
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
	print "Entrer le repertoire vers le ficher à monter : ";
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
	print "1) Afficher la liste des apps installées\n";
	print "2) Installer une app depuis un archive\n";
	print "3) Désinstaller une app\n";
	print "4) Upgrade de l'app via un archive\n";
	print "5) Listage des archives\n";
	print "6) Archive APPID\n";
	print "7) restaurer APPID\n";
	print "8) Supprimer APPID\n";
	my $installer = <>;
	chomp $installer;

	if ($installer == 1) {
		print "1) Afficher les apps mobile\n";
		print "2) Afficher les apps system\n";
		print "3) Afficher toutes les apps\n";
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
		print "Entrer le repertoire vers le ficher à installer : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceinstaller -i $PATH");
	}
	if ($installer == 3) {
		print "Desinstaller une app\n";
	}
	if ($installer == 4) {
		print "Upgrade de l'app via un archive\n";
	}
	if ($installer == 5) {
		print "Listage des archives\n";
	}
	if ($installer == 6) {
		print "Archive APPID\n";
	}
	if ($installer == 7) {
		print "restaurer APPID\n";
	}
	if ($installer == 8) {
		print "Supprimer APPID\n";
	}
	else {
		system("clear");
		print "Mauvaise option\n\n";
	}
}
if ($command == 13) {
	print "idevicename\n";
	system("idevicename");
}
if ($command == 14) {
	print "idevicenotificationproxy\n";
}
if ($command == 15) {
	print "1) idevicepair pair\n";
	print "2) idevicepair unpair\n";
	my $idevicepair = <>;
	chomp $idevicepair;
	
	if ($idevicepair == 1) {
		print "idevicepair pair\n";
		system("idevicepair pair -d");
	}
	if ($idevicepair == 2) {
		print "idevicepair unpair\n";
		system("idevicepair unpair");
	}

}
if ($command == 16) {
	system("clear");
	print "ideviceprovision\n";
	print "1) Installer un profil\n";
	print "2) Afficher les profils installés sur l'appareil\n"; 
	print "3) Copier les profils installés sur l'appareil\n";
	print "4) Supprimer un profil\n";
	print "5) Afficher les informations du profil\n";
	my $provision = <>;
	chomp $provision;

	if ($provision == 1) {
		print "Repertoire vers le profil : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision install $PATH");
	}
	if ($provision == 2) {
		system("ideviceprovision list");
	}
	if ($provision == 3) {
		print "Entrer le repertoire ou vont etre copies les profils : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision copy $PATH");
	}
	if ($provision == 4) {
		print "Entrer l'identifiant du profil (UUID) : ";
		my $UUID = <>;
		chomp $UUID;
		system("ideviceprovision remove $UUID");
	}
	if ($provision == 5) {
		print "Entrer le repertoire vers le profil : ";
		my $PATH = <>;
		chomp $PATH;
		system("ideviceprovision dump $PATH");
	}
}
if ($command == 17) {
	print "1) Restauration\n";
	print "2) Restauration avec un custom firmware\n";
	my $restore = <>;
	chomp $restore;

	if ($restore == 1) {
		print "Télécharger la dernière version d'iOS ?\n";
		print "1) OUI\n";
		print "2) NON\n";
		my $dlversion = <>;
		chomp $dlversion;
		if ($dlversion == 1) {

			print "La dernière version d'iOS signée pour votre iDevice va être téléchargée, puis la restauration va commencer\n";
			sleep 3;
			system("idevicerestore -d -l");
		}
		if ($dlversion == 2) {
			print "Entrer le repertoire vers le fichier .ipsw : ";
			my $PATH = <>;
			chomp $PATH;

			system("idevicerestore -d $PATH");
		}
	}
	if ($restore == 2) {
		print "Entrer le repertoire vers le custom firmware : ";
		my $PATH = <>;
		chomp $PATH;
		system("idevicerestore -d -c $PATH");
	}
}
if ($command == 18) {
	system("idevicescreenshot");
}
if ($command == 19) {
	print "Ctrl + C pour annuler\n";
	sleep 3;
	system"idevicesyslog";
}
if ($command == 20) {
	system("clear");
	print "1) Envoyer un fichier vers l'appareil\n";
	print "2) Envoyer un payload grace à l'exploit limera1n (A4 only)\n";
	print "3) Sortir l'appareil du Recovery Mode\n";
	print "4) Executer un script recovery\n";
	my $recovery = <>;
	chomp $recovery;
	if ($recovery == 1) {
		print "Entrer le repertoire vers le ficher à envoyer : ";
		my $PATH = <>;
		chomp $PATH;

		system("irecovery -f $PATH");
	}
	if ($recovery == 2) {
		print "Entrer le repertoire vers le payload à envoyer : ";
		my $PATH = <>;
		chomp $PATH;

		system("irecovery -k $PATH");
	}
	if ($recovery == 3) {
		print "Il faut etre superutilisateur pour utiliser cette fonction\n";
		system ("sudo irecovery -n");
	}
	if ($recovery == 4) {
		print "Entrer le repertoire vers le script à executer : ";
		my $PATH = <>;
		chomp $PATH;
		system("irecovery -e $PATH");
	}	
}
