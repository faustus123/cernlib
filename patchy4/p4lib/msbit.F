CDECK  ID>, MSBIT.
      FUNCTION MSBIT (MZ,IZW,IZP)
C
C CERN PROGLIB# M421    MSBIT           .VERSION KERNFOR  4.23  891215
C ORIG. 13/03/89  JZ
C
C     This non-ANSI code is a default which may be slow, if so
C     it should be replaced by a machine-specific fast routine


      MSBIT = OR (AND (IZW, NOT(ISHFT (1,IZP-1)) )
     +,            ISHFT (AND(MZ,1),IZP-1) )
      RETURN
      END
