#!/usr/bin/perl

use strict;
use warnings;

print "Que souhaitez-vous faire : \n";
print " 1) ideviceactivation\n";
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
my $command = <>;
chomp $command;

if ($command == 1) {
	print "Entrez votre UDID\n";
	my $UDID = <>;
	chomp $UDID;

	print "1) Activer\n";
	print "2) Desactiver\n";
	my $activator = <>;
	chomp $activator;
	if ($activator == 1) {
		print "Activation...\n";
		`ideviceactivation activate $UDID`;
	}
	if ($activator == 2) {
		print "Desactivation...\n";
		`ideviceactivation deactivate $UDID`;
	}
}
if ($command == 2) {
	print "Entrez votre UDID\n";
	my $UDID = <>;
	chomp $UDID;

	print "1) Sauvegarder\n";
	print "2) Restaurer la sauvegarde\n";
	my $backup = <>;
	chomp $backup;
	
	if ($backup == 1) {
		print "Placer la sauvegarde dans : /home/";
		my $copie_sauvegarde = <>;
		chomp $copie_sauvegarde;
		`idevicebackup backup -d -u $UDID $copie_sauvegarde`;
		
	}
	if ($backup == 2) {
		print "Restauration de la sauvegarde\n";
		print "Indiquer ou se trouve la sauvegarde : ";
		my $sauvegarde = <>;
		chomp $sauvegarde;
		print "Restauration en cour...\n";
		`idevicebackup restore -d -u $UDID $sauvegarde`;
		sleep 10;
		print "Restauration réussie\n";
	}
}
if ($command == 3) {
	print "idevicecrashreport\n";
}
if ($command == 4) {
	print "idevicedate\n";
	`idevicedate`;
}
if ($command == 5) {
	print "idevicedebug\n";
}
if ($command == 6) {
	print "idevicedebugserverproxy\n";
	print "port : ";
	my $port = <>;
	chomp $port;
	`idevicedebugserverproxy $port -d `; #Fixer le probleme de port pour le .c
}
if ($command == 7) {
	print "idevicediagnostics\n";
}
if ($command == 8) {
	print "Entrez votre UDID\n";
	my $UDID = <>;
	chomp $UDID;
	`ideviceenterrecovery $UDID`;

}
if ($command == 9) {
	print "idevice_id\n";
	`idevice_id -d -l`; #la commande est ok mais rien n'est affché
}
if ($command == 10) {
	print "ideviceimagemounter\n";
}
if ($command == 11) {
	print "ideviceinfo\n";
	`ideviceinfo`
}
if ($command == 12) {
	print "ideviceinstaller\n";
}
if ($command == 13) {
	print "idevicename\n";
	`idevicename`;
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
		`idevicepair pair -d `;
	}
	if ($idevicepair == 2) {
		print "idevicepair unpair\n";
		`idevicepair unpair`;
	}

}
if ($command == 16) {
	
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
	print "idevicerestore\n";
}
if ($command == 18) {
	print "idevicescreenshot\n";
	`idevicescreenshot`;
}
if ($command == 19) {
	print "idevicesyslog\n";
	`idevicesyslog`;
}
if ($command == 20) {
	print "iRecovery\n";
}






























































