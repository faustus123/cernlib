*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:16  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      SUBROUTINE VFLOAT (IA,A,N)
C
C CERN PROGLIB# F121    VFLOAT          .VERSION KERNFOR  3.15  820113
C ORIG. 03/05/72
C
      DIMENSION A(*), IA(*)
C
      IF (N.LE.0)  RETURN
      DO 9 J=1,N
    9 A(J)= IA(J)
      RETURN
      END
