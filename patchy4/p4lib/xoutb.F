CDECK  ID>, XOUTB.
      SUBROUTINE XOUTB  (LUN,BV,NB)
C
C CERN PROGLIB# Z203    XOUTB           .VERSION KERNFOR  3.05  780715
C ORIG. 15/07/78 JZ
C
      DIMENSION    BV(NB)
C
      WRITE (LUN)  NB,BV
      RETURN
      END
