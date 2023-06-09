*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:08  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
      REAL FUNCTION SININT(RX)
      REAL RX
      CHARACTER*6 ENAME
#if defined(CERNLIB_NUMHIPRE)
      REAL ZERO,ONE,TWO,EIGHT,PIH,X,Y,R,H,ALFA,D
      REAL DSININ,B0,B1,B2,PP,QQ,S(0:13),P(0:22),Q(0:19)
#endif
#if defined(CERNLIB_NUMLOPRE)
      DOUBLE PRECISION ZERO,ONE,TWO,EIGHT,PIH,X,Y,R,H,ALFA,D
      DOUBLE PRECISION DSININ,B0,B1,B2,PP,QQ,S(0:13),P(0:22),Q(0:19)
      DOUBLE PRECISION DX
#endif
 
      DATA ZERO /0.0D0/, ONE /1.0D0/, TWO /2.0D0/
      DATA EIGHT /8.0D0/, PIH /1.57079 63267 949D0/
 
      DATA S( 0) /+1.95222 09759 531D0/
      DATA S( 1) /-0.68840 42321 257D0/
      DATA S( 2) /+0.45518 55132 256D0/
      DATA S( 3) /-0.18045 71236 838D0/
      DATA S( 4) /+0.04104 22133 759D0/
      DATA S( 5) /-0.00595 86169 556D0/
      DATA S( 6) /+0.00060 01427 414D0/
      DATA S( 7) /-0.00004 44708 329D0/
      DATA S( 8) /+0.00000 25300 782D0/
      DATA S( 9) /-0.00000 01141 308D0/
      DATA S(10) /+0.00000 00041 858D0/
      DATA S(11) /-0.00000 00001 273D0/
      DATA S(12) /+0.00000 00000 033D0/
      DATA S(13) /-0.00000 00000 001D0/
 
      DATA P( 0) /+0.96074 78397 5204D0/
      DATA P( 1) /-0.03711 38962 1240D0/
      DATA P( 2) /+0.00194 14398 8899D0/
      DATA P( 3) /-0.00017 16598 8425D0/
      DATA P( 4) /+0.00002 11263 7753D0/
      DATA P( 5) /-0.00000 32716 3257D0/
      DATA P( 6) /+0.00000 06006 9212D0/
      DATA P( 7) /-0.00000 01258 6794D0/
      DATA P( 8) /+0.00000 00293 2563D0/
      DATA P( 9) /-0.00000 00074 5696D0/
      DATA P(10) /+0.00000 00020 4105D0/
      DATA P(11) /-0.00000 00005 9502D0/
      DATA P(12) /+0.00000 00001 8323D0/
      DATA P(13) /-0.00000 00000 5921D0/
      DATA P(14) /+0.00000 00000 1997D0/
      DATA P(15) /-0.00000 00000 0700D0/
      DATA P(16) /+0.00000 00000 0254D0/
      DATA P(17) /-0.00000 00000 0095D0/
      DATA P(18) /+0.00000 00000 0037D0/
      DATA P(19) /-0.00000 00000 0014D0/
      DATA P(20) /+0.00000 00000 0006D0/
      DATA P(21) /-0.00000 00000 0002D0/
      DATA P(22) /+0.00000 00000 0001D0/
 
      DATA Q( 0) /+0.98604 06569 6238D0/
      DATA Q( 1) /-0.01347 17382 0830D0/
      DATA Q( 2) /+0.00045 32928 4117D0/
      DATA Q( 3) /-0.00003 06728 8652D0/
      DATA Q( 4) /+0.00000 31319 9198D0/
      DATA Q( 5) /-0.00000 04211 0196D0/
      DATA Q( 6) /+0.00000 00690 7245D0/
      DATA Q( 7) /-0.00000 00131 8321D0/
      DATA Q( 8) /+0.00000 00028 3697D0/
      DATA Q( 9) /-0.00000 00006 7329D0/
      DATA Q(10) /+0.00000 00001 7340D0/
      DATA Q(11) /-0.00000 00000 4787D0/
      DATA Q(12) /+0.00000 00000 1403D0/
      DATA Q(13) /-0.00000 00000 0433D0/
      DATA Q(14) /+0.00000 00000 0140D0/
      DATA Q(15) /-0.00000 00000 0047D0/
      DATA Q(16) /+0.00000 00000 0017D0/
      DATA Q(17) /-0.00000 00000 0006D0/
      DATA Q(18) /+0.00000 00000 0002D0/
      DATA Q(19) /-0.00000 00000 0001D0/
#if defined(CERNLIB_NUMHIPRE)
      ROUND(D)  =  D
#endif
#if defined(CERNLIB_NUMLOPRE)
      ROUND(D)  =  SNGL(D+(D-DBLE(SNGL(D))))
#endif
 
      X=RX
      ENAME='SININT'
#if defined(CERNLIB_NUMLOPRE)
      GOTO 9
      ENTRY DSININ(DX)
      X=DX
      ENAME='DSININ'
#endif
 
    9 IF(ABS(X) .LE. EIGHT) THEN
       Y=X/EIGHT
       H=TWO*Y**2-ONE
       ALFA=-TWO*H
       B1=ZERO
       B2=ZERO
       DO 1 I = 13,0,-1
       B0=S(I)-ALFA*B1-B2
       B2=B1
    1  B1=B0
       B1=Y*(B0-B2)
      ELSE
       R=ONE/X
       Y=EIGHT*R
       H=TWO*Y**2-ONE
       ALFA=-TWO*H
       B1=ZERO
       B2=ZERO
       DO 2 I = 22,0,-1
       B0=P(I)-ALFA*B1-B2
       B2=B1
    2  B1=B0
       PP=B0-H*B2
       B1=ZERO
       B2=ZERO
       DO 3 I = 19,0,-1
       B0=Q(I)-ALFA*B1-B2
       B2=B1
    3  B1=B0
       QQ=B0-H*B2
       B1=SIGN(PIH,X)-R*(R*PP*SIN(X)+QQ*COS(X))
      ENDIF
      IF(ENAME .EQ. 'SININT')  THEN
         SININT=ROUND(B1)
      ELSE
         DSININ=B1
      ENDIF
      RETURN
      END
