*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:14  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_gen/pilot.h"
      SUBROUTINE TAYCHD(A,B,CX,CH,I,IOPT,CZ)
C
C     CERN PROGRAM LIBRARY NO. E401
C
C     BASIC VERSION OF AUGUST 1970.
C
C     PURPOSE = CONVERSION OF TAYLOR SERIES TO CHEBYSHEV SERIES NORMA-
C               LIZED TO THE RANGE (-1,1).
C
C     PARAMETERS
C
C     INPUT
C
C     A       = LOWER BOUNDARY.
C     B       = UPPER BOUNDARY.
C     CX      = COEFFICIENTS OF ORIGINAL TAYLOR SERIE.
C     I       = NUMBER OF TERMS IN ORIGINAL SERIE.
C     IOPT    = OPTION PARAMETER.
C               IOP=-1 , THE ODD CASE.
C               IOP= 0 , THE GENERAL CASE.
C               IOP= 1 , THE EVEN CASE.
C
C     OUTPUT
C
C     CH      = CHEBYSHEV COEFFICIENTS IN NEW RANGE.
C
C     DUMMY
C
C     CZ      = ARRAY USED FOR INTERMEDIATE STORAGE.
C
      DOUBLE PRECISION CX(I),CZ(I),CH(I),A,B,TERM,E401BD,BP,AK,R,Q
     1,ALPHA,ZETA,     HELP1,HELP2,HELP3,HELP4
C
C  ***********      HELP1, HELP2,HELP3,HELP4 ARE TO HELP THE COMPILER
C
C     THE FIRST PART OF THE PROGRAM TRANSFORMS THE RANGE.DISTINCTION
C     IS MADE BETWEEN ORIGINAL RANGES SYMMETRIC ABOUT THE ORIGIN AND
C     THOSE NOT.
C
      IF((B+A).NE.0.D0) GO TO 1
      TERM=1.D0
         DO 2J=1,I
      CZ(J)=CX(J)*TERM
    2 TERM=TERM*B
      GOTO 3
    1 BP=B+A
         DO 7 J=1,I
      TERM=CX(J)*((B-A)**(J-1))/(2.D0**(J-1))
      CZ(J)=TERM
      IF(J.EQ.I)GOTO3
      JJ=J+1
         DO 4N=JJ,I
      AK=DBLE(N-1)
       R=DBLE(J-1)
      IF(CX(N-1).EQ.0.D0) GO TO 8
      TERM=TERM*BP*CX(N)*AK/(2.D0*CX(N-1)*(AK-R))
      GOTO 4
    8 TERM=CX(N)*((B-A)**(J-1))*(BP**(N-J))/(2.D0**(N-1))
      TERM=TERM*E401BD(AK,R)
    4 CZ(J)=CZ(J)+TERM
    7 CONTINUE
C
C     AT THIS POINT IN THE PROGRAM THE RANGE HAS BEEN TRANSFORMED AND
C     THE CALCULATION OF THE CHEBYSHEV COEFFICIENTS BEGINS
C
    3    DO 6 M=1,I
      IF((IOPT.EQ.0).OR.((IOPT.EQ.1).AND.((M/2)*2.NE.M)).OR.
     1  ((IOPT.EQ.-1).AND.((M/2)*2.EQ.M))) GO TO 13
      CH(M)=0.D0
      GOTO 6
   13 Q=DBLE(M-1)
      LIM=(I-M)/2+1
      TERM=CZ(M)/(2.D0**(M-2))
      CH(M)=TERM
      IF(LIM.EQ.1)GOTO  6
         DO 5 MM=2,LIM
      ALPHA=DBLE(MM-1)
      MUM=INT(Q+2.D0*ALPHA)+1
      IF(CZ(MUM-2).EQ.0.D0) GO TO 10
C
      HELP1=Q+ALPHA
      HELP2=HELP1+ALPHA
      HELP3=HELP2-1.D0
      HELP4=ALPHA*HELP1
      TERM=TERM*CZ(MUM)*HELP2*HELP3/4.D0*(CZ(MUM-2)*HELP4)
C
      GOTO5
   10 TERM=CZ(MUM)/(2.D0**(MUM-2))
      ZETA=Q+2.D0*ALPHA
      TERM=TERM*E401BD(ZETA,ALPHA)
    5 CH(M)=CH(M)+TERM
    6 CONTINUE
      RETURN
C
      END
