*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:11  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMSPAC(IPRIM,ISEC,IRC)
#include "fatmen/faspac.inc"
*
*     Set primary and secondary space allocation
*
      IRC = 0
      IF(IPRIM.LE.0.OR.ISEC.LT.0) IRC = -1
      IF(IPRIM.GT.1000000.OR.ISEC.GT.1000000) IRC = -2
 
      NPRIFA = IPRIM
      NSECFA = ISEC
 
      END
