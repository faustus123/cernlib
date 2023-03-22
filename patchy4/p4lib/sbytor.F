CDECK  ID>, SBYTOR.
      SUBROUTINE SBYTOR (IT,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    SBYTOR          .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
C
      PARAMETER   (NBITPW=32)
      PARAMETER   (IALL11 = -1)

      IZW = OR (IZW,
     +      ISHFT  (AND(IT,ISHFT (IALL11,-NBITPW+NZB)), IZP-1))
      RETURN
      END
