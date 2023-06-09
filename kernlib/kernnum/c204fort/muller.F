*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:46  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
       SUBROUTINE MULLER (A,N,C)
C
C         MODIFIED TO ELIMINATE STOP AND AVOID COMPILER DIAGNOSTICS
C         DUE TO ASSIGNED GOTO INTO DO 17.  H.LIPPS, 30.6.1982.
C
C-----COMPUTES ROOTS OF POLYNOMIAL A(1)*X**N+...A(N)*X+A(N+1) = 0.
C     BY METHOD OF D.E.MULLER,M.T.A.C.,VOL 10, P208-215 (1956).
C     DURING EXECUTION THE ARRAY C CONTAINS SCALED,COMPLEX POLYNOMIAL
C     COEFFICIENTS.AFTER EXECUTION IT CONTAINS COMPLEX ROOTS.
C     THE FOLLOWING ARE DUMMY ARRAY DIMENSIONS
      DIMENSION A(9),C(9)
      COMPLEX C,DX,X,X3,Y1,Y2,Y,TE1,TE2,TE3,TE4,TE5,TE6,TE7
#if defined(CERNLIB_IBMRT)
      EXTERNAL CABS
#endif
      LOGICAL MFLAG, RFLAG
#if defined(CERNLIB_NUMHIPRE)
      DATA ETA1/1.E-14/ ,ETA2/.6E-7/
#endif
#if defined(CERNLIB_NUMLOPRE)
      DATA ETA1/1.E-6/,ETA2/1.E-3/
#endif
      SUMABS(X)=ABS(REAL(X))+ABS(AIMAG(X))
      IF(N .LT. 1) THEN
         CALL KERMTR('C204.1',LGFILE,MFLAG,RFLAG)
         IF(MFLAG) THEN
            IF(LGFILE .EQ. 0) THEN
               WRITE(*,1000) N
            ELSE
               WRITE(LGFILE,1000) N
            ENDIF
         ENDIF
         IF(.NOT. RFLAG) CALL ABEND
         RETURN
      ENDIF
      IF(A(1).EQ.0.) GO TO 105
C
C-----EXTRACT ALL ZERO ROOTS
      N1=N
    2 IF(N1.EQ.1) GO TO 3
      IF(A(N1+1).NE.0.) GO TO 5
      C(N1)=0.
      N1=N1-1
      GO TO 2
    3 C(1)=-A(2)/A(1)
      RETURN
C
C-----NORMALIZE AND SCALE DOWN POLYNOMIAL TO MAKE COEFF.C(0)=C(N1)= 1.
    5 B=1./FLOAT(N1)
      SCALE=ABS(A(N1+1))**B/ABS(A(1))**B
      B=A(1)
      DO 6 I=1,N1
      B=B*SCALE
    6 C(I)=A(I+1)/B
      IF(N1.EQ.2) GO TO 104
C
C-----STARTING VALUES AT X1=+1, X2=-1, X=0.
   10 ASSIGN 20 TO L
      Y1=C(1)+1.
      Y2=C(1)-1.
      DO 11 I=2,N1
      Y1=C(I)+Y1
   11 Y2=C(I)-Y2
      Y=C(N1)
      X=0.
      DX=1.
C
C-----MULLER"S ITERATION
      TE1=-2.
   12 TE2=Y2/Y
      TE3=(Y1-Y2)/(Y*TE1)
      DO 17 ITER=1,2000
      TE4=TE2-1.
      TE5=(TE4-TE3)/(TE1+1.)
      TE6=(TE5+TE4)*.5
      TE7=SQRT(TE6*TE6+TE5)
      TE1=TE6+TE7
      TE7=TE6-TE7
      B=REAL(TE7)**2+AIMAG(TE7)**2
      IF(REAL(TE1)**2+AIMAG(TE1)**2.GT.B) GO TO 13
      IF(B.EQ.0.) TE7=.9
      TE1=TE7
   13 DX=DX/TE1
      X=DX+X
      EPSI=SUMABS(X)*ETA1
      IF(SUMABS(DX).GE.EPSI) GO TO 14
      IF(SUMABS(Y).LT.2.E-3) GO TO 18
   14 Y2=Y
      GO TO 199
C
   15 IF(YA.LT.100.*SUMABS(Y2)) GO TO 16
      IF(SUMABS(DX).LT.EPSI) GO TO 16
C
C-----REDUCE EXCESSIVE STEP SIZE DX,PREVENT OVERFLOW IN POLYN.EVALUATION
      TE1=TE1+TE1
      DX=.5*DX
      X=X-DX
C
C-----EVALUATE POLYNOMIAL AND TEST ZERO.
  199 Y=X+C(1)
      DO 200 I=2,N1
  200 Y=Y*X+C(I)
      YA=SUMABS(Y)
      IF(YA.EQ.0.) GO TO 18
      GOTO 15
C
   16 TE2=Y2/Y
   17 TE3=TE2/TE1*TE4
C-----SCALE DEFLATED POLYNOMIAL
      CN=CABS(C(N1))
      IF (ABS(CN-1.).LT.0.1) GO TO 35
      S=CN**(1./FLOAT(N1))
      SCALE=SCALE*S
      B=1.
      DO 30 I=1,N1
      B=B/S
   30 C(I)=C(I)*B
      GO TO 10
C-----IF ROOT CANNOT BE FOUND  IN 2000 ITERATIONS PRINT ERROR MESSAGE
   35 IMIN=N1+1
      DO 40 I=1,N1
   40 C(I)=1.E20
      IMAX=N+1
      CALL KERMTR('C204.3',LGFILE,MFLAG,RFLAG)
      IF(MFLAG) THEN
         IF(LGFILE .EQ. 0) THEN
            WRITE(*,1003) (A(I),I=1,IMAX)
            IF(N1 .LT. N) WRITE(*,1004) (C(I),I=IMIN,N)
         ELSE
            WRITE(LGFILE,1003) (A(I),I=1,IMAX)
            IF(N1 .LT. N) WRITE(LGFILE,1004) (C(I),I=IMIN,N)
         ENDIF
      ENDIF
      IF(.NOT. RFLAG) CALL ABEND
      RETURN
C
C-----IF ROOT IS COMPLEX,START ITERATION NEAR CONJUGATE ROOT(HIGH PREC.)
   20 IF(ABS(AIMAG(X)).LT.ABS(REAL(X))*ETA2) GO TO 10
      ASSIGN 10 TO L
      X3=CONJG(X)
      DX=CONJG(DX)
      TE1=CONJG(TE1)
      X=X3-DX
      ASSIGN 21 TO M
      GO TO 99
   21 Y2=Y
      X=X-DX*TE1
      ASSIGN 22 TO M
      GO TO 99
   22 Y1=Y
      X=X3
      ASSIGN 12 TO M
      GO TO 99
C
C-----EVALUATE POLYNOMIAL AND TEST ZERO.
   99 Y=X+C(1)
      DO 100 I=2,N1
  100 Y=Y*X+C(I)
      YA=SUMABS(Y)
      IF(YA.NE.0.) GO TO M,(12,21,22)
C
C-----IF A ROOT IS FOUND REDUCE DEGREE OF POLYNOMIAL(DEFLATION)
   18 C(N1)=X*SCALE
      N1=N1-1
      C(1)=X+C(1)
      DO 19 I=2,N1
   19 C(I)=C(I-1)*X+C(I)
      IF(N1.GT.2) GO TO L,(10,20)
C
C-----SOLVE QUADRATIC EQUATION AND RETURN
  104 TE6=.5*C(1)
      C(2)=(CSQRT(TE6*TE6-C(2))-TE6)*SCALE
      C(1)=-C(1)*SCALE-C(2)
      RETURN
  105 IMAX=N+1
      CALL KERMTR('C204.2',LGFILE,MFLAG,RFLAG)
      IF(MFLAG) THEN
         IF(LGFILE .EQ. 0) THEN
            WRITE(*,1001) (A(I),I=1,IMAX)
         ELSE
            WRITE(LGFILE,1001) (A(I),I=1,IMAX)
         ENDIF
      ENDIF
      IF(.NOT. RFLAG) CALL ABEND
      RETURN
C
 1000 FORMAT( 7X, 'SUBROUTINE MULLER ... THE DEGREE N OF THE ',
     +          'POLYNOMIAL =', I6, ' IS LESS THAN 1.')
 1001 FORMAT( 7X, 'SUBROUTINE MULLER ...'/' THE POLYNOMIAL ',
     1'CANNOT HAVE N ROOTS BECAUSE THE COEFFICIENT OF Z**N (FIRST ',
     2'COEFFICIENT ) IS ZERO. THE COEFFICIENTS ARE'/(1H0,8G14.6))
 1003 FORMAT( 7X, 'SUBROUTINE MULLER ... ',' ROOT CANNOT BE FOUND ',
     1'WITH 2000 ITERATIONS'/' REVERSE THE SEQUENCE OF COEFFICIENTS ',
     2' A(N+1)...A(1) AND CALL MULLER  AGAIN TO COMPUTE 1/ROOT.' /
     3 ' THE COEFFICIENTS ARE' //(1H0,8G14.6))
 1004 FORMAT(41H0ONLY THE FOLLOWING ROOTS HAVE BEEN FOUND//(2H (,E20.13,
     11H, ,3X,E20.13,1H) ))
      END
