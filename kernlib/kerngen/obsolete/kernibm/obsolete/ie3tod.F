*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:23  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE IE3TOD (MS,MT,NDPN,JBAD)
C
C CERN PROGLIB# M220    IE3TOD          .VERSION KERNIBM  2.19  861204

C-    Convert double precision for input with copy
C-    from source in IEEE to target in native data format

      DIMENSION    MS(99), MT(99)

      DOUBLE PRECISION   THDB
      DIMENSION    THIS(2)
      EQUIVALENCE  (THDB,THIS)
      EQUIVALENCE  (ITHA,THA,THIS(1)), (ITHB,THB,THIS(2))

C     PARAMETER    (IBADMS =   Z 7FFFFFFF)
      PARAMETER    (IBADMS = 2147 483 647)
      PARAMETER    (JEXMIN = -259,  JEXMAX=251)
C     PARAMETER    (IOVPMS =   Z 7FFFFFF0)
      PARAMETER    (IOVPMS = 2147 483 632)
C     PARAMETER    (IOVNMS =   Z FFFFFFF0)
      PARAMETER    (IOVNMS = -16)
      PARAMETER    (IBADMD = IBADMS, IBADME = 0)
      PARAMETER    (IOVPMD = IOVPMS, IOVNMD = IOVNMS)

#include "q_jbit.inc"
* Ignoring t=pass

      JFAI = 0
      JMS  = 0
      JMT  = 0

      DO 449  JL=1,NDPN
      ITHA = MS(JMS+1)
      IF (ITHA.EQ.0)         GO TO 442
      ITHB  = MS(JMS+2)
      JSIGN = JBIT (ITHA,32)
      JEXP  = JBYT (ITHA,21,11)
      JMANT = JBYT (ITHA, 1,20)
      IF (JEXP.EQ.0)         GO TO 431
      IF (JEXP.EQ.2047)      GO TO 433

      JMANT = JMANT + 1 048 576
      JEXP  = JEXP  - 1023
      IF (JEXP.GT.JEXMAX)    GO TO 432
  424 IF (JEXP.LT.JEXMIN)    GO TO 441

      JMANS = JBYT (ITHB,17,16)
      JMANR = JBYT (ITHB, 1,16)

      JPRE  = ISIGN (48,JEXP)
      THDB  = (  DBLE(JMANT)
     +         + DBLE(FLOAT(JMANS)*2.**(-16))
     +         + DBLE(FLOAT(JMANR)*2.**(-32)) ) * 2.**(JPRE-20)
      THDB  = THDB * 2.**(JEXP-JPRE)
      IF (JSIGN.EQ.0)        GO TO 447
      THDB = -THDB
      GO TO 447

  431 IF (JMANT.EQ.0)        GO TO 441
      JEXP = -1022
      GO TO 424

  432 JMANT = 0
  433 IF (JMANT.EQ.0)    THEN
          IF (JSIGN.EQ.0)  THEN
              ITHB = IOVPMD
            ELSE
              ITHB = IOVNMD
            ENDIF
        ELSE
          ITHB = IBADMD
        ENDIF
      JFAI = JL
      ITHA = ITHB
      ITHB = IBADME
      GO TO 447

  441 ITHA = 0
  442 ITHB = 0
  447 MT(JMT+1) = ITHA
      MT(JMT+2) = ITHB
      JMT = JMT + 2
  449 JMS = JMS + 2

      JBAD = JFAI
      RETURN
      END
#ifdef CERNLIB_TCGEN_IE3TOD
#undef CERNLIB_TCGEN_IE3TOD
#endif
