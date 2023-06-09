*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:48  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
      SUBROUTINE CONPRT(F,IDM1,IDM2,M,N,NC,FMIN,FMAX)
C         THIS IS ONLY A DRIVING ROUTINE FOR CONT
C         TO MAKE THE CALLING SEQUENCE THE SAME AS THE OLD CONPRT
      EXTERNAL FREARG
      DIMENSION F(IDM1,IDM2)
      DIMENSION CONTUR(10)
      COMMON G(121,121)
      IF(NC.GT.10) GO TO 4
      GO TO 7
    4 WRITE(6,100)
  100 FORMAT(' SORRY - ONLY 10 CONTOURS MAY BE USED')
      RETURN
    7 IF(IDM1.GT.121.OR.IDM2.GT.121) GO TO 8
      GO TO 5
    8 WRITE(6,200)
  200 FORMAT(' INTERNAL RESTRICTIONS LIMIT DIMENSIONS TO 121,121')
      RETURN
    5 XBLCOR = 1.
      YBLCOR = 1.
      XURCOR=M
      YURCOR=N
      A=XBLCOR
      B=XURCOR
      C=YBLCOR
      D=YURCOR
      IA=1
      IB=M
      IC=1
      ID=N
      DO 6 I=1,M
      DO 6 J=1,N
    6 G(I,J)=F(I,J)
      CALL SETUP(A,IA,B,IB,C,IC,D,ID)
      CALL FRAME(XBLCOR,YBLCOR,XURCOR,YURCOR)
      IF(FMIN.EQ.FMAX.AND.FMAX.EQ.0.) GO TO 1
      RANGE=FMAX-FMIN
      STEP=RANGE/(NC-1)
      CINT=FMIN-STEP
      DO 2 I=1,NC
      CONTUR(I)=CINT+STEP
      CINT=CONTUR(I)
    2 CONTINUE
      GO TO 3
    1 CALL FINDEM(FREARG,NC,CONTUR)
    3 CALL CONT(FREARG,NC,CONTUR)
      RETURN
      END
