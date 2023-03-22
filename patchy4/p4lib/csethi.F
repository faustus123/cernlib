CDECK  ID>, CSETHI.
      SUBROUTINE CSETHI (INTP, CHV,JLP,JRP)
C
C CERN PROGLIB# M432    CSETHI          .VERSION KERNFOR  4.31  911111
C ORIG. 17/10/89, JZ
C
C-    Set hexadecimal integer into CHV(JL:JR) right-justified

      DIMENSION    INTP(9), JLP(9), JRP(9)

      COMMON /SLATE/ NDSLAT,NESLAT,NFSLAT,NGSLAT, DUMMY(36)
      CHARACTER    CHV*(*)


      JL  = JLP(1)
      JJ  = JRP(1)

      IVAL   = INTP(1)
      NDG    = 0
      NGSLAT = 0

   12 IF (JJ.LT.JL)          GO TO 97
      K    = AND (IVAL,15)
      IVAL = ISHFT (IVAL,-4)
      IF (K.LT.10)  THEN
          CHV(JJ:JJ) = CHAR(K+48)
        ELSE
          CHV(JJ:JJ) = CHAR(K+55)
        ENDIF

      JJ  = JJ  - 1
      NDG = NDG + 1
      IF (IVAL.NE.0)         GO TO 12
      GO TO 98

   97 NGSLAT = JL
   98 NFSLAT = JJ
      NESLAT = JJ
      NDSLAT = NDG
      RETURN
      END
