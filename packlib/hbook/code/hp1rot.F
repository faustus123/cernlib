*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:44  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.22/11 23/08/94  14.17.45  by  Rene Brun
*-- Author :
      SUBROUTINE HP1ROT(C,E,F,IDME,XMIN,XMAX,X0,XSIZE,ISIGNE,IEXP1,
     +IEXP2,D,B)
*.==========>
*.            THIS ROUTINE PRINTS ONE LINE OF A 1-DIM HISTOGRAM
*.           IF THE USER HAS CALLED  HROTAT .
*.             PRINTS ALSO AXIS AND LABELS AT BEGINNING AND END
*..=========> ( R.Brun )
#include "hbook/hcbits.inc"
#include "hbook/hcprin.inc"
      COMMON/HFORM/IA(127),IDU
      DIMENSION A(127),B(1),D(1)
      EQUIVALENCE (A(1),IA(1))
      SAVE AL10,ICONT,MLOW,XLOW,MST,XINTEG,PAS
      SAVE CLAST,ELAST,FLAST,IOLD,ICHAN,ITERM,ICASE,NCOL,NLINE
      SAVE XMINI,XFIRST,IICHAN,IERMIN,IERMAX
      DATA AL10/2.30259/
*.___________________________________________
      IF(IDME.GE.0)GO TO 120
      IF(I17.EQ.0)MSTEP=1
      MST=MSTEP/2+1
      IF(MOD(MSTEP,2).EQ.0)MST=MST-1
      ITERM=0
*
*             ICONT=0 IF CONTOUR TO BE PRINTED
*
      I27=I27*(1-I34)
      I28=I28*(1-I34)
      ICONT=I34+I27+I28
      IF(ICONT.NE.0)ITERM=1
      IOLD=0
      ICASE=1
      IF(I17.NE.0)ICASE=ICASE+4
      IF(I27.NE.0)ICASE=ICASE+1
      IF(I28.NE.0)ICASE=ICASE+2
      IF(I34.NE.0)ICASE=ICASE+3
*
*       ICASE=1  CONTOUR HISTOGRAM          ICASE=5  CONTOUR HISTOGRAM B
*             2  BLACK                            6  BLACK WITH BIGBIN
*             3  STAR                             7  STAR
*             4  ERRORS                           8  ERRORS
*
      CLAST=C
      ELAST=E
      FLAST=F
*
*             PRINTING OF LONGITUDINAL AXIS AND SCALE
*
      NCOL=10*(3+I22+I31+I14-I29-I30-I15)
      NLINE=NCOLPA-NCOL
*
*             DEFINITION OF CHARACTERS  TO BE PRINTED (HBLACK,HCROSS)
*
*
    5 CONTINUE
      IF(IDME.EQ.1)CALL HFORMA(2)
      CALL VZERO(A,NCOLPA)
      MLOW=0
      XINTEG=0.
      IF(I26.NE.0)GO TO 20
*
*             DEFINITION SCALE LINEAR CASE
*
      IF(IDME.EQ.1)GO TO 7
      PAS=(XMAX-XMIN)/FLOAT(NLINE)
      XMINI=XMIN
      XMAXI=XMAX
      CALL HBIN(XMIN,XMAX,NLINE,XMIN,XMAX,NLINE,PAS)
      IF(I24.EQ.0)GO TO 7
      IF(PAS.GT.1.)GO TO 7
      PAS=1.
      XMIN=XMINI
      XMAX=XMAXI
      NLINE=XMAX-XMIN+1.
    7 N=0
      DO 10 I=1,NLINE,4
         N=N+1
   10 A(N)=XMIN+FLOAT(I-1)*PAS
      GO TO 40
*
*             DEFINITION SCALE LOGAR CASE
*
   20 IF(IDME.NE.1)THEN
         XFIRST=LOG10(XMIN)
         XLAST=LOG10(XMAX)
         PAS=LOG10(XMAX/XMIN)/FLOAT(NLINE)
         CALL HBIN(XFIRST,XLAST,NLINE,XFIRST,XLAST,NLINE,PAS)
         XMIN=EXP(AL10*XFIRST)
         XMAX=EXP(AL10*XLAST)
      ENDIF
      N=0
      DO 30 I=1,NLINE,4
         N=N+1
         XLAST=XFIRST+FLOAT(I-1)*PAS
         A(N)=EXP(AL10*XLAST)
   30 CONTINUE
*
   40 ICHAN=4*N
      N=NCOL-7
      IMF=MSTEP
      XMAMI=XMAX
      IF(ABS(XMIN).GT.ABS(XMAX))XMAMI=XMIN
      CALL HPCONT('        ',A,ICHAN,7,XMAMI,D,N,B,ISIGNE,
     +             IEXP1,IEXP2)
      MSTEP=IMF
      ICHAN=7
      IF(IDME.EQ.1)RETURN
*
*             PRINT AXIS WITH LABELS
*
   45 N=1
      CALL VBLANK(IA,NCOLPA)
*
*             LOW EDGE
*
      IF(I15.NE.0)GO TO 50
      CALL UCTOH('LOW EDGE',IA(N+1),1,8)
      N=N+10
*
*             INTEGRATION
*
   50 IF(I22.EQ.0)GO TO 60
      CALL UCTOH('INTEGRAT',IA(N+1),1,8)
      N=N+10
*
*             FUNCTION
*
   60 IF(I14.EQ.0)GO TO 70
      IF(I12.EQ.0)GO TO 70
      CALL UCTOH('FUNCTION',IA(N+1),1,8)
      N=N+10
*
*             ERRORS
*
   70 IF(I31.EQ.0)GO TO 80
      CALL UCTOH('ERRORS',IA(N+2),1,6)
      N=N+10
*
*             CONTENTS
*
   80 IF(I30.NE.0)GO TO 90
      CALL UCTOH('CONTENTS',IA(N+1),1,8)
      N=N+10
*
*             CHANNELS
*
   90 IF(I29.NE.0)GO TO 100
      CALL UCTOH('CHANNELS',IA(N+1),1,8)
      N=N+10
  100 CONTINUE
*
      ICHAN=N
*
      DO 110 I=1,NLINE
         N=N+1
  110 IA(N)=IDG(39)
*
      DO 115 I=1,NLINE,4
         IA(ICHAN)=IDG(19)
  115 ICHAN=ICHAN+4
*
      CALL HFORMA(1)
      IF(IDME.EQ.1)GO TO 5
*
*
*             LOW EDGE
*
  120 CONTINUE
      IF(ICONT.EQ.0)THEN
         IF(IDME.EQ.-1)RETURN
         GO TO 122
      ENDIF
*
*
  121 CLAST=C
      ELAST=E
      FLAST=F
  122 MLOW=MLOW+1
      CALL VBLANK(IA,NCOLPA)
      N=0
      IF(I15.NE.0)GO TO 150
      IF(MSTEP.EQ.1)GO TO 125
      IF(MOD(MLOW,MSTEP).NE.1)GO TO 140
  125 XLOW=X0
      IF(ITERM.EQ.1)XLOW=XLOW+XSIZE
      CALL HBCDF(XLOW,9,IA(N+1))
      IF(ABS(XLOW).LT.0.001)IA(N+5)=IDG(1)
  140 N=N+10
*
  150 ICHAN=MLOW-MST
      IF(MOD(ICHAN,MSTEP).NE.0)GO TO 250
*
*             INTEGRATION
*
      IF(I22.EQ.0)GO TO 170
      XINTEG=XINTEG+CLAST
      CALL HBCDF(XINTEG,9,IA(N+1))
      N=N+10
*
*             FUNCTION
*
  170 IF(I14.EQ.0)GO TO 190
      IF(I12.EQ.0)GO TO 190
      CALL HBCDF(FLAST,9,IA(N+1))
      N=N+10
*
*             ERRORS
*
  190 IF(I31.EQ.0)GO TO 210
      CALL HBCDF(ELAST,9,IA(N+1))
      N=N+10
*
*             CONTENTS
*
  210 IF(I30.NE.0)GO TO 230
      CALL HBCDF(CLAST,9,IA(N+1))
      N=N+10
*
*             CHANNELS
*
  230 IF(I29.NE.0)GO TO 260
      N=N+3
      ICHAN=(MLOW+MST-1)/MSTEP
      IF(MOD(MSTEP,2).EQ.0)ICHAN=(MLOW+MST)/MSTEP
      CALL HBCDI(ICHAN,4,IA(N+1))
      N=N+7
      GO TO 260
*
  250 N=N+10*(2+I14+I22+I31-I29-I30)
*
*             CALCULATION OF FUNCTION CHANNEL
*
  260 IFUNC=0
      IF(I12.EQ.0)GO TO 280
      IF(I26.NE.0)GO TO 270
      IFUNC=(FLAST-XMINI)/PAS
      GO TO 280
  270 IF(FLAST/XMIN.LT.1.)GO TO 280
      IFUNC=LOG10(FLAST/XMIN)/PAS
*
*             CALCULATION OF HISTOGRAM CHANNEL
*
  280 ICHAN=0
      XCHAN=0.
      INEW=0
      IF(IFUNC.LT.0)IFUNC=0
      IF(IFUNC.NE.0)IFUNC=IFUNC+2-I26
      IF(I26.EQ.0)THEN
         XCHAN=(CLAST-XMINI)/PAS
         ICHAN=XCHAN
         YCHAN=ICHAN
         IF(YCHAN.EQ.0.)YCHAN=1.
         IICHAN=10.*MOD(XCHAN,YCHAN)+1.0001
         IF(IICHAN.EQ.1)IICHAN=41
         INEW=(C-XMINI)/PAS
         IF(XMINI.NE.0..AND.INEW.EQ.0)INEW=INEW+1
         IF(XMINI.NE.0..AND.ICHAN.EQ.0)ICHAN=ICHAN+1
         IF(ICHAN.LT.0)ICHAN=0
         IF(INEW.LT.0)INEW=0
      ELSE
         IF(CLAST/XMIN.GE.1.)THEN
            XCHAN=LOG10(CLAST/XMIN)/PAS
            ICHAN=XCHAN
            YCHAN=ICHAN
            IF(YCHAN.EQ.0.)YCHAN=1.
            IICHAN=10.*MOD(XCHAN,YCHAN)+1.0001
            IF(IICHAN.EQ.1)IICHAN=41
            IF(CLAST.EQ.XMIN)ICHAN=1
            IF(CLAST.EQ.XMIN)IICHAN=34
            IF(C/XMIN.LT.1.)GO TO 300
            INEW=LOG10(C/XMIN)/PAS
         ENDIF
      ENDIF
*
  300 CONTINUE
      IF(XCHAN.GT.0.)ICHAN=ICHAN+2-I26
      IF(INEW.NE.0)INEW=INEW+2-I26
*
*             NUMBER OF CHANNELS PRINTED FOR ERROR
*
      IF(I34.EQ.0)GO TO 500
      IERMIN=0
      IERMAX=0
      IF(I26.NE.0)GO TO 350
      IF(ICHAN.EQ.0)GO TO 4500
      IERMIN=(CLAST-E-XMINI)/PAS+2.
      IERMAX=(CLAST+E-XMINI)/PAS+2.
      ICHAN=(IERMIN+IERMAX)/2
      GO TO 400
  350 XCHAN=(CLAST-E)/XMIN
      IF(XCHAN.LE.1.)GO TO 360
      IERMIN=LOG10(XCHAN)/PAS +1.
  360 YCHAN=(CLAST+E)/XMIN
      IF(YCHAN.LE.1.)GO TO 400
      IERMAX=LOG10(YCHAN)/PAS +1.
*
  400 IF(IERMIN.LE.0)IERMIN=1
      IF(IERMAX.LE.0)IERMAX=1
*
  500 IF(IFUNC.GT.NLINE)IFUNC=NLINE
      IF(ICHAN.GT.NLINE)ICHAN=NLINE
      IF(INEW.GT.NLINE)INEW=NLINE
      IF(IERMIN.GT.NLINE)IERMIN=NLINE
      IF(IERMAX.GT.NLINE)IERMAX=NLINE
      IF(ICHAN.LE.0)GO TO 8500
*
*
      GO TO(1000,2000,3000,4000,1000,6000,7000,8000),ICASE
*
*
*
 1000 I=2
      J=2
      K=2
      IF(IOLD.LT.ICHAN)I=1
      IF(IOLD.GT.ICHAN)I=3
      IF(INEW.LT.ICHAN)K=1
      IF(INEW.GT.ICHAN)K=3
      I=10*I+J+K-2
      K=MOD(I,10)
      J=MOD(I,100)-K
      J=J/10
      J=2*J-1
      IF(J.EQ.1)J=0
      IF(J.EQ.5)J=6
      I=J+K
      IF(I.EQ.1.AND.INEW.LT.IOLD)I=4
*
      GO TO (1121,1121,1121,1221,1222,1222,1221,1222,1222),I
*
 1121 I=IOLD
      IF(I.EQ.0)I=1
      CALL VFILL(IA(N+I),ICHAN-I+1,IDG(39))
      IA(N+ICHAN)=IDG(19)
      GO TO 8500
 1221 I=INEW
      IF(I.EQ.0)I=1
      CALL VFILL(IA(N+I),ICHAN-I+1,IDG(39))
 1222 IA(N+ICHAN)=IDG(19)
*
      GO TO 8500
*
*
 2000 CONTINUE
*                        BLACK HISTOGRAM
*
      CALL VFILL(IA(N+1),ICHAN,ICBLAC)
      IA(N+ICHAN)=IDG(IICHAN)
      GO TO 4500
*
*                       STAR HISTOGRAM
*
 3000 IA(N+ICHAN)=ICSTAR
      GO TO 4500
*
 4000 CONTINUE
*
*                        HISTOGRAM WITH ERRORS
*
      CALL VFILL(IA(N+IERMIN),IERMAX-IERMIN+1,IDG(39))
      IA(N+IERMIN)=IDG(19)
      IA(N+IERMAX)=IDG(19)
      IA(N+ICHAN)=IDG(25)
*
 4500 IF(I12.EQ.0)GO TO 9000
      IF(IFUNC.NE.0)IA(N+IFUNC)=ICFUNC
      GO TO 9000
*
*                   SAME FOR HISTOGRAM WITH BIGBIN
*
*
 6000 CONTINUE
      CALL VFILL(IA(N+1),ICHAN,IDG(34))
      IA(N+ICHAN)=IDG(IICHAN)
      GO TO 8500
*
 7000 CONTINUE
      IA(N+ICHAN)=ICSTAR
      GO TO 8500
*
 8000 IF(MOD(MLOW-MST,MSTEP).NE.0)GO TO 9000
      CALL VFILL(IA(N+IERMIN),IERMAX-IERMIN+1,IDG(39))
      IA(N+IERMIN)=IDG(19)
      IA(N+IERMAX)=IDG(19)
      IA(N+ICHAN)=IDG(25)
*
 8500 IF(I12.EQ.0)GO TO 9000
      IF(MOD(MLOW-MST,MSTEP).NE.0)GO TO 9000
      IF(IFUNC.NE.0)IA(N+IFUNC)=ICFUNC
*
 9000 CALL HFORMA(1)
*
      IOLD=ICHAN
      CLAST=C
      ELAST=E
      FLAST=F
      IF(IDME.NE.1)RETURN
      IF(ITERM.EQ.1)GO TO 45
      ITERM=1
      GO TO 121
*
      END
