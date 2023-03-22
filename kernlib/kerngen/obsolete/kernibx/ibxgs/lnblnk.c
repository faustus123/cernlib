/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:54:39  mclareni
 * Initial revision
 *
 */
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
/*>    ROUTINE LNBLNK
  CERN PROGLIB# M507    LNBLNK          .VERSION KERNIBX  1.05  920511
  ORIG. 30/04/92, RDM + JZ

  N = LNBLNK (CHLINE)   find last non-blank character in CHLINE
*/
      int lnblnk_(chline, lenpar)
      char  *chline;
      int   *lenpar;
{
      static unsigned int blnk = 0x20202020;
      unsigned int *wdcur;
      char  *chcur;
      int   ntail, i;
      int   len;

      len   = *lenpar;
      chcur = chline + len;
      if (len <= 24)               goto small;

/* ----        handle long string             */

/*        look at the last ntail characters   */

      ntail = ((int)chcur & 3);
      for (i = ntail; i > 0; i--)
        { if (*--chcur != ' ')       goto exit; }

/*        look for trailing blank words   */

      wdcur = (unsigned int*) (chcur-4);
      while (wdcur >= (unsigned int*)chline )
        {  if (*wdcur != blnk)   break;  wdcur--; }

/*        find last non-blank character   */

      chcur = (char*) (wdcur+1);
      while (chcur > chline)
        {  if (*--chcur != ' ')      goto exit; }
      return 0;

exit: return chcur+1 - chline;

/* ----        handle short string            */

small:
      while (chcur > chline)
        {  if (*--chcur != ' ')      goto exit; }
      return 0;
}
/*> END <----------------------------------------------------------*/
#ifdef CERNLIB_TCGEN_LNBLNK
#undef CERNLIB_TCGEN_LNBLNK
#endif
