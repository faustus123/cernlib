/*DECK ID>, RENAMI. */
/*>    ROUTINE RENAMI
  CERN PROGLIB# Z265    RENAMI          .VERSION KERNFOR  4.31  911111
  ORIG. 22/02/91, JZ
  Fortran interface routine to rename

      ISTAT = RENAMEF (FROM, TO)

          FROM  old file name
            TO  new file name
         ISTAT  zero if successful
*/
#include <stdio.h>
#include <stdlib.h>
int renami_(frpath, topath, lgfr, lgto)
      char *frpath, *topath;
      int  *lgfr, *lgto;
{
      char *ptfr, *ptto, *fchtak();
      int  istat, rename();

      istat = -1;
      ptfr  = fchtak(frpath,*lgfr);
      if (ptfr == NULL)            goto bad;

      ptto  = fchtak(topath,*lgto);
      if (ptto == NULL)            goto pre;

      istat = rename (ptfr, ptto);

      free (ptto);
pre:  free (ptfr);
bad:  return istat;
}
/*> END <----------------------------------------------------------*/
