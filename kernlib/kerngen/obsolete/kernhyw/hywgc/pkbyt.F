*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:51  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
      SUBROUTINE PKBYT (MIV,MBV,JTHP,NINTP,NBITS)
C
C CERN PROGLIB# M422    PKBYT           .VERSION KERNHYW  1.06  870612
C ORIG. 12-june-87  JZ
C
      DIMENSION    MIV(99), MBV(99), JTHP(9), NINTP(9), NBITS(2)
 
#include "q_shift.inc"
 
      JTH  = JTHP(1)
      NINT = NINTP(1)
      IF (NINT.LE.0)         RETURN
 
      NZB  = NBITS(1)
      IF (NZB.GT.0)          GO TO 11
      NZB  = 1
      NPWD = 36
      MASK = 1
      GO TO 12
 
   11 NPWD = NBITS(2)
      MASK = ISHFTR (-1,36-NZB)
 
   12 JBV  = 1
      JIV  = 0
      IF (JTH.LT.2)          GO TO 21
      JBV  = (JTH-1)/NPWD + 1
      JPOS = JTH - (JBV-1)*NPWD - 1
      IF (JPOS.EQ.0)         GO TO 21
      NL   = JPOS*NZB
      MSKU = ISHFTL (MASK,NL)
      JIVE = NPWD - JPOS
      GO TO 22
 
C--                PACK EACH WORD
 
   21 NL   = 0
      MSKU = MASK
      JIVE = JIV + NPWD
   22 JIVE = MIN0 (NINT,JIVE)
      IZW  = MBV(JBV)
 
   24 JIV  = JIV + 1
      IZW  = OR (AND(NOT(MSKU),IZW),
     +           AND(MSKU,ISHFTL(MIV(JIV),NL)))
      IF (JIV.EQ.JIVE)       GO TO 27
      NL   = NL + NZB
      MSKU = ISHFTL (MSKU,NZB)
      GO TO 24
 
   27 MBV(JBV) = IZW
      IF (JIV.EQ.NINT)       RETURN
      JBV  = JBV + 1
      GO TO 21
      END
#ifdef CERNLIB_TCGEN_PKBYT
#undef CERNLIB_TCGEN_PKBYT
#endif
*      ==================================================
#include "qcardl.inc"
