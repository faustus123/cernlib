/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:52:42  mclareni
 * Initial revision
 *
 */
#include "kerncry/pilot.h"
/*>    ROUTINE SIGON
  CERN PROGLIB#         SIGON           .VERSION KERNIRT  1.03  910314
  ORIG. 25/10/91, JZ
  Fortran interface routine to sigon / sigoff
*/
int  SIGON()
{
      return ((int) sigon());
}
int  SIGOFF()
{
      return ((int) sigoff());
}
/*> END <----------------------------------------------------------*/
