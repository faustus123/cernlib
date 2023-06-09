*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:25  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      FUNCTION DSPPS2(KX,KY,MX,MY,NDERX,NDERY,X,Y,TX,TY,C,NDIMC,W,NERR)

#include "gen/imp64.inc"
      DIMENSION TX(*),TY(*),C(NDIMC,*),W(*),BX(27),BY(27)
      CHARACTER NAME*(*)
      CHARACTER*80 ERRTXT
      PARAMETER (NAME = 'DSPPS2')

************************************************************************
*   NORBAS, VERSION: 15.03.1993
************************************************************************
*
*   DSPPS2 COMPUTES FUNCTION VALUES, VALUES OF DERIVATIVES, AND THE
*   VALUE OF INTEGRAL, RESPECTIVELY, OF A TWO-DIMENSIONAL POLYNOMIAL
*   SPLINE  S(X,Y)  IN REPRESENTATION OF NORMALIZED TWO-DIMENSIONAL
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
*   C(I,J) (I=1,...,MX-KX-NDERX-1 , J=1,...,MY-KY-NDERY-1) MUST CONTAIN
*   THE (I,J)-TH C   COEFFICIENT OF THE POLYNOMIAL SPLINE  S(X,Y)  OR
*   OF ONE OF ITS PARTIAL DERIVATIVE, REPRESENTED BY NORMALIZED
*   TWO-DIMENSIONAL B-SPLINES OF DEGREE  (KX-NDERX) AND (KY-NDERY),
*   RESPECTIVELY.
*
*   FOR TRANSFORMATION THE COEFFICIENTS OF THE POLYNOMIAL SPLINE  S(X,Y)
*   TO THE CORRESPONDING COEFFICIENTS OF THE  NDERX-TH  AND  NDERY-TH
*   PARTIAL DERIVATIVE OF  S(X,Y)  THE ROUTINE  DSPCD2  MAY BE USED.
*
*   ESPECIALLY FOR COMPUTING THE COEFFICIENTS  C(I,J)  OF THE TWO-
*   DIMENSIONAL POLYNOMIAL VARIATION DIMINISHING SPLINE APPREOXIMATION
*   OF A USER SUPPLIED FUNCTION  Z = F(X,Y)  THE ROUTINE  DSPVD2  MAY BE
*   USED.
*
*   PARAMETERS:
*
*   KX    (INTEGER) DEGREE OF ONE-DIMENSIONAL B-SPLINES IN X-DIRECTION
*         OVER THE SET OF KNOTS  TX.
*   KY    (INTEGER) DEGREE OF ONE-DIMENSIONAL B-SPLINES IN Y-DIRECTION
*         OVER THE SET OF KNOTS  TY.
*   MX    (INTEGER) NUMBER OF KNOTS FOR THE B-SPLINES IN X-DIRECTION.
*   MY    (INTEGER) NUMBER OF KNOTS FOR THE B-SPLINES IN Y-DIRECTION.
*   NDERX (INTEGER) ON ENTRY, NDERX MUST CONTAIN AN INTEGER VALUE >= -1.
*         = -1: DSPPS2 COMPUTES THE INTEGRAL OF  S(TAU,Y)  OVER THE
*               RANGE  TAU <= X.
*         =  0: DSPPS2 COMPUTES THE FUNCTION VALUE  S(X,Y)  FOR
*               FOR THE SPECIFIED VALUES OF  X,Y.
*         >= 1: DSPNB2 COMPUTES THE VALUE OF THE NDERX-TH PARTIAL
*               DERIVATIVE OF  S(X,Y)  WITH RESPECT TO X
*               FOR THE SPECIFIED VALUES OF  X,Y.
*               (IF  NDERX > KX  ZERO RETURNS).
*   NDERY (INTEGER) ON ENTRY, NDERY MUST CONTAIN AN INTEGER VALUE >= -1.
*         THE MEANING OF  NDERY  IS THE SAME AS THAT OF THE PARAMETER
*         NDERX WITH RESPECT TO Y-DIRECTION INSTEAD OF X-DIRECTION.
*   NDIMC (INTEGER) DECLARED FIRST DIMENSION OF ARRAY  C  IN THE
*         CALLING PROGRAM, WITH  NDIMC >= MX-KX-NDERX-1 .
*   X     (DOUBLE PRECISION) ON ENTRY, X MUST CONTAIN THE VALUE OF THE
*         INDEPENDENT VARIABLE X OF  S(X,Y)
*   Y     (DOUBLE PRECISION) ON ENTRY, Y MUST CONTAIN THE VALUE OF THE
*         INDEPENDENT VARIABLE Y OF  S(X,Y)
*   TX    (DOUBLE PRECISION) ARRAY OF AT LEAST ORDER MX CONTAINING THE
*         KNOTS IN X-DIRECTION, ON ENTRY.
*   TY    (DOUBLE PRECISION) ARRAY OF AT LEAST ORDER MY CONTAINING THE
*         KNOTS IN Y-DIRECTION, ON ENTRY.
*   C     (DOUBLE PRECISION) ARRAY OF ORDER (NDIMC, >= MY-KY-NDERY-1),
*         CONTAINING THE COEFFICIENTS OF THE TWO-DIMENSIONAL B-SPLINE
*         REPRESENTATION OF  S(X,Y) , ON ENTRY.
*   W     (DOUBLE PRECISION) WORKING ARRAY OF AT LEAST ORDER  MY-KY-1.
*   NERR  (INTEGER) ERROR INDICATOR. ON EXIT:
*         = 0: NO ERROR DETECTED
*         = 1: AT LEAST ONE OF THE CONSTANTS KX , KY , MX , MY ,
*              NDERX , NDERY  IS ILLEGAL
*
*   USAGE:
*
*   THE FUNCTION-CALL
*         Z = DSPPS2(KX,KY,MX,MY,NDERX,NDERY,X,Y,TX,TY,C,NDIMC,W,NERR)
*   RETURNS
*       - THE VALUE OF THE INTEGRAL (NDERX =-1  .AND.  NDERY =-1) OR
*       - THE FUNCTION VALUE        (NDERX = 0  .AND.  NDERY = 0) OR
*       - THE VALUE OF THE NDERX-TH AND NDERY-TH PARTIAL DERIVATIVE
*         (NDERX >= 0  .AND.  NDERY >= 0  .AND.  NDERX + NDERY > 0)
*   OF THE POLYNOMIAL SPLINE  S(X,Y)  AT (X,Y).
*
*   ERROR MESSAGES:
*
*   IF ONE OF THE FOLLOWING RELATION IS SATISFIED BY THE CHOSEN INPUT-
*   PARAMETERS THE PROGRAM RETURNS, AND AN ERROR MESSAGE IS PRINTED:
*     KX < 0       OR    KX > 25      OR    KY < 0   OR   KY > 25  OR
*     MX < 2*KX+2  OR    MY < 2*KY+2  OR
*     NDERX < -1   OR    NDERY < -1   .
*
************************************************************************

      PARAMETER (Z0 = 0 , Z1 = 1)

      NERR=1
      IF(KX .LT. 0 .OR. KX .GT. 25) THEN
       WRITE(ERRTXT,101) 'KX',KX
       CALL MTLPRT(NAME,'E210.1',ERRTXT)
      ELSEIF(KY .LT. 0 .OR. KY .GT. 25) THEN
       WRITE(ERRTXT,101) 'KY',KY
       CALL MTLPRT(NAME,'E210.1',ERRTXT)
      ELSEIF(MX .LT. 2*KX+2) THEN
       WRITE(ERRTXT,101) 'MX',MX
       CALL MTLPRT(NAME,'E210.2',ERRTXT)
      ELSEIF(MY .LT. 2*KY+2) THEN
       WRITE(ERRTXT,101) 'MY',MY
       CALL MTLPRT(NAME,'E210.2',ERRTXT)
      ELSEIF(NDERX .LT. -1) THEN
       WRITE(ERRTXT,101) 'NDERX',NDERX
       CALL MTLPRT(NAME,'E210.5',ERRTXT)
      ELSEIF(NDERY .LT. -1) THEN
       WRITE(ERRTXT,101) 'NDERY',NDERY
       CALL MTLPRT(NAME,'E210.5',ERRTXT)
      ELSEIF(NDERX .EQ. -1  .AND.  NDERY .NE. -1  .OR.
     +       NDERX .NE. -1  .AND.  NDERY .EQ. -1      ) THEN
       WRITE(ERRTXT,102) 'NDERX',NDERX,'NDERY',NDERY
       CALL MTLPRT(NAME,'E210.6',ERRTXT)
      ELSE

       NERR=0
       IF(NDERX .EQ. -1  .AND.  NDERY .EQ. -1) THEN
        DO 60 JJ=1,MY-KY-1
        IF(X .GE. TX(MX-KX)) THEN
         R=Z0
         DO 10 I=1,MX-KX-1
   10    R=R+C(I,JJ)*(TX(I+KX+1)-TX(I))
         R=R/(KX+1)
        ELSE
         KK=LKKSPL(X,TX(KX+1),MX-2*KX-1)+KX
         R=Z0
         DO 20 I=1,KK-KX-2
   20    R=R+C(I,JJ)*(TX(I+KX+1)-TX(I))
         R=R/(KX+1)
         IF(KX .EQ. 0) THEN
          K1=MAX(1,KK-1)
          R=R+(X-TX(K1))*C(K1,JJ)
         ELSE
          DO 50 I=MAX(1,KK-KX-1),KK-1
          CALL DVSET(KX+1,Z0,BX(1),BX(2))
          BX(KK-I)=1/(TX(KK)-TX(KK-1))
          DO 30 L=1,KX
          DO 30 J=MAX(1,KK-I-L),MIN(KX+1-L,KK-I)
          DIF=TX(I+J+L)-TX(I+J-1)
          B0=Z0
          IF(DIF .NE. 0)
     +    B0=((X-TX(I+J-1))*BX(J)+(TX(I+J+L)-X)*BX(J+1))/DIF
   30     BX(J)=B0
          S=Z0
          DO 40 L=1,KK-I
   40     S=S+(X-TX(I+L-1))*BX(L)
          S=S*(TX(I+KX+1)-TX(I))/(KX+1)
   50     R=R+C(I,JJ)*S
         ENDIF
        ENDIF
   60   W(JJ)=R
        IF(Y .GE. TY(MY-KY)) THEN
         R=Z0
         DO 70 I=1,MY-KY-1
   70    R=R+W(I)*(TY(I+KY+1)-TY(I))
         R=R/(KY+1)
        ELSE
         KK=LKKSPL(Y,TY(KY+1),MY-2*KY-1)+KY
         R=Z0
         DO 80 I=1,KK-KY-2
   80    R=R+W(I)*(TY(I+KY+1)-TY(I))
         R=R/(KY+1)
         IF(KY .EQ. 0) THEN
          K1=MAX(1,KK-1)
          R=R+(Y-TY(K1))*W(K1)
         ELSE
          DO 110 I=MAX(1,KK-KY-1),KK-1
          CALL DVSET(KY+1,Z0,BY(1),BY(2))
          BY(KK-I)=1/(TY(KK)-TY(KK-1))
          DO 90 L=1,KY
          DO 90 J=MAX(1,KK-I-L),MIN(KY+1-L,KK-I)
          DIF=TY(I+J+L)-TY(I+J-1)
          B0=Z0
          IF(DIF .NE. 0)
     +    B0=((Y-TY(I+J-1))*BY(J)+(TY(I+J+L)-Y)*BY(J+1))/DIF
   90     BY(J)=B0
          S=Z0
          DO 100 L=1,KK-I
  100     S=S+(Y-TY(I+L-1))*BY(L)
          S=S*(TY(I+KY+1)-TY(I))/(KY+1)
  110     R=R+W(I)*S
         ENDIF
        ENDIF
        DSPPS2=R
        RETURN
       ENDIF

       DSPPS2=Z0
       IF(X  .LT. TX(KX+1)  .OR.  X  .GT. TX(MX-KX) .OR.
     +    Y  .LT. TY(KY+1)  .OR.  Y  .GT. TY(MY-KY) .OR.
     +    KX .LT. NDERX     .OR.  KY .LT. NDERY        ) RETURN

       KKX=LKKSPL(X,TX(KX+1),MX-2*KX-1)+KX
       KKY=LKKSPL(Y,TY(KY+1),MY-2*KY-1)+KY
       E1=X-TX(KKX-1)
       BX(1)=Z1
       DO 120 J=2,KX-NDERX+1
  120  BX(J)=E1*BX(J-1)/(TX(KKX-2+J)-TX(KKX-1))
       E2=TX(KKX)-X
       DO 130 J=1,KX-NDERX
       E3=X-TX(KKX-1-J)
       BX(1)=E2*BX(1)/(TX(KKX)-TX(KKX-J))
       DO 130 L=2,KX-NDERX+1-J
  130  BX(L)=E3*BX(L-1)/(TX(KKX-2+L)-TX(KKX-1-J))+
     +       (TX(KKX-1+L)-X)*BX(L)/(TX(KKX-1+L)-TX(KKX-J))
       E1=Y-TY(KKY-1)
       BY(1)=Z1
       DO 140 J=2,KY-NDERY+1
  140  BY(J)=E1*BY(J-1)/(TY(KKY-2+J)-TY(KKY-1))
       E2=TY(KKY)-Y
       DO 150 J=1,KY-NDERY
       E3=Y-TY(KKY-1-J)
       BY(1)=E2*BY(1)/(TY(KKY)-TY(KKY-J))
       DO 150 L=2,KY-NDERY+1-J
  150  BY(L)=E3*BY(L-1)/(TY(KKY-2+L)-TY(KKY-1-J))+
     +       (TY(KKY-1+L)-Y)*BY(L)/(TY(KKY-1+L)-TY(KKY-J))
       R=Z0
       DO 160 I=1,KX-NDERX+1
       DO 160 J=1,KY-NDERY+1
  160  R=R+C(KKX-2-KX+I,KKY-2-KY+J)*BX(I)*BY(J)
       DSPPS2=R
      ENDIF
      RETURN

  101 FORMAT(1X,A5,' =',I6,'   NOT IN RANGE')
  102 FORMAT(1X,A5,' =',I6,A7,' =',I6,'   INCONSISTENT')
      END



