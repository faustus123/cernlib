*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:26  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE LSQQR (A,X,B,M,N,IP,IM,IN,ERR,WORK)
      DIMENSION A(IM,N),X(IN,IP),B(IM,IP),WORK(1)
      LOGICAL ERR
#if defined(CERNLIB_CDC)
      DATA ETAE/1.0E-14/
#endif
#if !defined(CERNLIB_CDC)
      DATA ETAE/1.E-6/
#endif
C
C        THE ARRAY A(M,N) CONTAINS THE GIVEN MATRIX OF AN
C        OVERDETERMINED SYSTEM OF M LINEAR EQUATIONS IN N
C        UNKNOWNS (M \ N).  FOR THE IP RIGHT HAND SIDES GIVEN
C        AS THE COLUMNS OF THE ARRAY B(M,IP), THE LEAST SQUARES
C        SOLUTIONS ARE COMPUTED AND STORED AS THE COLUMNS OF THE
C        ARRAY X(N,IP).  IF RANK(A) < N, THEN THE PROBLEM IS LEFT
C        UNSOLVED AND THE LOGICAL VARIABLE ERR IS SET TO .FALSE.
C        AND CONTROL IS RETURNED TO THE MAIN PROGRAM.
C          IN EITHER CASE, A AND B ARE LEFT INTACT.  ETA IS THE
C        RELATIVE MACHINE PRECISION.
C
C        THE ARRAY WORK (LENGTH  7*N+M*N+M) IS USED TO HOLD THE
C        FOLLOWING ARRAYS, WHICH ARE USED IN THIS AND THE CALLED
C        SUBROUTINES :-
C
C          REAL   ALPHA(N)   WHERE WORK(1) = ALPHA(1).
C          REAL       E(N)   WHERE WORK(N+1) = E(1).
C          REAL       Y(N)   WHERE WORK(2*N+1) = Y(1).
C          REAL     SUM(N)   WHERE WORK(3*N+1) = SUM(1).
C          REAL       Z(N)   WHERE WORK(4*N+1) = Z(1).
C          REAL      YA(N)   WHERE WORK(5*N+1) = YA(1).
C          REAL       R(M)   WHERE WORK(6*N+1) = R(1).
C          REAL      QR(M,N) WHERE WORK(6*N+M+1) = QR(1,1).
C        INTEGER IPIVOT(N)   WHERE WORK(6*N+M*N+M+1) = IPIVOT(1).
C
C        THUS, IN THIS SUBROUTINE, THESE ARRAYS ARE REFERENCED
C        BY THE ONE ARRAY NAME, WORK.
C
      IMP1=M*N+6*N+M+1
      IMP2=6*N+M+1
      IMP3=6*N+1
      IMP4=4*N+1
      JO=IMP3-1
      JO1=2*N
C
      CALL PROC1(A,WORK(IMP2),M,N,IM)
      CALL DECOMP(M,N,WORK(IMP2),WORK(1),WORK(IMP1),ERR,WORK(5*N+1),
     1            WORK(3*N+1))
      IF(.NOT. ERR) RETURN
C
      ETA=ETAE**2
      DO 55  K=1,IP
      DO 10  I=1,M
      JU=JO+I
 10   WORK(JU)=B(I,K)
      CALL SLV  (M,N,WORK(IMP2),WORK(1),WORK(IMP1),WORK(IMP3),
     1           WORK(2*N+1),WORK(IMP4))
      DO 15  I=1,M
      JU=JO+I
 15   WORK(JU)=-PROD2(A,WORK(2*N+1),IM,1,N,I,-B(I,K))
      CALL SLV  (M,N,WORK(IMP2),WORK(1),WORK(IMP1),WORK(IMP3),
     1           WORK(N+1),WORK(IMP4))
      YNORM0=0
      ENORM1=0
      DO 20  I=1,N
      JU=JO1+I
      YNORM0=YNORM0+WORK(JU)**2
      JU=N+I
 20   ENORM1=ENORM1+WORK(JU)**2
C
C        NO ATTEMPT AT OBTAINING THE SOLUTION IS MADE, UNLESS
C        THE NORM OF THE FIRST CORRECTION IS SIGNIFICANTLY SMALLER
C        THAN THE NORM OF THE INITIAL SOLUTION.
      IF(ENORM1.LE. 0.0625*YNORM0) GO TO 25
      ERR=.FALSE.
      RETURN
 25   DO 30  I=1,N
      JU=JO1+I
      JU1=N+I
 30   WORK(JU)=WORK(JU)+WORK(JU1)
C
C        TERMINATE THE ITERATION IF THE CORRECTION WAS OF LITTLE
C        SIGNIFICANCE.
      IF(ENORM1 .LT. ETA*YNORM0) GO TO 45
      DO 35  I=1,M
      JU=JO+I
 35   WORK(JU)=-PROD2(A,WORK(2*N+1),IM,1,N,I,-B(I,K))
      CALL SLV  (M,N,WORK(IMP2),WORK(1),WORK(IMP1),WORK(IMP3),
     1          WORK(N+1),WORK(IMP4))
      ENORM0=ENORM1
      ENORM1=0
      DO 40  I=1,N
      JU=N+I
 40   ENORM1=ENORM1+WORK(JU)**2
C
C        TERMINATE THE ITERATION ALSO IF THE NORM OF THE
C        CORRECTION FAILED TO DECREASE SUFFICIENTLY, AS COMPARED
C        WITH THE NORM OF THE PREVIOUS CORRECTION.
      IF(ENORM1 .LE. 0.0625*ENORM0) GO TO 25
 45   DO 50  I=1,N
      JU=JO1+I
 50   X(I,K)=WORK(JU)
 55   CONTINUE
      RETURN
      END
