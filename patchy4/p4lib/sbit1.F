CDECK  ID>, SBIT1.
      SUBROUTINE SBIT1 (IZW,IZP)
C
C CERN PROGLIB# M421    SBIT1           .VERSION KERNFOR  4.23  891215
C MOD. true default 24/2/89, JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine


      IZW = OR (IZW, ISHFT (1,IZP-1))
      RETURN
      END
