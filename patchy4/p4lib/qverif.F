CDECK  ID>, QVERIF.
      FUNCTION QVERIF (LPARA,MODEP)

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /QCN/   IQLS,IQID,IQNL,IQNS,IQND,IQFOUL
      COMMON /QSTATE/QVERSN,NQINIT,NQSTAG(2),NQPHAS,NQERR,QDEBUG,NQDCUT
     +,              NQNEWB,NQAFTB,NQM99,NQLOWB,NQWCUT,NQLOCK,QSTDUM
     +,              NQAUGM(2),NQZIP(8),AQMEM(12)
                         INTEGER QDEBUG
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    IVMQCM(10)
      EQUIVALENCE (IVMQCM(1),NQSYSR)



C--                VERIFY MONOTONY OF STORAGE PARAMETERS

      LSTOP= LPARA
      MODE = MODEP
      IF (JBIT(MODE,4).EQ.0)  GO TO 21
      LA = NQSYSS
      DO 16 J=1,10
      LN = IVMQCM(J)
      IF (LN.LT.LA)          GO TO 91
   16 LA = LN

C----              TRIGGER LOW BANKS

   21 IF (JBIT(MODE,3).EQ.0)   GO TO 22
      LN  = LQWORG
      LEND= LQWORK
      IF (JBIT(MODE,1).EQ.0)   GO TO 34
      LA = 1
      LE = NQSYSS + 1
      GO TO 43

C----              TRIGGER HIGH BANKS

   22 IF (JBIT(MODE,1).EQ.0)   GO TO 25
      LN  = 0
      LEND= 0
      LA  = 1
      LE  = NQSYSS + 1
      GO TO 43

   24 IF (LEND.EQ.LSTOP)       GO TO 88
   25 IF (JBIT(MODE,2).EQ.0)   GO TO 88
      LN  = LQSTA
      LEND= LSTOP
      IF (JBIT(MODE,1).NE.0)   GO TO 41

C------            LOOP FOR BANK CHAINIG CLOB. CHECK ONLY

   34 IF (LN.GE.LEND)        GO TO 24
      CALL QBLOWX (LN)
      IF (IQFOUL.NE.0)       GO TO 91
      LN = IQLS + IQND + 1
      GO TO 34

C------            LOOP FOR CHECKING STRUCTURAL LINKS ALSO

   41 IF (LN.GE.LEND)        GO TO 24
      CALL QBLOWX (LN)
      IF (IQFOUL.NE.0)       GO TO 91
      LA = IQLS - IQNS
      LE = IQLS
      LN = IQLS + IQND + 1
   43 IF (LA.GE.LE)          GO TO 41
      IQLS= LQ(LA)
      LA  = LA + 1
      IF (IQLS.EQ.0)         GO TO 43
      CALL QNAMEX
      IF (IQFOUL.EQ.0)       GO TO 43

C--                RETURNS

   91 IF (JBIT(MODE,5).NE.0)   GO TO 93
      QVERIF= -7.
      RETURN

   93 CONTINUE
      CALL QFATAL

   88 QVERIF= 0.
      RETURN
      END
