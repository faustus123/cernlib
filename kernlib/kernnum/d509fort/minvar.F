*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:46  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
      SUBROUTINE MINVAR(X,Y,R,XEPSI,STEP,MAXFUN,A,B,F)
      EXTERNAL F
      LOGICAL   MFLAG, RFLAG
#if defined(CERNLIB_NUMHIPRE)
      DATA TETA/1.E-12/
#endif
#if defined(CERNLIB_NUMLOPRE)
      DATA TETA/1.E-5/
#endif
C  TETA,MACHINE DEPENDENT,IS THE COMPUTER PRECISION TIMES 10**2
C
C  THE TWO FUNCTIONS FA, FB REPRESENT STRAIGHT LINES WITH SLOPE
C  RESPECTIVELY  -1 AND  +1  WHICH CONTINUE THE CURVE AT THE LEFT
C  AND AT THE RIGHT OF A AND B
C
      EPSI=XEPSI
      IF(EPSI.LT.TETA) EPSI=TETA
      BETA=10.
      ETA=1.
C
C  STARTING POINTS X1, X2, X3 ARE SET SUCH THAT Y1, Y2, Y3 ARE IN STRICT
C                           INCREASING ORDER
C
      XSTEP=STEP
      I=0
      X3=X
      Y3=F(X,I)
      M=1
      CALL D509HI(X2,Y2,X3,Y3,XSTEP,EPSI,M,MAXFUN,F,IS,A,B,Y4,Y5)
      IF(IS.EQ.1) GO TO 3
      Y=Y3
      IF(IS.EQ.4)  GO TO 8
      CALL D509HI(X1,Y1,X2,Y2,XSTEP,EPSI,M,MAXFUN,F,IS,A,B,Y4,Y5)
      IF(IS.EQ.1) GO TO 3
      X=X2
      Y=Y2
      IF(IS.EQ.4)  GO TO 8
C
C  IT COMPUTES THE MINIMUM OF THE PARABOLA
C
    5 CONTINUE
      IF(ABS((X1-X2)*(X1-X3)).EQ.0.) GO TO 4
      D=(Y1-Y2)/(X1-X2)-(Y1-Y3)/(X1-X3)
      IF(D*(X2-X3).LE.0.) GO TO 4
      X=0.5*(X2+X3-(Y2-Y3)/D)
      IF(ABS(X-X1).GT. STEP*BETA) GO TO 4
      M=M+1
      IF(M.GT.MAXFUN) GO TO 3
C
C COMPUTATION OF EITHER F OR FA OR FB.
C
      IF(X-A.GE.0.) GO TO 7
      Y4=F(A,I)
      Y=Y4+A-X
      GO TO 2
    7 IF(X-B.LE.0.) GO TO 1
      Y5=F(B,I)
      Y=Y5-B+X
      GO TO 2
    1 Y=F(X,I)
    2 CONTINUE
C
C END OF COMPUTATION OF Y
C
      IF(Y.GE.Y1) GO TO 4
      XSTEP=ABS(X-X1)
      IF( XSTEP   .LE.(ABS(X)+ETA)*EPSI) GO TO 9
    6 X3=X2
      Y3=Y2
      X2=X1
      Y2=Y1
      X1=X
      Y1=Y
      GO TO 5
C
C WHEN THE MINIMUM OF THE PARABOLA EITHER DOES NOT EXIST OR IS TOO FAR
C FROM THE LAST MINIMUM, ANOTHER X FOR WHICH F(X) IS LESS THAN F(X1) IS
C FOUND WITH THE DOWN-D509HI
C
    9 X1=X
      Y1=Y
    4 CALL D509HI(X,Y,X1,Y1,XSTEP,EPSI,M,MAXFUN,F,IS,A,B,Y4,Y5)
      IF(IS.EQ.4) GO TO 8
      IF(IS.EQ.1) GO TO 3
      GO TO 6
C
    3 CALL KERMTR('D509.1',LGFILE,MFLAG,RFLAG)
      IF(MFLAG) THEN
         IF(LGFILE .EQ. 0) THEN
            WRITE(*,100) EPSI, M
         ELSE
            WRITE(LGFILE,100) EPSI, M
         ENDIF
      ENDIF
      IF(.NOT. RFLAG) CALL ABEND
C
    8 R=ABS(XSTEP)
      RETURN
C
  100 FORMAT( 7X, 22HSUBROUTINE MINVAR ... ,
     +      / 9X, 15H ACCURACY EPS =, E20.10,
     +        31H CANNOT BE ATTAINED WITH MAXF =, I6,
     +        16H FUNCTION CALLS.)
      END
