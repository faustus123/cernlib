CDECK  ID>, MBYTET.
      FUNCTION MBYTET (MZ,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    MBYTET          .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
      PARAMETER   (NBITPW=32)

      MBYTET = AND (IZW, NOT(ISHFT (ISHFT (NOT(MZ),NBITPW-NZB),
     +                                -NBITPW-1+IZP+NZB)) )
      RETURN
      END
