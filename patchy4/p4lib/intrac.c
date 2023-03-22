/*DECK ID>, INTRAC. */
/*>    ROUTINE INTRAC
  CERN PROGLIB# Z044    INTRAC          .VERSION KERNFOR  4.26  910313
*/
#include <unistd.h>
int intrac_()
{
    return ((int) isatty(0));
}
/*> END <----------------------------------------------------------*/
