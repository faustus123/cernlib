*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:16  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
      SUBROUTINE VLINE (B,ALPHA,C,BETA,A,N)
C
C CERN PROGLIB# F121    VLINE           .VERSION KERNFOR  1.0   710701
C ORIG. 01/07/71
C
      DIMENSION A(*),B(*),C(*)
C
      IF (N.LE.0)  RETURN
      DO 9 I= 1,N
    9 A(I)= B(I)*ALPHA + C(I)*BETA
C
      RETURN
      END
