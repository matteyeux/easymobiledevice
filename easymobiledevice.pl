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
	char UDID[41];

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
	
	printf("Entrez votre UDID\n");
	scanf("%s", UDID);

	if (command == 1) //ideviceactivation
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

	if (command == 2) //idevicebackup
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
	if (command == 3) //idevicecrashreport
	{
		printf("idevicecrashreport\n");
	}
	if (command == 4) //idevicedate
	{
		printf("idevicedate\n");
		system("idevicedate");
	}
	if (command == 5) //idevicedebug
	{
		printf("idevicedebug\n"); //A tester
	}
	if (command == 6) //idevicedebugserverproxy
	{	
		int port;
		printf("idevicedebugserverproxy\n");
		//printf("port : ");
		//scanf("%d", &port);
		//printf("%d\n",port );
		system("idevicedebugserverproxy -d"); /*Voir pour ajouter un port*/ 
	}
	if (command == 7)
	{	
		printf("idevicediagnostics\n");
	}
	if (command == 8) //idevicediagnostics
	{
		printf("ideviceenterrecovery\n");
		system("ideviceenterrecovery -u");
	}
	if (command == 9) //idevice_id
	{
		printf("idevice_id\n");
		system("idevice_id -l"); //OK
	}
	if (command == 10) //ideviceimagemounter
	{
		printf("ideviceimagemounter\n");
	}
	if (command == 11) //ideviceinfo
	{
		printf("ideviceinfo\n");
		system("ideviceinfo");
	}
	if (command == 12) //ideviceinstaller
	{
		printf("ideviceinstaller\n");
	}
	if (command == 13) //idevicename
	{
		printf("idevicename\n");
		system("idevicename");
	}
	if (command == 14) //idevicenotificationproxy
	{
		printf("idevicenotificationproxy\n");
	}
	if (command == 15) //idevicepair
	{	
		int apairage;

		printf ("1) idevicepair pair\n");
		printf ("2) idevicepair unpair\n");
		scanf("%d", &apairage);

		if (apairage == 1)
		{
			printf("idevicepair pair\n");
		}
		if (apairage == 2)
		{
			printf("idevicepair unpair\n");
		}
		else {
			printf("Mauvaise option\n");
		}

	}
	if (command == 16) //ideviceprovision
	{
		printf("ideviceprovision\n");
	}
	if (command == 17) //idevicerestore
	{
		printf("idevicerestore\n"); 
	}
	if (command == 18) //idevicescreenshot
	{
		printf("idevicescreenshot\n");
		system("idevicescreenshot");
	}
	if (command == 19) //idevicesyslog
	{
		printf("idevicesyslog\n");
		system("idevicesyslog");
	}
	if (command == 20) //iRecovery
	{
		printf("iRecovery\n");
	}
}
