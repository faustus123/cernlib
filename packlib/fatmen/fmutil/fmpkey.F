*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:15  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMPKEY(KEYS,NKEYS)
      DIMENSION KEYS(NKEYS)
#include "fatmen/fatbank.inc"
*
*     Prints out KEYS vector in a readable manner
*
      WRITE(LPRTFA,9001) (KEYS(I),I=1,NKEYS-1)
9001  FORMAT(' Key serial number = ',I6,' filename = ',5A4,
     +' data repr. = ',I3,' media type = ',I2,' location code = ',I6)
      END
 
