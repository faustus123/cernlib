/*DECK ID>, GETWDI. */
/*>    ROUTINE GETWDI
  CERN PROGLIB# Z265    GETWDI          .VERSION KERNFOR  4.31  911111
  ORIG. 22/02/91, JZ
  Fortran interface routine to getwd

      CALL GETWDF (TEXT*)

      returns the name of the c.w.d. in TEXT
      ISLATE(1) returns its lenth NTEXT
*/
#include <stdio.h>
#include <stdlib.h>
void getwdi_(fname, lgname)
      char *fname;
      int  *lgname;
{
      char *ptalc, *pttext;
      int  fchput();
      int  nalc;
      char *getwd();

      pttext = NULL;
      nalc   = 2048;
      ptalc  = (char *)malloc(nalc);
      if (ptalc == NULL)           goto out;

      pttext = getwd (ptalc);

out:  *lgname = fchput (pttext,fname,*lgname);
      if (ptalc != NULL)   free((void *)ptalc);
      return;
}
/*> END <----------------------------------------------------------*/
