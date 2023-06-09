*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:52  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION DFREQ(X)
C
#include "gen/imp64.inc"
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='DFREQ')
#endif
#if !defined(CERNLIB_DOUBLE)
      FUNCTION FREQ(X)
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='FREQ')
#endif
C
      DIMENSION P1(0:3),Q1(0:3),P2(0:7),Q2(0:7),P3(0:4),Q3(0:4)

      PARAMETER(Z1 = 1, HF = Z1/2)
      PARAMETER(C1 = 0.56418 95835 47756 29D0)
      PARAMETER(W2 = 1.41421 35623 73095 05D0, RW2 = 1/W2)

      DATA (P1(I),Q1(I),I=0,3)
     +/+2.42667 95523 05317 5D+2, +2.15058 87586 98612 0D+2,
     1 +2.19792 61618 29415 2D+1, +9.11649 05404 51490 1D+1,
     2 +6.99638 34886 19135 5D+0, +1.50827 97630 40778 7D+1,
     3 -3.56098 43701 81538 5D-2, +1/

      DATA (P2(I),Q2(I),I=0,7)
     +/+3.00459 26102 01616 01D+2, +3.00459 26095 69832 93D+2,
     1 +4.51918 95371 18729 42D+2, +7.90950 92532 78980 27D+2,
     2 +3.39320 81673 43436 87D+2, +9.31354 09485 06096 21D+2,
     3 +1.52989 28504 69404 04D+2, +6.38980 26446 56311 67D+2,
     4 +4.31622 27222 05673 53D+1, +2.77585 44474 39876 43D+2,
     5 +7.21175 82508 83093 66D+0, +7.70001 52935 22947 30D+1,
     6 +5.64195 51747 89739 71D-1, +1.27827 27319 62942 35D+1,
     7 -1.36864 85738 27167 07D-7, +1/

      DATA (P3(I),Q3(I),I=0,4)
     +/-2.99610 70770 35421 74D-3, +1.06209 23052 84679 18D-2,
     1 -4.94730 91062 32507 34D-2, +1.91308 92610 78298 41D-1,
     2 -2.26956 59353 96869 30D-1, +1.05167 51070 67932 07D+0,
     3 -2.78661 30860 96477 88D-1, +1.98733 20181 71352 56D+0,
     4 -2.23192 45973 41846 86D-2, +1/

      V=RW2*ABS(X)
      IF(V .LT. HF) THEN
       Y=V**2
       AP=P1(3)
       AQ=Q1(3)
       DO 1 I = 2,0,-1
       AP=P1(I)+Y*AP
    1  AQ=Q1(I)+Y*AQ
       H=V*AP/AQ
       HC=1-H
      ELSEIF(V .LT. 4) THEN
       AP=P2(7)
       AQ=Q2(7)
       DO 2 I = 6,0,-1
       AP=P2(I)+V*AP
    2  AQ=Q2(I)+V*AQ
       HC=EXP(-V**2)*AP/AQ
       H=1-HC
      ELSE
       Y=1/V**2
       AP=P3(4)
       AQ=Q3(4)
       DO 3 I = 3,0,-1
       AP=P3(I)+Y*AP
    3  AQ=Q3(I)+Y*AQ
       HC=EXP(-V**2)*(C1+Y*AP/AQ)/V
       H=1-HC
      ENDIF
      IF(X .GT. 0) THEN
#if defined(CERNLIB_DOUBLE)
       DFREQ=HF+HF*H
      ELSE
       DFREQ=HF*HC
#endif
#if !defined(CERNLIB_DOUBLE)
       FREQ=HF+HF*H
      ELSE
       FREQ=HF*HC
#endif
      ENDIF
      RETURN
      END
