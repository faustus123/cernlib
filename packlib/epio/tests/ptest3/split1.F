*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:45  mclareni
* Initial revision
*
*
#if !defined(CERNLIB_ND100B16)
#include "pilot.h"
      SUBROUTINE SPLIT1
C--- TESTS L.R.H. SPLITTING
#include "testc.inc"
#if defined(CERNLIB_READXT11)
      IF(.TRUE.)  GOTO 200
#endif
      NWSS=500
      ICALL=1
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL CTOIBM(IDAT,NWSS,2)
      IH(8)=ICALL
      CALL BUN32W(IDAT,1,IPAC,1,NWSS)
      CALL EPOUTL(11,1,NH,IH,2*NWSS,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(3)
      ICALL=2
      CALL VFILL(IDAT,NWSS,ICALL)
      IH(8)=ICALL
      CALL EPOUTL(11,2,NH,IH,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(4)
      ICALL=3
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL CTOIBM(IDAT,NWSS,2)
      IH(8)=ICALL
      CALL EPOUTL(11,3,NH,IH,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(5)
      NWSS=NWPR1
      ICALL=4
      CALL VFILL(IDAT,NWSS,ICALL)
      IH(8)=ICALL
      CALL EPOUTL(11,2,NH,IH,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(6)
      NH=3
      ICALL=5
      CALL EPOUTL(11,2,NH,IH,1,ICALL,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(7)
      NH=9
      ICALL=6
      NWSS=NWPR2
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL EPOUTS(11,2,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(8)
      ICALL=7
      NWSS=NWPR3
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL EPOUTS(11,2,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(9)
      ICALL=8
      NH=10
      NWSS=1000
      IH(8)=ICALL
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL EPOUTL(11,2,NH,IH,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(10)
      CALL EPCLOS(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(11)
      CALL EPSETW(11,3,32,IERR)
      IF(IERR.NE.0)  CALL ERREX(12)
      NH=9
      NWSS=NWPR4
      ICALL=9
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL CTOIBM(IDAT,NWSS,2)
      CALL EPOUTS(11,3,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(13)
      NWSS=100
      ICALL=10
      CALL VFILL(IDAT,NWSS,ICALL)
      CALL CTOIBM(IDAT,NWSS,2)
      CALL EPOUTS(11,3,NWSS,IDAT,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(13)
      CALL EPRWND(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(14)
  200 CONTINUE
      NWSS=500
      ICALL=1
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(151)
      IF(NWR.NE.9)  CALL ERREX(152)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(153)
      CALL EPREAD(11,11,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(154)
      NWR=NWR/2
      IF(NWR.NE.NWSS)  CALL ERREX(155)
      CALL BLO32W(IPAC,1,IDAT,1,NWR)
      CALL CFRIBM(IDAT,NWR,2)
      DO 11  JWORD=1,NWR
      IF(IDAT(JWORD).NE.ICALL)  CALL ERREX(156)
   11 CONTINUE
      ICALL=2
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(157)
      IF(NWR.NE.9)  CALL ERREX(158)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(159)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(160)
      IF(NWR.NE.NWSS)  CALL ERREX(161)
      DO 12  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(162)
   12 CONTINUE
      ICALL=3
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(163)
      IF(NWR.NE.9)  CALL ERREX(164)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(165)
      CALL EPREAD(11,13,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(166)
      IF(NWR.NE.NWSS)  CALL ERREX(167)
      CALL CFRIBM(IPAC,NWR,2)
      DO 13  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(168)
   13 CONTINUE
      ICALL=4
      NWSS=NWPR1
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(169)
      IF(NWR.NE.9)  CALL ERREX(170)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(171)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(172)
      IF(NWR.NE.NWSS)  CALL ERREX(173)
      DO 14  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(174)
   14 CONTINUE
      ICALL=5
      NWSS=1
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0) CALL ERREX(175)
      IF(NWR.NE.3)  CALL ERREX(176)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(177)
      IF(NWR.NE.1)  CALL ERREX(178)
      IF(IPAC(1).NE.ICALL)  CALL ERREX(179)
      ICALL=6
      NWSS=NWPR2
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(180)
      IF(NWR.NE.4)  CALL ERREX(181)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(182)
      IF(NWR.NE.NWSS)  CALL ERREX(183)
      DO 15  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(184)
   15 CONTINUE
      ICALL=7
      NWSS=NWPR3
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(185)
      IF(NWR.NE.4)  CALL ERREX(186)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0) CALL ERREX(187)
      IF(NWR.NE.NWSS)  CALL ERREX(188)
      DO 16  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(189)
   16 CONTINUE
      ICALL=8
      NWSS=1000
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(190)
      IF(NWR.NE.10)  CALL ERREX(191)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(192)
      CALL EPREAD(11,12,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(193)
      IF(NWR.NE.NWSS)  CALL ERREX(194)
      DO 17  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(195)
   17 CONTINUE
      ICALL=9
      NWSS=NWPR4
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(196)
      IF(NWR.NE.4)  CALL ERREX(197)
      CALL EPREAD(11,13,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(198)
      IF(NWR.NE.NWSS)  CALL ERREX(199)
      CALL CFRIBM(IPAC,NWR,2)
      DO 18  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(140)
   18 CONTINUE
      NWSS=100
      ICALL=10
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(141)
      IF(NWR.NE.4)  CALL ERREX(142)
      CALL EPREAD(11,13,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(143)
      IF(NWR.NE.NWSS)  CALL ERREX(144)
      CALL CFRIBM(IPAC,NWR,2)
      DO 19  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(145)
   19 CONTINUE
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.1)  CALL ERREX(146)
      CALL EPRWND(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(147)
      NWSS=500
      ICALL=1
      CALL EPREAD(11,1,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(254)
      NWR=NWR/2
      IF(NWR.NE.NWSS)  CALL ERREX(255)
      CALL BLO32W(IPAC,1,IDAT,1,NWR)
      CALL CFRIBM(IDAT,NWR,2)
      DO 21  JWORD=1,NWR
      IF(IDAT(JWORD).NE.ICALL)  CALL ERREX(256)
   21 CONTINUE
      ICALL=2
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(260)
      IF(NWR.NE.NWSS)  CALL ERREX(261)
      DO 22  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(262)
   22 CONTINUE
      ICALL=3
      CALL EPREAD(11,3,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(266)
      IF(NWR.NE.NWSS)  CALL ERREX(267)
      CALL CFRIBM(IPAC,NWR,2)
      DO 23  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(268)
   23 CONTINUE
      ICALL=4
      NWSS=NWPR1
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(272)
      IF(NWR.NE.NWSS)  CALL ERREX(273)
      DO 24  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(274)
   24 CONTINUE
      ICALL=5
      NWSS=1
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(277)
      IF(NWR.NE.1)  CALL ERREX(278)
      IF(IPAC(1).NE.ICALL)  CALL ERREX(279)
      ICALL=6
      NWSS=NWPR2
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(282)
      IF(NWR.NE.NWSS)  CALL ERREX(283)
      DO 25  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(284)
   25 CONTINUE
      ICALL=7
      NWSS=NWPR3
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0) CALL ERREX(287)
      IF(NWR.NE.NWSS)  CALL ERREX(288)
      DO 26  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(289)
   26 CONTINUE
      ICALL=8
      NWSS=1000
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(293)
      IF(NWR.NE.NWSS)  CALL ERREX(294)
      DO 27  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(295)
   27 CONTINUE
      ICALL=9
      NWSS=NWPR4
      CALL EPREAD(11,3,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(298)
      IF(NWR.NE.NWSS)  CALL ERREX(299)
      CALL CFRIBM(IPAC,NWR,2)
      DO 28  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(240)
   28 CONTINUE
      NWSS=100
      ICALL=10
      CALL EPREAD(11,3,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(243)
      IF(NWR.NE.NWSS)  CALL ERREX(244)
      CALL CFRIBM(IPAC,NWR,2)
      DO 29  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(245)
   29 CONTINUE
      CALL EPREAD(11,1,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.1)  CALL ERREX(246)
      CALL EPRWND(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(247)
      ICALL=1
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(351)
      IF(NWR.NE.9)  CALL ERREX(352)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(353)
      ICALL=2
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(357)
      IF(NWR.NE.9)  CALL ERREX(358)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(359)
      ICALL=3
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(363)
      IF(NWR.NE.9)  CALL ERREX(364)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(365)
      ICALL=4
      NWSS=NWPR1
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(369)
      IF(NWR.NE.9)  CALL ERREX(370)
      IF(IPAC(8).NE.ICALL)  CALL ERREX(371)
      ICALL=5
      NWSS=1
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(377)
      IF(NWR.NE.1)  CALL ERREX(378)
      IF(IPAC(1).NE.ICALL)  CALL ERREX(379)
      ICALL=6
      NWSS=NWPR2
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(380)
      IF(NWR.NE.4)  CALL ERREX(381)
      ICALL=7
      NWSS=NWPR3
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(385)
      IF(NWR.NE.4)  CALL ERREX(386)
      ICALL=8
      NWSS=1000
      CALL EPREAD(11,2,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(393)
      IF(NWR.NE.NWSS)  CALL ERREX(394)
      DO 37  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(395)
   37 CONTINUE
      ICALL=9
      NWSS=NWPR4
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(396)
      IF(NWR.NE.4)  CALL ERREX(397)
      NWSS=100
      ICALL=10
      CALL EPREAD(11,3,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(343)
      IF(NWR.NE.NWSS)  CALL ERREX(344)
      CALL CFRIBM(IPAC,NWR,2)
      DO 39  JWORD=1,NWR
      IF(IPAC(JWORD).NE.ICALL)  CALL ERREX(345)
   39 CONTINUE
      CALL EPREAD(11,20,NWR,IPAC,IBUF11,IERR)
      IF(IERR.NE.1)  CALL ERREX(346)
      CALL EPRWND(11,IBUF11,IERR)
      IF(IERR.NE.0)  CALL ERREX(347)
      RETURN
      END
#endif
