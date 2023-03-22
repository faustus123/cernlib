CDECK  ID>, YSHVAL.
      SUBROUTINE YSHVAL

C-    RECOGNISE 1 TAG AND EVALUATE TRUTH VALUE

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +, KADRV(14),LADRV(11),LCCIX,LBUF,LLAST
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEX(20)
     +, NVINC(6),NVUTY(17),IDEOF(9),NVPROX(6),LOGLVG,LOGLEV,NVWARX(6)
     +, NVOLDQ(6), NVOLD(10), IDOLDV(10), NVARRI(12), NVCCP(10)
     +, NVNEW(10), IDNEWV(10), NVNEWL(6),  MWK(80),MWKX(80)
     +,    NINDX,NTOTCC,LEV,NCHTAG,NWWTAG, KD1ORG,KD1REP
     +,    MTAG(8),JTERM,NACCU,JTG,NEND
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LINDX,LQMAIN)

      DIMENSION    MTERM(3)
      DATA  MTERM  /4H,   ,4H-   ,4H+   /


C--        DECIDE LEADING MINUS

      IF (NINDX.EQ.0)        GO TO 71
      JPREF = 1
      IF (MTAG(JTG).NE.IQMINS)  GO TO 21
      JPREF = -1
      JTG   = JTG + 1

C--        FIND TERMINATOR

   21 JTG   = JTG + 1
      J     = JTG
   22 IF (J.GT.NEND)         GO TO 23
      JTERM = IUCOMP (MTAG(J),MTERM(1),3)
      IF (JTERM.NE.0)        GO TO 24
      J = J + 1
      GO TO 22

   23 JTERM = 0
   24 NTG = J - JTG

C--------- FIND CHAIN FOR FIRST CHARACTER

      J = IUCOMP (MTAG(JTG-1),IQ(LINDX+1),NINDX)
      IF (J.EQ.0)            GO TO 71

      LX = IQ(LINDX-J)
      GO TO 35

   34 LX = IQ(LX-1)
   35 IF (LX.EQ.0)           GO TO 71

      IF (NTG.NE.IQ(LX+1))   GO TO 34

      JH = JTG
      JM = LX + 3
      JE = JM + NTG

   36 IF (JM.EQ.JE)          GO TO 41
      IF (MTAG(JH).NE.IQ(JM))  GO TO 34
      JH = JH + 1
      JM = JM + 1
      GO TO 36

C--------- BANK FOUND

   41 IF (JPREF.EQ.IQ(LX+2)) NACCU = 7
      JTERM = 3 - JTERM
      JTG   = JTG + NTG
      RETURN

C--------- UNKNOWN TAG

   71 JTERM = -7
      RETURN
      END
