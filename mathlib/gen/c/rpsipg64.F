*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:02:00  mclareni
* Initial revision
*
*
#include "gen/pilot.h"
#if defined(CERNLIB_DOUBLE)
      FUNCTION DPSIPG(X,K)
C
#include "gen/imp64.inc"
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='RPSIPG/DPSIPG')
#endif
#if !defined(CERNLIB_DOUBLE)
      FUNCTION RPSIPG(X,K)
C
      CHARACTER*(*) NAME
      PARAMETER(NAME='RPSIPG')
#endif
C
      DIMENSION B(0:20,6),C(7,6),NB(6),P1(0:7),Q1(0:7),P2(0:4),Q2(0:4)
      DIMENSION SGN(6),SGF(0:6),SGH(6)

      PARAMETER (DELTA = 1D-13)
      PARAMETER (Z1 = 1, HF = Z1/2)
      PARAMETER (PI = 3.14159 26535 89793 24D0)
      PARAMETER (C1 = -PI**2, C2 = 2*PI**3, C3 = 2*PI**4)
      PARAMETER (C4 = -8*PI**5, C5 = -8*PI**6, C6 = 16*PI**7)

      CHARACTER*80 ERRTXT

      DATA NB /16,17,17,18,19,20/
      DATA SGN /-1,1,-1,1,-1,1/, SGF /1,-1,2,-6,24,-120,720/
      DATA SGH /-0.5D0,1,-3,12,-60,360/
      DATA X0 /1.46163 21449 68362 34D0/

      DATA (P1(J),Q1(J),J=0,7)
     A/ 1.35249 99667 72634 64D+4, 6.93891 11753 76344 44D-7,
     1  4.52856 01699 54728 97D+4, 1.97685 74263 04673 64D+4,
     2  4.51351 68469 73666 26D+4, 4.12551 60835 35383 23D+4,
     3  1.85290 11818 58261 02D+4, 2.93902 87119 93268 19D+4,
     4  3.32915 25149 40693 55D+3, 9.08196 66074 85517 03D+3,
     5  2.40680 32474 35720 18D+2, 1.24474 77785 67085 60D+3,
     6  5.15778 92000 13908 47D+0, 6.74291 29516 37859 38D+1,
     7  6.22835 06918 98474 58D-3, 1/

      DATA (P2(J),Q2(J),J=0,4)
     A/-2.72817 57513 15296 78D-15,7.77788 54852 29616 04D+0,
     1 -6.48157 12376 61965 10D-1, 5.46117 73810 32150 70D+1,
     2 -4.48616 54391 80193 58D+0, 8.92920 70048 18613 70D+1,
     3 -7.01677 22776 67586 64D+0, 3.22703 49379 11433 61D+1,
     7 -2.12940 44513 10105 17D+0, 1/

      DATA B( 0,1) / 0.33483 86979 10949 386D0/
      DATA B( 1,1) /-0.05518 74820 48730 095D0/
      DATA B( 2,1) / 0.00451 01907 36011 502D0/
      DATA B( 3,1) /-0.00036 57058 88303 721D0/
      DATA B( 4,1) / 0.00002 94346 27468 223D0/
      DATA B( 5,1) /-0.00000 23527 76815 151D0/
      DATA B( 6,1) / 0.00000 01868 53176 633D0/
      DATA B( 7,1) /-0.00000 00147 50720 184D0/
      DATA B( 8,1) / 0.00000 00011 57993 337D0/
      DATA B( 9,1) /-0.00000 00000 90439 179D0/
      DATA B(10,1) / 0.00000 00000 07029 627D0/
      DATA B(11,1) /-0.00000 00000 00543 989D0/
      DATA B(12,1) / 0.00000 00000 00041 925D0/
      DATA B(13,1) /-0.00000 00000 00003 219D0/
      DATA B(14,1) / 0.00000 00000 00000 246D0/
      DATA B(15,1) /-0.00000 00000 00000 019D0/
      DATA B(16,1) / 0.00000 00000 00000 001D0/

      DATA B( 0,2) /-0.11259 29353 45473 830D0/
      DATA B( 1,2) / 0.03655 70017 42820 941D0/
      DATA B( 2,2) /-0.00443 59424 96027 282D0/
      DATA B( 3,2) / 0.00047 54758 54728 926D0/
      DATA B( 4,2) /-0.00004 74718 36382 632D0/
      DATA B( 5,2) / 0.00000 45218 15237 353D0/
      DATA B( 6,2) /-0.00000 04163 00079 620D0/
      DATA B( 7,2) / 0.00000 00373 38998 165D0/
      DATA B( 8,2) /-0.00000 00032 79914 474D0/
      DATA B( 9,2) / 0.00000 00002 83211 377D0/
      DATA B(10,2) /-0.00000 00000 24104 028D0/
      DATA B(11,2) / 0.00000 00000 02026 297D0/
      DATA B(12,2) /-0.00000 00000 00168 524D0/
      DATA B(13,2) / 0.00000 00000 00013 885D0/
      DATA B(14,2) /-0.00000 00000 00001 135D0/
      DATA B(15,2) / 0.00000 00000 00000 092D0/
      DATA B(16,2) /-0.00000 00000 00000 007D0/
      DATA B(17,2) / 0.00000 00000 00000 001D0/

      DATA B( 0,3) / 0.07601 26046 55110 384D0/
      DATA B( 1,3) /-0.03625 71864 81828 739D0/
      DATA B( 2,3) / 0.00579 72023 38937 002D0/
      DATA B( 3,3) /-0.00076 96465 13610 481D0/
      DATA B( 4,3) / 0.00009 14920 82189 884D0/
      DATA B( 5,3) /-0.00001 00971 31488 364D0/
      DATA B( 6,3) / 0.00000 10557 77442 831D0/
      DATA B( 7,3) /-0.00000 01059 29577 481D0/
      DATA B( 8,3) / 0.00000 00102 85494 201D0/
      DATA B( 9,3) /-0.00000 00009 72314 310D0/
      DATA B(10,3) / 0.00000 00000 89884 635D0/
      DATA B(11,3) /-0.00000 00000 08153 171D0/
      DATA B(12,3) / 0.00000 00000 00727 572D0/
      DATA B(13,3) /-0.00000 00000 00064 010D0/
      DATA B(14,3) / 0.00000 00000 00005 562D0/
      DATA B(15,3) /-0.00000 00000 00000 478D0/
      DATA B(16,3) / 0.00000 00000 00000 041D0/
      DATA B(17,3) /-0.00000 00000 00000 003D0/

      DATA B( 0,4) /-0.07723 47240 56994 793D0/
      DATA B( 1,4) / 0.04786 71634 51599 467D0/
      DATA B( 2,4) /-0.00944 07021 86674 632D0/
      DATA B( 3,4) / 0.00148 95447 40103 448D0/
      DATA B( 4,4) /-0.00020 49440 23348 860D0/
      DATA B( 5,4) / 0.00002 56714 25065 297D0/
      DATA B( 6,4) /-0.00000 30013 93581 584D0/
      DATA B( 7,4) / 0.00000 03327 66437 356D0/
      DATA B( 8,4) /-0.00000 00353 65412 111D0/
      DATA B( 9,4) / 0.00000 00036 30622 927D0/
      DATA B(10,4) /-0.00000 00003 62096 951D0/
      DATA B(11,4) / 0.00000 00000 35237 509D0/
      DATA B(12,4) /-0.00000 00000 03357 440D0/
      DATA B(13,4) / 0.00000 00000 00314 068D0/
      DATA B(14,4) /-0.00000 00000 00028 908D0/
      DATA B(15,4) / 0.00000 00000 00002 623D0/
      DATA B(16,4) /-0.00000 00000 00000 235D0/
      DATA B(17,4) / 0.00000 00000 00000 021D0/
      DATA B(18,4) /-0.00000 00000 00000 002D0/

      DATA B( 0,5) / 0.10493 30344 59278 632D0/
      DATA B( 1,5) /-0.07887 79016 52793 557D0/
      DATA B( 2,5) / 0.01839 74151 12159 397D0/
      DATA B( 3,5) /-0.00335 22841 59396 504D0/
      DATA B( 4,5) / 0.00052 28782 30918 016D0/
      DATA B( 5,5) /-0.00007 31797 85814 740D0/
      DATA B( 6,5) / 0.00000 94497 29612 085D0/
      DATA B( 7,5) /-0.00000 11463 39856 723D0/
      DATA B( 8,5) / 0.00000 01322 69366 108D0/
      DATA B( 9,5) /-0.00000 00146 46669 180D0/
      DATA B(10,5) / 0.00000 00015 66940 742D0/
      DATA B(11,5) /-0.00000 00001 62791 157D0/
      DATA B(12,5) / 0.00000 00000 16490 345D0/
      DATA B(13,5) /-0.00000 00000 01634 028D0/
      DATA B(14,5) / 0.00000 00000 00158 807D0/
      DATA B(15,5) /-0.00000 00000 00015 171D0/
      DATA B(16,5) / 0.00000 00000 00001 427D0/
      DATA B(17,5) /-0.00000 00000 00000 132D0/
      DATA B(18,5) / 0.00000 00000 00000 012D0/
      DATA B(19,5) /-0.00000 00000 00000 001D0/

      DATA B( 0,6) /-0.17861 76221 42502 753D0/
      DATA B( 1,6) / 0.15577 64622 00520 579D0/
      DATA B( 2,6) /-0.04172 36376 73831 277D0/
      DATA B( 3,6) / 0.00859 71413 03245 400D0/
      DATA B( 4,6) /-0.00149 62277 61073 229D0/
      DATA B( 5,6) / 0.00023 10896 08557 137D0/
      DATA B( 6,6) /-0.00003 26320 44778 436D0/
      DATA B( 7,6) / 0.00000 42960 97867 090D0/
      DATA B( 8,6) /-0.00000 05345 28790 204D0/
      DATA B( 9,6) / 0.00000 00634 78151 644D0/
      DATA B(10,6) /-0.00000 00072 48699 714D0/
      DATA B(11,6) / 0.00000 00008 00521 979D0/
      DATA B(12,6) /-0.00000 00000 85888 793D0/
      DATA B(13,6) / 0.00000 00000 08985 442D0/
      DATA B(14,6) /-0.00000 00000 00919 356D0/
      DATA B(15,6) / 0.00000 00000 00092 225D0/
      DATA B(16,6) /-0.00000 00000 00009 090D0/
      DATA B(17,6) / 0.00000 00000 00000 882D0/
      DATA B(18,6) /-0.00000 00000 00000 084D0/
      DATA B(19,6) / 0.00000 00000 00000 008D0/
      DATA B(20,6) /-0.00000 00000 00000 001D0/

      DATA C(1,1) / 1.66666 66666 66666 67D-1/
      DATA C(2,1) /-3.33333 33333 33333 33D-2/
      DATA C(3,1) / 2.38095 23809 52380 95D-2/
      DATA C(4,1) /-3.33333 33333 33333 33D-2/
      DATA C(5,1) / 7.57575 75757 57575 76D-2/
      DATA C(6,1) /-2.53113 55311 35531 14D-1/
      DATA C(7,1) / 1.16666 66666 66666 67D 0/

      DATA C(1,2) / 5.00000 00000 00000 00D-1/
      DATA C(2,2) /-1.66666 66666 66666 67D-1/
      DATA C(3,2) / 1.66666 66666 66666 67D-1/
      DATA C(4,2) /-3.00000 00000 00000 00D-1/
      DATA C(5,2) / 8.33333 33333 33333 33D-1/
      DATA C(6,2) /-3.29047 61904 76190 48D 0/
      DATA C(7,2) / 1.75000 00000 00000 00D 1/

      DATA C(1,3) / 2.00000 00000 00000 00D 0/
      DATA C(2,3) /-1.00000 00000 00000 00D 0/
      DATA C(3,3) / 1.33333 33333 33333 33D 0/
      DATA C(4,3) /-3.00000 00000 00000 00D 0/
      DATA C(5,3) / 1.00000 00000 00000 00D+1/
      DATA C(6,3) /-4.60666 66666 66666 67D+1/
      DATA C(7,3) / 2.80000 00000 00000 00D+2/

      DATA (C(J,4),J=1,7) /10,-7,12,-33,130,-691,4760/
      DATA (C(J,5),J=1,7) /60,-56,120,-396,1820,-11056,85680/
      DATA (C(J,6),J=1,7) /420,-504,1320,-5148,27300,-187952,1627920/

      A=ABS(X)
      V=A
      IX=X-DELTA
      IF(K .LT. 0 .OR. K .GT. 6) THEN
       H=0
       WRITE(ERRTXT,101) K
       CALL MTLPRT(NAME,'C316.1',ERRTXT)
      ELSEIF(ABS(IX-X) .LE. DELTA) THEN
       H=0
       WRITE(ERRTXT,102) X
       CALL MTLPRT(NAME,'C316.2',ERRTXT)
      ELSEIF(K .EQ. 0) THEN
       IF(A .LE. 3) THEN
        S=0
        IF(A .LT. HF) THEN
         S=1/V
         V=V+1
        ENDIF
        AP=P1(7)
        AQ=Q1(7)
        DO 11 I = 6,0,-1
        AP=P1(I)+V*AP
   11   AQ=Q1(I)+V*AQ
        H=(V-X0)*AP/AQ-S
       ELSE
        R=1/V**2
        AP=P2(4)
        AQ=Q2(4)
        DO 12 I = 3,0,-1
        AP=P2(I)+R*AP
   12   AQ=Q2(I)+R*AQ
        H=LOG(V)-HF/V+AP/AQ
       ENDIF
       IF(X .LT. 0) H=H+1/A+PI/TAN(PI*A)
      ELSE
       K1=K+1
       IF(A .LE. 10) THEN
        IF(A .LT. 3) THEN
         S=-1/V**K1
         DO 1 J = 1,2-INT(A)
         V=V+1
    1    S=S-1/V**K1
         V=V+1
        ELSEIF(A .LE. 4) THEN
         S=0
        ELSE
         V=V-1
         S=1/V**K1
         DO 5 J = 1,INT(A)-4
         V=V-1
    5    S=S+1/V**K1
        ENDIF
        H=2*V-7
        ALFA=H+H
        B1=0
        B2=0
        DO 2 J = NB(K),0,-1
        B0=B(J,K)+ALFA*B1-B2
        B2=B1
    2   B1=B0
        H=B0-H*B2+SGF(K)*S
       ELSE
        S=0
        IF(A .LT. 15) THEN
         S=1/V**K1
         DO 3 J = 1,14-INT(A)
         V=V+1
    3    S=S+1/V**K1
         V=V+1
        ENDIF
        R=1/V**2
        P=R*C(7,K)
        DO 4 J = 6,1,-1
    4   P=R*(C(J,K)+P)
        H=((SGF(K-1)-SGN(K)*P)*V-SGH(K))/V**K1-SGF(K)*S
       ENDIF
       IF(X .LT. 0) THEN
        P=PI*A
        IF(K .EQ. 1) THEN
         V=C1/SIN(P)**2
        ELSEIF(K .EQ. 2) THEN
         V=C2*COS(P)/SIN(P)**3
        ELSEIF(K .EQ. 3) THEN
         S=SIN(P)**2
         V=C3*(2*S-3)/S**2
        ELSEIF(K .EQ. 4) THEN
         S=SIN(P)
         V=C4*COS(P)*(S**2-3)/S**5
        ELSEIF(K .EQ. 5) THEN
         S=SIN(P)**2
         V=C5*(15-15*S+2*S**2)/S**3
        ELSEIF(K .EQ. 6) THEN
         S=SIN(P)
         V=C6*COS(P)*(45-30*S**2+2*S**4)/S**7
        ENDIF
        H=SGN(K)*(H+V+SGF(K)/A**K1)
       ENDIF
      ENDIF
#if defined(CERNLIB_DOUBLE)
      DPSIPG=H
#endif
#if !defined(CERNLIB_DOUBLE)
      RPSIPG=H
#endif
      RETURN
  101 FORMAT('K = ',I5,'  (< 0  OR  > 6)')
  102 FORMAT('ARGUMENT EQUALS NON-POSITIVE INTEGER =',1P,E15.6)
      END
