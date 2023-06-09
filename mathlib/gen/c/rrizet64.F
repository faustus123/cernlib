*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:01:59  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION DRIZET(X)
C
#include "gen/imp64.inc"
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='RRIZET/DRIZET')
#endif
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RRIZET(X)
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='RRIZET')
#endif
C
      DIMENSION P1(0:8),P2(0:8),P3(0:9),P4(0:8)
      DIMENSION Q1(0:8),Q2(0:8),Q3(0:9),Q4(0:8)

      PARAMETER (DELTA = 1D-13)
      PARAMETER (Z1 = 1, HF = Z1/2, TH = Z1/3)
      PARAMETER (PI = 3.14159 26535 89793 24D0)
      PARAMETER (PIH = PI/2, PI2 = 2*PI)

      DATA (P1(J),Q1(J),J=0,8)
     A/ 1.28716 81214 82446 39D+10, 2.57433 62429 64846 24D+10,
     1  1.37539 69320 37025 11D+10, 5.93816 56486 79590 16D+09,
     2  5.10665 59183 64406 10D+09, 9.00633 03732 61233 44D+08,
     3  8.56147 10024 33314 86D+08, 8.04253 66342 83289 89D+07,
     4  7.48361 81243 80232 98D+07, 5.60971 17595 41920 06D+06,
     5  4.86010 65854 61882 51D+06, 2.24743 12028 99137 52D+05,
     6  2.73957 49902 21406 09D+05, 7.57457 89093 41537 56D+03,
     7  4.63171 08431 83427 12D+03,-2.37383 57813 73772 62D+01,
     8  5.78758 10040 96660 66D+01, 1/

      DATA (P2(J),Q2(J),J=0,8)
     A/-6.88197 29321 63489 54D+06,-1.29725 62493 48915 54D+09,
     1  7.48218 91630 53159 72D+06,-9.48715 40757 99078 17D+08,
     2 -2.07584 50481 02110 14D+06,-1.05496 19347 40052 03D+08,
     3  3.55302 55709 62142 95D+05, 4.67774 48821 19930 48D+06,
     4 -4.06706 44955 18548 89D+04, 3.12936 04057 38135 34D+06,
     5  3.19804 86402 71469 11D+03, 4.59581 80383 93050 70D+05,
     6 -1.69820 93703 37228 53D+02, 3.88176 10961 03968 34D+04,
     7  5.61485 84239 42890 48D+00, 1.92561 54483 44914 23D+03,
     8 -8.93888 70592 61549 44D-02, 5.12578 12500 00000 00D+01/

      DATA (P3(J),Q3(J),J=0,9)
     A/ 1.66156 48051 57746 76D-11,-6.99562 63351 91916 55D-10,
     1 -4.68068 82766 06545 29D-09,-1.77757 96189 51492 57D-08,
     2  5.83519 72731 91470 47D-07,-9.82231 82573 40780 36D-07,
     3 -4.17644 01264 31456 02D-05,-2.84927 28275 90964 88D-05,
     4  1.85468 42284 35979 59D-03,-5.81727 90938 80480 94D-04,
     5 -5.11288 80022 04902 41D-02,-1.15848 74916 97665 86D-02,
     6  8.10450 23175 11003 53D-01,-1.28149 12405 19781 96D-01,
     7 -5.69951 94876 84789 23D+00,-1.11913 05734 90977 09D+00,
     8  0                         ,-7.67928 76160 46288 13D-01,
     9  0                         , 1/

      DATA (P4(J),Q4(J),J=0,8)
     A/ 1.03144 87718 88597 12D-15, 5.93959 41728 84190 50D-11,
     1 -5.12584 61396 46882 41D-13,-6.04755 35907 99918 06D-09,
     2  1.12948 79419 48735 48D-10, 3.64680 20866 83885 63D-07,
     3 -1.44234 66537 31309 52D-08,-1.29456 90556 80118 12D-05,
     4  1.16824 67698 44580 98D-06, 3.20189 49847 02292 50D-04,
     5 -6.14975 16799 03148 06D-05,-5.07801 55709 99940 77D-03,
     6  2.05594 67798 88303 28D-03, 5.49628 90788 15872 66D-02,
     7 -3.99339 42939 46688 69D-02,-3.24517 61115 59724 19D-01,
     8  3.45234 97673 61784 57D-01, 1/

      V=X
      F=1
      IF(X .NE. 0 .AND. X .LT. HF) THEN
       IX=X-DELTA
       IF(ABS(IX-X) .LE. DELTA) THEN
        IF(MOD(-IX,2) .EQ. 0) THEN
         H=0
         GO TO 9
        ELSE
         V=1-X
#if defined(CERNLIB_DOUBLE)
         F=2*(-Z1)**((1-IX)/2)*DGAMMA(V)/PI2**V
#endif
#if !defined(CERNLIB_DOUBLE)
         F=2*(-Z1)**((1-IX)/2)*GAMMA(V)/PI2**V
#endif
        ENDIF
       ELSE
        V=1-X
#if defined(CERNLIB_DOUBLE)
        F=2*SIN(PIH*X)*DGAMMA(V)/PI2**V
#endif
#if !defined(CERNLIB_DOUBLE)
        F=2*SIN(PIH*X)*GAMMA(V)/PI2**V
#endif
       ENDIF
      ENDIF
      IF(X .EQ. 0) THEN
       H=-3*HF
      ELSEIF(X .EQ. 1) THEN
       H=0
       CALL MTLPRT(NAME,'C315.1','ZETA(X) HAS POLE AT X = 1')
      ELSEIF(V .LE. 5) THEN
       AP=P1(8)
       AQ=Q1(8)
       DO 1 J = 7,0,-1
       AP=P1(J)+V*AP
    1  AQ=Q1(J)+V*AQ
       H=AP/(AQ*(V-1))-1
      ELSEIF(V .LE. 11) THEN
       T=TH*(V-8)
       ALFA=T+T
       B1=0
       B2=0
       DO 2 J = 8,0,-1
       B0=P2(J)+ALFA*B1-B2
       B2=B1
    2  B1=B0
       H=B0-T*B2
       B1=0
       B2=0
       DO 12 J = 8,0,-1
       B0=Q2(J)+ALFA*B1-B2
       B2=B1
   12  B1=B0
       H=H/(B0-T*B2)
      ELSEIF(V .LE. 25) THEN
       T=1/V
       AP=P3(7)
       DO 3 J = 6,0,-1
    3  AP=P3(J)+T*AP
       AQ=Q3(9)
       DO 13 J = 8,0,-1
   13  AQ=Q3(J)+T*AQ
       H=HF**(V-T*AP/AQ)
      ELSEIF(V .LE. 55) THEN
       T=1/V
       AP=P4(8)
       AQ=Q4(8)
       DO 4 J = 7,0,-1
       AP=P4(J)+T*AP
    4  AQ=Q4(J)+T*AQ
       H=HF**(V-T*AP/AQ)
      ELSEIF(V .LE. 90) THEN
       H=HF**V+TH**V
      ELSE
       H=HF**V
      ENDIF
      IF(X .LT. 1) H=F*(1+H)
#if defined(CERNLIB_DOUBLE)
    9 DRIZET=H
#endif
#if !defined(CERNLIB_DOUBLE)
    9 RRIZET=H
#endif
      RETURN
      END
