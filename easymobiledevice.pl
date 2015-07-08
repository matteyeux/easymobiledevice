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
print "20) iRecovery\n\n"
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
	print "Entrez votre UDID\n Si vous ne connaissez pas votre UDID vous pouvez utiliser ideviceinfo ou idevicepair pour afficher celui-ci\n";
	my $UDID = <>;
	chomp $UDID;

	print ""

	`idevicecrashreport -d -e -u $UDID /home`;

}

































































