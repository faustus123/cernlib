CDECK  ID>, JBIT.
      FUNCTION JBIT (IZW,IZP)
C
C CERN PROGLIB# M421    JBIT            .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine


      JBIT = AND (ISHFT (IZW,-IZP+1), 1)
      RETURN
      END
