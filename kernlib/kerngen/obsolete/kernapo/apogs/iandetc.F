*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:00  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
      FUNCTION IAND (I,J)
C
C CERN PROGLIB# M441    IANDETC         .VERSION KERNAPO  1.10  870524
C ORIG. 01/10/85  T.LINDELOF
C
C     APOLLO versions of functions  IAND, IOR, IEOR

      IAND = AND(I,J)
      END
      FUNCTION IOR (I,J)

      IOR = OR(I,J)
      END
      FUNCTION IEOR (I,J)

      IEOR = XOR(I,J)
      END
