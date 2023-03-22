/*DECK ID>, TMREAD. */
/*>    ROUTINE TMREAD
  CERN PROGLIB#         TMREAD          .VERSION KERNFOR  4.26  910313
  ORIG. 20/07/90, JZ
      read the next line from stdin :
      CALL TMREAD (MAXCH, LINE, NCH, ISTAT)
          MAXCH   maxim. # of characters into LINE
          NCH     actual # of characters read into LINE
          ISTAT   status return, zero : OK  -ve : EoF
*/
#include <stdio.h>
void tmread_(alim, cols, anch, astat)
      char *cols;
      int  *alim, *anch, *astat;
{
      int ch, jcol, lim;

/*--      read the text   */
      lim  = *alim;
      jcol = 0;
      while (lim-- > 0)
      {   ch = getchar();
          if (ch == EOF)           goto endf;
          if (ch == '\n')          goto endl;
          cols[jcol] = ch;
          jcol = jcol + 1;
       }
/*        discard excess characters   */
loop: ch = getchar();
      if (ch == '\n')          goto endl;
      if (ch != EOF)           goto loop;

endf: *astat = -1;
      clearerr(stdin);
      return;

endl: *anch = jcol;
      *astat = 0;
      return;
}
/*> END <----------------------------------------------------------*/
