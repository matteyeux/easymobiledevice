/*
*Copyright (c) 2015 Mathieu Hautebas
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{	
	int command;
	char UDiD[40];

	printf ("Que souhaitez-vous faire \n");
	printf (" 1) ideviceactivation\n");
	printf (" 2) idevicebackup\n");
	printf (" 3) idevicecrashreport\n");
	printf (" 4) idevicedate\n");
	printf (" 5) idevicedebug\n");
	printf (" 6) idevicedebugserverproxy\n");
	printf (" 7) idevicediagnostics\n");
	printf (" 8) ideviceenterrecovery\n");
	printf (" 9) idevice_id \n");
	printf ("10) ideviceimagemounter\n");
	printf ("11) ideviceinfo\n");
	printf ("12) ideviceinstaller\n");
	printf ("13) idevicename\n");
	printf ("14) idevicenotificationproxy\n");
	printf ("15) idevicepair\n");
	printf ("16) ideviceprovision\n");
	printf ("17) idevicerestore\n"); 
	printf ("18) idevicescreenshot\n");
	printf ("19) idevicesyslog\n");
	printf ("20) iRecovery\n");
	scanf ("%d", &command);
	
	printf ("Souhaitez-vous entrer votre UDID ? (Certaines fonctions de libimobiledevice necessitent votre UDID.\n");
	printf ("1) OUI\n");
	printf ("2) NON\n");
	scanf ("%s", &UDID);
	
	printf("%s",&UDID);
	if (command == 1)
	{	int activator;
		printf("1) Activer votre appareil\n");
		printf("2) Desactiver votre appareil\n");
		scanf ("%d", &activator);

		if (activator == 1)
		{	
			printf("Activation\n");
			system("ideviceactivation activate");
		}
		if (activator == 2)
		{
			printf("Desactivation\n");
			system("ideviceactivation deactivate");
		}
	}

	if (command == 2)
	{	int backup;
		// Ajouter l'UDID
		printf("1) Sauvegarder\n");
		printf("2) Restaurer la sauvegarde\n");
		scanf ("%d", &backup);
		if (backup == 1)
		{
			printf("Sauvegarde\n");
			system("idevicebackup backup -d -u ");
		}
		if (backup == 2)
		{
			printf("Restauration de la sauvegarde\n");
			//indiquer ou se trouve la sauvegarde
		}
	}
	if (command == 3)
	{
		printf("idevicecrashreport\n");
	}
	if (command == 4)
	{
		printf("idevicedate\n");
	}
}	if (command == 5)
	{
		printf("idevicedebug\n");
	}
	if (command == 6)
	{
		printf("idevicedebugserverproxy\n");
	}
	
























