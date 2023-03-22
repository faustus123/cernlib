CDECK  ID>, GETWDF.
      SUBROUTINE GETWDF (TEXT)
C
C CERN PROGLIB# Z265    GETWDF          .VERSION KERNFOR  4.26  910313
C ORIG. 22/02/91, JZ
C Fortran interface routine to getwd
C
      COMMON /SLATE/ISL(40)
      CHARACTER    TEXT*(*)

      NTX = LEN(TEXT)
      CALL GETWDI (TEXT, NTX)
      ISL(1) = NTX
      RETURN
      END
