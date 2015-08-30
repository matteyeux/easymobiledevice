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
#include <string.h>
#include <time.h>
#include "easymobiletools.h"




int main(int argc, char const *argv[])
{	
	int choice;

	system("clear");
	printf("Choose an option");
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
	printf ("20) iRecovery\n\n");
	printf("Commande : ");
	scanf ("%d", &choice);

	if (choice >20)
	{
		printf("\nInvalid command\n");
		sleep (5);
	}
	
	switch (choice)
	{
		case 1 : ideviceactivation(); break;
		case 2 : idevicebackup(); break;
		case 3 : idevicecrashreport(); break;
		case 4 : idevicedate(); break;
		case 5 : idevicedebug(); break;
		case 6 : idevicedebugserverproxy(); break;
		case 7 : idevicediagnostics(); break;
		case 8 : ideviceenterrecovery(); break;
		case 9 : idevice_id(); break;
		case 10 : ideviceimagemounter(); break;
		case 11 : ideviceinfo(); break;
		case 12 : ideviceinstaller(); break;
		case 13 : idevicename(); break;
		case 14 : idevicenotificationproxy(); break;
		case 15 : idevicepair(); break;
		case 16 : ideviceprovision(); break;
		case 17 : idevicerestore(); break;
		case 18 : idevicescreenshot(); break;
		case 19 : idevicesyslog(); break;
		case 20 : irecovery(); break;
	}
	return (EXIT_SUCCESS);
}
