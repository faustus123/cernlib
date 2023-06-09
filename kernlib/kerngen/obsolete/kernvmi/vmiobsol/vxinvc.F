*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:54:18  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE VXINVC (MVI,MVX,NW)

C CERN PROGLIB# M434    VXINVC          .VERSION KERNVMI  1.01  891208
C ORIG.  12-June-87, F. Carminati + J. Zoll

C-    VX invert bytes and copy
C-    Fortran version, slower than the machine-language routine

      DIMENSION    MVI(99), MVX(99)
      LOGICAL*1    LLD(4),    LST(4)
      EQUIVALENCE (LLD,MLD), (LST,MST)

      DO 29  J=1,NW
      MLD    = MVI(J)
      LST(1) = LLD(4)
      LST(2) = LLD(3)
      LST(3) = LLD(2)
      LST(4) = LLD(1)
      MVX(J) = MST
   29 CONTINUE
      END
