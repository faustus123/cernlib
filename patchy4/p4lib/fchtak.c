/*DECK ID>, FCHTAK. */
/*>    ROUTINE FCHTAK
  CERN PROGLIB#         FCHTAK          .VERSION KERNFOR  4.31  911111
  ORIG. 22/02/91, JZ

      copy a Fortran character string
      to allocated memory zero-terminated,
      return the memory pointer
*/
#include <stdio.h>
#include <stdlib.h>
char *fchtak(ftext,lgtext)
      char *ftext;
      int  lgtext;
{
      char *ptalc, *ptuse;
      char *utext;
      int  nalc;
      int  ntx, jcol;

      nalc  = lgtext + 8;
      ptalc = (char *) malloc (nalc);
      if (ptalc == NULL)     goto exit;
      utext = ftext;

      ptuse = ptalc;
      ntx   = lgtext;
      for (jcol = 0; jcol < ntx; jcol++)  *ptuse++ = *utext++;

      *ptuse = '\0';
exit: return  ptalc;
}
/*> END <----------------------------------------------------------*/
