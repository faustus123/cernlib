CDECK  ID>, CLTOU.
      SUBROUTINE CLTOU (CHV)
C
C CERN PROGLIB# M432    CLTOU           .VERSION KERNFOR  4.21  890323
C ORIG. 11/02/86 A. PETRILLI
C NEW    9/02/89 JZ, for speed
C
C-    Convert character string CHV from lower to upper case.

      CHARACTER    CHV*(*)



      DO 19  JJ=1,LEN(CHV)
          J = ICHAR(CHV(JJ:JJ))
          IF (J.LT.97)       GO TO 19
          IF (J.GE.123)      GO TO 19
          CHV(JJ:JJ) = CHAR(J-32)
   19 CONTINUE
      END
