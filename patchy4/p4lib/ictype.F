CDECK  ID>, ICTYPE.
      FUNCTION ICTYPE (CHV)
C
C CERN PROGLIB# M432    ICTYPE          .VERSION KERNFOR  4.23  891215
C ORIG. 14/11/89, JZ
C
C-    Return the type of character CHV*1 :
C-    Nature : 0 unseen, 1 others, 2 numeric, 3 lower, 4 upper case

      CHARACTER    CHV*1

      IVAL = ICHAR(CHV)
      JX = 0
      IF (IVAL.LT.32)        GO TO 49
      IF (IVAL.GE.127)       GO TO 49
      JX = 1
      IF (IVAL.LT.48)        GO TO 49
      IF (IVAL.GE.123)       GO TO 49
      IF (IVAL.LE.57)  THEN
          JX = 2
          GO TO 49
        ENDIF
      IF (IVAL.LT.65)        GO TO 49
      IF (IVAL.LE.90)  THEN
          JX = 4
          GO TO 49
        ENDIF
      IF (IVAL.LT.97)        GO TO 49
      JX = 3
   49 ICTYPE = JX
      RETURN
      END
