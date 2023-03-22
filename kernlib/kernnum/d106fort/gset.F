*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:46  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
      SUBROUTINE GSET(A,B,N,X,W)
      DIMENSION X(N),W(N)
      EXTERNAL GQUAD
      REAL     GQUAD
C     (GQUAD IS HERE USED ONLY AS A DUMMY ARGUMENT FOR D106XX.)
C
C     ******************************************************************
C
C     THE ABSCISSAE AND WEIGHTS FOR THE N-POINT GAUSS-LEGENDRE QUADRAT-
C     URE FORMULA CORRESPONDING TO THE INTERVAL (A,B) ARE PLACED IN AR-
C     RAYS X AND W RESPECTIVELY.
C
C     CALLS ... SUBROUTINE D106XX.
C
C     ******************************************************************
C
C  START.
      CALL D106XX(2,GQUAD,A,B,N,X,W)
      RETURN
      END
