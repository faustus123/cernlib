CDECK  ID>, IUFORW.
      FUNCTION IUFORW (IC,JL,JR)
C
C CERN PROGLIB# M410    IUFORW          .VERSION KERNFOR  4.23  891215
C ORIG. 27/05/67
C
      COMMON /SLATE/ ND,JEND, DUMMY(38)
      DIMENSION    IC(80)

      ND   = 0
      JEND = JL
      IVAL = 0
C
   12 IF (JEND.GT.JR)        GO TO 20
      K = AND (IC(JEND),255)
      IF (K.EQ.32)           GO TO 19
      IF (K.GE.58)           GO TO 20
      K = K - 48
      IF (K.LT.0)            GO TO 20
      IVAL = 10*IVAL + K
      ND   = ND + 1
   19 JEND = JEND + 1
      GO TO 12
C
   20 IUFORW = IVAL
      RETURN
      END
