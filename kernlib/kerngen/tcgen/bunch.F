*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:40  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      SUBROUTINE BUNCH (INT,CHAR,NCHP,NBITS)
C
C CERN PROGLIB# M436    BUNCH           .VERSION KERNFOR  4.31  911111
C
      DIMENSION    CHAR(*), INT(*)
      DIMENSION    NCHP(9), IPAR(5)
      DATA  IPAR   / 0, 0, 0, 0, 0 /
C
      NCH     = NCHP(1)
      IPAR(1) = NBITS
      IPAR(3) = NCH*IPAR(1) + 127
C
      CALL PKCHAR (INT,CHAR,NCH,IPAR)
      RETURN
      END
