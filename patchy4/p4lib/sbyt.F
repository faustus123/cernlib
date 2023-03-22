CDECK  ID>, SBYT.
      SUBROUTINE SBYT (IT,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    SBYT            .VERSION KERNFOR  4.23  891215
C MOD. true default 24/2/89, JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
C
      PARAMETER   (NBITPW=32)
      PARAMETER   (IALL11 = -1)

      MSK = ISHFT  (IALL11,-NBITPW+NZB)
      IZW = OR ( AND (IZW, NOT(ISHFT (MSK,IZP-1)))
     +,           ISHFT (AND(IT,MSK),IZP-1))
      RETURN
      END
