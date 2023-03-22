CDECK  ID>, TMPRO.
      SUBROUTINE TMPRO (TEXT)
C
C CERN PROGLIB#         TMPRO           .VERSION KERNFOR  4.29  910718
C ORIG. 30/05/91, JZ
C
C     Fortran interface : print a prompt string
C
      CHARACTER    TEXT*(*)

      LGTEXT = LEN (TEXT)
      CALL TMPROI (TEXT,LGTEXT)
      RETURN
      END
