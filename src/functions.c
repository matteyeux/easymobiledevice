#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>

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
