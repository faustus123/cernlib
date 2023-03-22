CDECK  ID>, MXSET.
      SUBROUTINE MXSET (MTR,MDEC)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    MV(4), MPAK5(2), MTR(9), MDEC(9)
      EQUIVALENCE (MX,IQUEST(11))


      DATA  MPAK5  /5,6/


      MXT = MTR(1)
      MXD = MDEC(1)
      CALL UPKBYT (MXD,1,MV(1),3,MPAK5(1))
      MV(4) = JBYT (MXD,15,4)
      IF (IQUEST(9) .NE.0)   GO TO 21
      IF (IQUEST(20).EQ.0)   GO TO 12

C--                ACTIVATION

      CALL SBYTOR (MX,MV(3),1,5)                                        -MSK
   12 CALL SBYTOR (MX,MV(4),1,5)                                        -MSK
      IF (IQUEST(15).NE.0)   GO TO 13                                   -MSK
      CALL SBYTOR (MX,MV(1),1,5)                                        -MSK
   13 IF (MXT.EQ.0)          GO TO 17                                   -MSK
      IF (MX.LT.16)          GO TO 17                                   -MSK
      CALL SBYTOR (MXT,MV(1),1,5)                                       -MSK
      CALL SBYTOR (MXT,MV(3),1,5)                                       -MSK
      CALL SBYTOR (MXT,MV(4),1,5)                                       -MSK
   17 MV(1) = JBYTET (MV(1),MV(2),1,5)                                  -MSK
      MV(3) = JBYTET (MV(3),MV(2),1,5)                                  -MSK
      MV(4) = JBYTET (MV(4),MV(2),1,5)                                  -MSK

C     MV(3) = MV(3) .OR. MX                                              MSKC
C  12 MV(4) = MV(4) .OR. MX                                              MSKC
C     IF (IQUEST(15).NE.0)   GO TO 13                                    MSKC
C     MV(1) = MV(1) .OR. MX                                              MSKC
C  13 IF (MXT.EQ.0)          GO TO 17                                    MSKC
C     IF (MX.LT.16)          GO TO 17                                    MSKC
C     MV(1) = MV(1) .OR. MXT                                             MSKC
C     MV(3) = MV(3) .OR. MXT                                             MSKC
C     MV(4) = MV(4) .OR. MXT                                             MSKC
C  17 MV(1) = MV(1) .AND. MV(2)                                          MSKC
C     MV(3) = MV(3) .AND. MV(2)                                          MSKC
C     MV(4) = MV(4) .AND. MV(2)                                          MSKC

      CALL PKBYT (MV(1),MXT,1,3,MPAK5(1))
      CALL SBYT  (MV(4),MXT,15,4)
      CALL SBYT  (MXT,MDEC(1),1,18)
      RETURN

C--                INHIBITION

   21 MXT   = 127 - MX
C     MV(2) = MV(2) .AND. MXT                                            MSKC
      MV(2) = JBYTET (MXT,MV(2),1,5)                                    -MSK
      GO TO 17
      END
