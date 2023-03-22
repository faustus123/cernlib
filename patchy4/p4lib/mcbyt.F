CDECK  ID>, MCBYT.
      FUNCTION MCBYT (MZ,IZQ,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    MCBYT           .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
      PARAMETER   (NBITPW=32)
      PARAMETER   (IALL11 = -1)

      MCBYT = OR (
     +  AND(IZW, NOT(ISHFT (ISHFT (IALL11,-NBITPW+NZB), IZP-1)))
     +, ISHFT (ISHFT (ISHFT (MZ,-IZQ+1),NBITPW-NZB),-NBITPW-1+IZP+NZB))
      RETURN
      END
