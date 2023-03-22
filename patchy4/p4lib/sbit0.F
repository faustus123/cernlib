CDECK  ID>, SBIT0.
      SUBROUTINE SBIT0 (IZW,IZP)
C
C CERN PROGLIB# M421    SBIT0           .VERSION KERNFOR  4.23  891215
C MOD. true default 24/2/89, JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine


      IZW = AND (IZW, NOT(ISHFT (1,IZP-1)) )
      RETURN
      END
