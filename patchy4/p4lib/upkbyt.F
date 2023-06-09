CDECK  ID>, UPKBYT.
      SUBROUTINE UPKBYT (MBV,JTHP,MIV,NINTP,NBITS)
C
C CERN PROGLIB# M422    UPKBYT          .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
C
      DIMENSION    MIV(99), MBV(99), JTHP(9), NINTP(9), NBITS(2)

      PARAMETER   (NBITPW=32)
      PARAMETER   (IALL11 = -1)

      JTH  = JTHP(1)
      NINT = NINTP(1)
      IF (NINT.LE.0)         RETURN

      NZB  = NBITS(1)
      IF (NZB.GT.0)          GO TO 11
      NZB  = 1
      NPWD = NBITPW
      MSKA = 1
      GO TO 12

   11 NPWD = NBITS(2)
      MSKA = ISHFT  (IALL11,-NBITPW+NZB)

   12 JBV  = 1
      JIV  = 0
      IF (JTH.LT.2)          GO TO 21
      JBV  = (JTH-1)/NPWD + 1
      JPOS = JTH - (JBV-1)*NPWD - 1
      IF (JPOS.EQ.0)         GO TO 21
      NR   = JPOS*NZB
      JIVE = NPWD - JPOS
      IZW  = ISHFT  (MBV(JBV),-NR)
      GO TO 22

C--                UNPACK EACH WORD

   21 JIVE = JIV + NPWD
      IZW  = MBV(JBV)
   22 JIVE = MIN (NINT,JIVE)

   24 JIV  = JIV + 1
      MIV(JIV) = AND (MSKA,IZW)
      IF (JIV.EQ.JIVE)       GO TO 27
      IZW  = ISHFT  (IZW,-NZB)
      GO TO 24

   27 IF (JIV.EQ.NINT)       RETURN
      JBV  = JBV + 1
      GO TO 21
      END
