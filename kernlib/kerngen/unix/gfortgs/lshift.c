/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  2006/09/15 09:35:25  mclareni
 * Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
 *
 * Revision 1.1.1.1  1996/02/15 17:50:07  mclareni
 * Kernlib
 *
 */
#include "kerngen/pilot.h"
/*>    ROUTINE ISHFT
  CERN PROGLIB#         ISHFT           .VERSION KERNLNX  1.00  930507

  Provides the value of the argument ARG with the bits shifted.
  Bits shifted out to the left or right are lost, and zeros are shifted
  in from the opposite end.      CNL 210
*/
unsigned int lshift_(arg,len)
unsigned int *arg;
int *len;
{
     return((*len > 0)? *arg << *len: *arg >> (-*len));
}
/*> END <----------------------------------------------------------*/
