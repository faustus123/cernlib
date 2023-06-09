*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 15:37:35  mclareni
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.49  by  S.Giani
*-- Author :
      SUBROUTINE TRSCPT(PC,RC,PD,RD,IERR)
C
C *** TRANSFORMS ERROR MATRIX
C     FROM   SC   VARIABLES (1/P,LAMBDA,PHI,YT,ZT)
C     FROM   SC   VARIABLES (1/Pt,LAMBDA,PHI,YT,ZT)
 
 
#if !defined(CERNLIB_SINGLE)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      REAL  PC,PD,RC,RD
#endif
#include "geant321/trcom3.inc"
      DIMENSION PC(3),PD(3),RC(15),RD(15)
*
*______________________________________________________________________
*
      IERR = 0
      COSL  = COS(PC(2))
      IF (ABS(COSL).EQ.0) GO TO 901
      COSL1 = 1./COSL
      TANL  =    TAN(PC(2))
*
      PD(1) = PC(1)*COSL1
      PD(2) = PC(2)
      PD(3) = PC(3)
*
      J=0
*
      DO 10 I=1,5
         DO 5 K=I,5
            J=J+1
            A(I,K)=0.
            A(K,I)=0.
            S(J)=RC(J)
    5    CONTINUE
   10 CONTINUE
*
      A(1,1) = COSL1
      A(2,2) = 1.D0
      A(3,3) = 1.D0
      A(4,4) = 1.D0
      A(5,5) = 1.D0
*
      A(1,2) = PD(1)*TANL
C
      CALL SSMT5T(A,S,S)
C
      DO 25 J=1,15
        RD(J)=S(J)
   25 CONTINUE
C
      RETURN
C
C *** ERROR EXITS
C
  901 IERR=1
  910 CONTINUE
C
      END
