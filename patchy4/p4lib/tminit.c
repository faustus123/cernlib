/*DECK ID>, TMINIT. */
/*>    ROUTINE TMINIT
  CERN PROGLIB#         TMINIT          .VERSION KERNFOR  4.29  910718
  ORIG. 20/07/90, RH + JZ
  Fortran interface routine to initialize TMPRO / TMREAD
      CALL TMINIT (INIT)
*/
#include <stdio.h>
void tminit_(ptinit)
      long *ptinit;
{
      *ptinit = 7;
/*    setbuf (stdout,NULL);        */
      return;
}
/*> END <----------------------------------------------------------*/
