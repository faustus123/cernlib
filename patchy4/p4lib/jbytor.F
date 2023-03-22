CDECK  ID>, JBYTOR.
      FUNCTION JBYTOR (MZ,IZW,IZP,NZB)
C
C CERN PROGLIB# M421    JBYTOR          .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine
      PARAMETER   (NBITPW=32)

      JBYTOR = OR (MZ, ISHFT (ISHFT (IZW,NBITPW+1-IZP-NZB),
     +                         -NBITPW+NZB) )
      RETURN
      END
