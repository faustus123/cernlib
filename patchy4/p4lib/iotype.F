CDECK  ID>, IOTYPE.
      FUNCTION IOTYPE (MTYPP,MGATEP)

C-    CONVERT T=PARAMETER TO IO-PARAMETER
C-    1 ATT, 2 RES, 3 CAR, 4 DET, 5 EOF, 6 HOLD

      DIMENSION    MTYPP(9), MGATEP(9)



      MTYP = MTYPP(1)
      MGATE= 1023 - MGATEP(1)
      M    = JBYT (MTYP,1,5)                                            -MSK
C     M    = MTYP .AND. 31                                               MSKC
      CALL CBYT (MTYP,18,M,2,1)
      CALL CBYT (MTYP, 8,M,6,1)
      IOTYPE = JBYTET (MGATE,M,1,6)                                     -MSK
C     IOTYPE = M .AND. MGATE                                             MSKC
      RETURN
      END
