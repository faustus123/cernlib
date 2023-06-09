*
* $Id$
*
* $Log$
* Revision 1.2  1996/06/05 10:20:37  cernlib
* Move pilot.h before the ifdef for GKS
*
* Revision 1.1.1.1  1996/02/14 13:10:44  mclareni
* Higz
*
*
#include "higz/pilot.h"
#if defined(CERNLIB_GKS)
*CMZ :  1.22/09 23/03/95  15.21.39  by  O.Couet
*-- Author :
      SUBROUTINE IPL(N,X,Y)
*.===========>
*.
*.   This routine draws a polyline . The line type from 12 to 15 are independent
*. from the underlaying basic graphics package .
*.
*. _Input parameters:
*.
*.  INTEGER N : Number of points in the polyline .
*.  REAL X(N) : X coordinates .
*.  REAL Y(N) : Y coordinates .
*.
*..==========> (O.Couet)
#include "higz/hiatt.inc"
#include "higz/hiflag.inc"
      DIMENSION X(*),Y(*),XX(2),YY(2)
      DIMENSION XDOT(2),YDOT(2)
      LOGICAL ZSAV
      EQUIVALENCE (XOLD,XX(1)),(XNEW,XX(2))
      EQUIVALENCE (YOLD,YY(1)),(YNEW,YY(2))
      DATA XLSTEP,SMIN/0.2,0.0002/
*.______________________________________
*
      IF(N.LT.2)THEN
         CALL IGERR('Invalid number of points','IPL')
         RETURN
      ENDIF
*
      IF((ILN.GE.12).AND.(GFLAG.OR.PFLAG))THEN
         CALL IGSG(0)
         ZSAV=ZFLAG
         ZFLAG=.FALSE.
         GLFLAG=(ZFLAG.OR.PFLAG.OR.MFLAG)
         NTSAV=INTR
         RATIO1=(RVXMAX-RVXMIN)/(RWXMAX-RWXMIN)
         RATIO2=(RVYMAX-RVYMIN)/(RWYMAX-RWYMIN)
         RWX1=RWXMIN
         RWY1=RWYMIN
         RVX1=RVXMIN
         RVY1=RVYMIN
         RVX2=RVXMAX
         RVY2=RVYMAX
         XLSTEP=RBSL
         SMIN=0.001*XLSTEP
         CALL ISELNT(0)
         ILNS=ILN
         CALL ISLN(1)
         IF((XLSTEP.LE.0.).OR.(XLSTEP.GT.1))XLSTEP=0.01
*
*              Possibly dashed lines drawn
*
   10    MODE=1
         IDOT=0
         SRES=XLSTEP
*
         DO 90  I=2,N
            XOLD=RATIO1*(X(I-1)-RWX1)+RVX1
            YOLD=RATIO2*(Y(I-1)-RWY1)+RVY1
*
            DXSTEP=RATIO1*(X(I)-RWX1)+RVX1-XOLD
            DYSTEP=RATIO2*(Y(I)-RWY1)+RVY1-YOLD
            ADX=ABS(DXSTEP)
            ADY=ABS(DYSTEP)
            IF(ADX.LE.SMIN)THEN
               STEP=ADY
               DSX=0.
               DSY=SIGN(1.,DYSTEP)
               GOTO 20
            ENDIF
            IF(ADY.LE.SMIN)THEN
               STEP=ADX
               DSX=SIGN(1.,DXSTEP)
               DSY=0.
               GOTO 20
            ENDIF
            STEP=SQRT(DXSTEP*DXSTEP+DYSTEP*DYSTEP)
            DSX=DXSTEP/STEP
            DSY=DYSTEP/STEP
   20       IF(STEP.LE.0.)GO TO 90
            DRES=STEP
*
   30       ST=SRES
            IF(ST.GT.DRES)ST=DRES
            SRES=SRES-ST
            DRES=DRES-ST
            XNEW=XOLD+ST*DSX
            YNEW=YOLD+ST*DSY
*
            IF(ICLIP.EQ.1)THEN
               ICL=IGCLIP(XX,YY,RVX1,RVX2,RVY1,RVY2)
               IF(ICL.EQ.0)GOTO 80
            ENDIF
*
            GO TO (40 ,40 ,50 ,60 ,70 ),ILNS-10
*
*              Dashed line _ _ _ _ _ _ _
*
   40       CONTINUE
            IF(MODE.NE.0)THEN
#if defined(CERNLIB_PSCRIPT)
               IF(PFLAG)CALL IZPL(2,XX,YY)
#endif
               IF(GFLAG)CALL GPL(2,XX,YY)
            ENDIF
            GO TO 80
*
*              Dash-dot line _._._._._.
*
   50       IF(MODE.EQ.0)GO TO 70
#if defined(CERNLIB_PSCRIPT)
            IF(PFLAG)CALL IZPL(2,XX,YY)
#endif
            IF(GFLAG)CALL GPL(2,XX,YY)
            GO TO 80
*
*              Dot-blank  . . . . . . .
*
   60       IF(MODE.EQ.0)GO TO 80
*
*              Dotted line  ............
*
   70       IF (SRES.LT.0.5*XLSTEP) IDOT=IDOT+1
            IF (IDOT.NE.1) GOTO 80
            XDOT(1)=XNEW-(0.5*XLSTEP-SRES)*DSX
            YDOT(1)=YNEW-(0.5*XLSTEP-SRES)*DSY
            MTS=IMK
            MCOL=IPMCI
            RMSC=RMKSC
            CALL ISMKSC(RLWSC)
            CALL ISMK(1)
            CALL ISPMCI(IPLCI)
            IF(GFLAG)CALL IPM(1,XDOT,YDOT)
#if defined(CERNLIB_PSCRIPT)
            IF(PFLAG)CALL IZPM(1,XDOT,YDOT)
#endif
            CALL ISMKSC(RMSC)
            CALL ISMK(MTS)
            CALL ISPMCI(MCOL)
*
   80       XOLD=XNEW
            YOLD=YNEW
            IF(SRES.LE.SMIN)THEN
               IDOT=0
               SRES=XLSTEP
               MODE=MODE+1
               IF(MODE.EQ.2)MODE=0
            ENDIF
            IF(DRES.GT.SMIN)GO TO 30
   90    CONTINUE
         CALL ISELNT(NTSAV)
         CALL ISLN(ILNS)
         ZFLAG=ZSAV
         GLFLAG=(ZFLAG.OR.PFLAG.OR.MFLAG)
      ELSE
         IF(GFLAG)THEN
            CALL IGSG(0)
            CALL GPL(N,X,Y)
         ENDIF
      ENDIF
#if defined(CERNLIB_ZEBRA)||defined(CERNLIB_PSCRIPT)||defined(CERNLIB_MAIL)
      IF(GLFLAG)CALL IZPL(N,X,Y)
#endif
*
      END
#endif
