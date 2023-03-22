/*DECK ID>, GETENI. */
/*>    ROUTINE GETENI
  CERN PROGLIB# Z265    GETENI          .VERSION KERNFOR  4.31  911111
  ORIG. 22/02/91, JZ
  Fortran interface routine to getenv

      CALL GETENVF (NAME, TEXT*)

          NAME  the name of the environment variable,
          TEXT  returns its value
                ISLATE(1) returns its length
*/
#include <stdio.h>
#include <stdlib.h>
void geteni_(fname, ftext, lgtext, lgname)
      char *fname, *ftext;
      int  *lgtext, *lgname;
{
      char *ptname, *fchtak();
      char *pttext, *getenv();
      int  fchput();

      pttext = NULL;
      ptname = fchtak(fname,*lgname);
      if (ptname == NULL)          goto out;
      pttext = getenv (ptname);
      free((void*)ptname);

out:  *lgtext = fchput (pttext,ftext,*lgtext);
      return;
}
/*> END <----------------------------------------------------------*/
