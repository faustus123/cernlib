*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:25  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE DSPVD2(F,KX,KY,MX,MY,TX,TY,C,NDIMC,NERR)

#include "gen/imp64.inc"
      DIMENSION TX(*),TY(*),C(NDIMC,*)
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
      PARAMETER (NAME = 'DSPVD2')

************************************************************************
*   NORBAS, VERSION: 15.03.1993
************************************************************************
*
*   DSPVD2 COMPUTES THE COEFFICIENTS
*          C(I,J)   (I=1,...,MX-KX-1 , J=1,...,MY-KY-1)
*   OF A TWO-DIMENSIONAL POLYNOMIAL VARIATION DIMINISHING SPLINE
*   APPROXIMATION S(X,Y) IN REPRESENTATION OF NORMALIZED TWO-DIMENSIONAL
*   B-SPLINES  B(I,J)(X,Y)
*
*     S(X,Y) = SUMME(I=1,...,MX-KX-1)
*              SUMME(J=1,...,MY-KY-1) C(I,J) * B(I,J)(X,Y) .
*
*   THE TWO-DIMENSIONAL B-SPLINES  B(I,J)(X,Y)  ARE THE PRODUCT OF TWO
*   ONE-DIMENSIONAL B-SPLINES  BX , BY
*          B(I,J)(X,Y) = BX(I,KX)(X) * BY(J,KY)(Y)
*   OF DEGREE  KX AND KY ( 0 <= KX , KY <= 25 )   WITH INDICES  I , J
*   ( 1 <= I <= MX-KX-1 , 1 <= J <= MY-KY-1 ) OVER TWO SETS OF SPLINE-
*   KNOTS
*       TX(1),TX(2),...,TX(MX)   ( MX >= 2*KX+2 )
*       TY(1),TY(2),...,TY(MY)   ( MY >= 2*KY+2 ) ,
*   RESPECTIVELY.
*   FOR FURTHER DETAILS TO THE ONE-DIMENSIONAL NORMALIZED B-SPLINES SEE
*   THE COMMENTS TO  DSPNB1.
*
*   PARAMETERS:
*
*   F     (DOUBLE PRECISION) USER SUPPLIED FUNCTION  Z=F(X,Y)  FOR WHICH
*         THE CORRESPONDING SPLINE APPROXIMATION HAS TO BE COMPUTED.
*   KX    (INTEGER) DEGREE OF ONE-DIMENSIONAL B-SPLINES IN X-DIRECTION
*         OVER THE SET OF KNOTS  TX.
*   KY    (INTEGER) DEGREE OF ONE-DIMENSIONAL B-SPLINES IN Y-DIRECTION
*         OVER THE SET OF KNOTS  TY.
*   MX    (INTEGER) NUMBER OF KNOTS FOR THE B-SPLINES IN X-DIRECTION.
*   MY    (INTEGER) NUMBER OF KNOTS FOR THE B-SPLINES IN Y-DIRECTION.
*   NDIMC (INTEGER) DECLARED FIRST DIMENSION OF ARRAY  C  IN THE
*         CALLING PROGRAM, WITH  NDIMC >= MX-KX-1 .
*   TX    (DOUBLE PRECISION) ARRAY OF AT LEAST ORDER MX CONTAINING THE
*         KNOTS IN X-DIRECTION, ON ENTRY.
*   TY    (DOUBLE PRECISION) ARRAY OF AT LEAST ORDER MY CONTAINING THE
*         KNOTS IN Y-DIRECTION, ON ENTRY.
*   C     (DOUBLE PRECISION) ARRAY OF ORDER (NDIMC, >= MY-KY-1).
*         ON EXIT  C(I,J)  CONTAINS THE (I,J)-TH COEFFICIENT OF THE
*         TWO-DIMENSIONAL B-SPLINE REPRESENTATION OF  S(X,Y) .
*   NERR  (INTEGER) ERROR INDICATOR. ON EXIT:
*         = 0: NO ERROR DETECTED
*         = 1: AT LEAST ONE OF THE CONSTANTS KX, KY, MX, MY IS ILLEGAL
*
*   ERROR MESSAGES:
*
*   IF ONE OF THE FOLLOWING RELATION IS SATISFIED BY THE CHOSEN INPUT-
*   PARAMETERS THE PROGRAM RETURNS, AND AN ERROR MESSAGE IS PRINTED:
*     KX < 1       OR    KX > 25      OR    KY < 1   OR   KY > 25   OR
*     MX < 2*KX+2  OR    MY < 2*KY+2  .
*
************************************************************************

      PARAMETER (Z1 = 1)

      NERR=1
      IF(KX .LT. 1 .OR. KX .GT. 25) THEN
       WRITE(ERRTXT,101) 'KX',KX
       CALL MTLPRT(NAME,'E210.1',ERRTXT)
      ELSEIF(KY .LT. 1 .OR. KY .GT. 25) THEN
       WRITE(ERRTXT,101) 'KY',KY
       CALL MTLPRT(NAME,'E210.1',ERRTXT)
      ELSEIF(MX .LT. 2*KX+2) THEN
       WRITE(ERRTXT,101) 'MX',MX
       CALL MTLPRT(NAME,'E210.2',ERRTXT)
      ELSEIF(MY .LT. 2*KY+2) THEN
       WRITE(ERRTXT,101) 'MY',MY
       CALL MTLPRT(NAME,'E210.2',ERRTXT)
      ELSE

      NERR=0
      RX=Z1/KX
      RY=Z1/KY
      DO 10 I = 1,MX-KX-1
      XI=RX*DVSUM(KX,TX(I+1),TX(I+2))
      DO 10 J = 1,MY-KY-1
   10 C(I,J)=F(XI,RY*DVSUM(KY,TY(J+1),TY(J+2)))
      ENDIF

      RETURN

  101 FORMAT(1X,A5,' =',I6,'   NOT IN RANGE')
      END



