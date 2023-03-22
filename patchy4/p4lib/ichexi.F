CDECK  ID>, ICHEXI.
      FUNCTION ICHEXI (CHV,JLP,JRP)
C
C CERN PROGLIB# M432    ICHEXI          .VERSION KERNFOR  4.24  900424
C ORIG. 04/10/88, JZ
C
C-    Read hexadecimal integer from CHV(JL:JR)

      DIMENSION    JLP(9), JRP(9)

      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT, DUMMY(36)
      CHARACTER    CHV*(*)

      JJ = JLP(1)
      JR = JRP(1)

      IVAL = 0
      NDG  = 0
      NEG  = 0
      NGSLAT = 0

   12 IF (JJ.GT.JR)          GO TO 99
      IF (CHV(JJ:JJ).EQ.' ')  THEN
          JJ = JJ + 1
          GO TO 12
        ELSEIF (CHV(JJ:JJ).EQ.'+')  THEN
          JJ = JJ + 1
        ELSEIF (CHV(JJ:JJ).EQ.'-')  THEN
          NEG = 7
          JJ  = JJ + 1
        ENDIF

   21 IF (JJ.GT.JR)          GO TO 99
      K = ICHAR (CHV(JJ:JJ))
      K = K - 48
      IF (K.LT.0)            GO TO 98
      IF (K.GE.10)  THEN
          K = K - 7
          IF (K.LT.10)       GO TO 98
          IF (K.GE.16)  THEN
              K = K - 32
              IF (K.LT.10)   GO TO 98
              IF (K.GE.16)   GO TO 98
            ENDIF
        ENDIF
      IVAL = 16*IVAL + K
      NDG  = NDG + 1
      JJ   = JJ + 1
      GO TO 21

   98 IF (CHV(JJ:JJ).NE.' ')  NGSLAT = JJ
   99 NDSLAT = NDG
      NESLAT = JJ
      IF (NEG.NE.0)  THEN
          IF (IVAL.NE.0)  IVAL = -IVAL
        ENDIF
      ICHEXI = IVAL
      RETURN
      END
