*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:05  mclareni
* Initial revision
*
*
#include "kernapo/pilot.h"
#if !defined(CERNLIB_QMAPO10)
      SUBROUTINE UCTOH1 (MS,MT,NCHP)
C
C CERN PROGLIB# M409    UCTOH1          .VERSION KERNAPO  1.11  880222
C ORIG. 10/02/88  JZ
C
      DIMENSION    MS(99), MT(99), NCHP(9)
      PARAMETER    (IBLAN1 = 16#00202020)
      PARAMETER    (MASK1  = 16#FF000000)


      NCH = NCHP(1)
      IF   (NCH)             91, 29, 11
   11 NWS    = RSHFT (NCH,2)
      NTRAIL = AND (NCH,3)
      JT     = 0
      IF (NWS.EQ.0)          GO TO 26

C--                Unpack the initial complete words

      DO 24 JS=1,NWS
      MWD      = MS(JS)
      MT(JT+1) = OR (IBLAN1,AND(MASK1,MWD))
      MT(JT+2) = OR (IBLAN1,AND(MASK1,LSHFT(MWD, 8)))
      MT(JT+3) = OR (IBLAN1,AND(MASK1,LSHFT(MWD,16)))
      MT(JT+4) = OR (IBLAN1,          LSHFT(MWD,24) )
   24 JT = JT + 4

      IF (NTRAIL.EQ.0)       RETURN

C--                Unpack the trailing word

   26 MWD = MS(NWS+1)

      DO 28 JS=1,NTRAIL
      MT(JT+1) = OR (IBLAN1,AND(MASK1,MWD))
      MWD = LSHFT (MWD,8)
   28 JT = JT + 1
   29 RETURN

   91 CALL ABEND
      END
#ifdef CERNLIB_TCGEN_UCTOH1
#undef CERNLIB_TCGEN_UCTOH1
#endif
#endif
