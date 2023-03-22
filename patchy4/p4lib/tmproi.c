/*DECK ID>, TMPROI. */
/*>    ROUTINE TMPROI
  CERN PROGLIB#         TMPROI          .VERSION KERNFOR  4.29  910718
  ORIG. 30/05/91, JZ
  Fortran interface routine to print a prompt string
      CALL TMPRO (TEXT)
*/
#include <stdio.h>
#include <unistd.h>
void tmproi_(ftext, lgtext)
      char *ftext;
      long *lgtext;
{
      write (1, ftext, *lgtext);
      return;
}
/*> END <----------------------------------------------------------*/
