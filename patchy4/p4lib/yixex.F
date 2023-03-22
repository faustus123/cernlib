CDECK  ID>, YIXEX.
      SUBROUTINE YIXEX

C--   YINDEX, CREATE INDEX OF MULTI PAM FILE

      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
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
     +, NVOLDQ(4),MVOLD1,MVOLDN,  NVOLD(7),NRTOLD,NROLD,MAXEOF
     +, IDOLDV(8),JPDOLD,JOLD, NVARRI(9),LARX,LARXE,LINBIN, NVCCP(10)
     +, NVNEW(10), IDNEWV(10), NVNEWL(6),  MWK(80),MWKX(80)
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDOLDV(1)), (IDP(1),IDOLDV(3)), (IDF(1),IDOLDV(5))
C--------------    END CDE                             -----------------  ------


      DIMENSION    MMPAT(4), MMDEC(4), MMSEQ(4)
C     DIMENSION    MSEQSP(4)                                             A8M
C     DIMENSION    MSEQSP(4), MSEQS2(4)                                  A6
      DIMENSION    MSEQSP(3), MSEQS2(4)                                 -A6M
      DIMENSION    IFLGV(2)


C     DATA         MMPAT/4HPAT ,1,1,2/,  MMDEC/4HDECK,2,1,2/             A8M
      DATA         MMPAT/4HPAT ,1,1,3/,  MMDEC/4HDECK,2,1,3/            -A8M
C     DATA         MMSEQ/4HSEQ ,2,1,1/                                   A8M
      DATA         MMSEQ/4HSEQ ,2,1,2/                                  -A8M
C     DATA         NSEQSP/4/                                             A6M
      DATA         NSEQSP/3/                                            -A6M
C     DATA         MSEQSP/6HQCARD1,6HQCARDL,7HQNOLIST,6HQEJECT/          A8M
C     DATA         MSEQSP/6HQCARD1,6HQCARDL,6HQNOLIS ,6HQEJECT/          A6
C     DATA         MSEQS2/4H      ,4H      ,4HT      ,4H      /          A6
C     DATA         MSEQSP/5HQCARD ,         5HQNOLI  ,5HQEJEC /          A5
C     DATA         MSEQS2/4H1     ,4HL     ,4HST     ,4HT     /          A5
      DATA         MSEQSP/4HQCAR  ,         4HQNOL   ,4HQEJE  /          A4
      DATA         MSEQS2/4HD1    ,4HDL    ,4HIST    ,4HCT    /          A4
      DATA         IFLGV /4H    ,4H IF /


      MOPTIO(25) = MAX  (MOPTIO(24),MOPTIO(25))
      MOPTIO(26) = MAX  (MOPTIO(25),MOPTIO(26))
      LDECKU = 0

      IQ(LBUF+1) = 7
      IQ(LBUF+2) = 7
      IOTON = 256

C-    1 ATT, 2 RES, 4 CARD, 8 DET, 16 EOF, 32 HOLD, 64 OUT, 256 I, 512 F


C-----     START NEW PAM,  READ PAM HEADER RECORD

   31 CALL AUXFIL (0,NVOLD(1),4HPAM )
      CALL POPIN
      IF (NVARRI(1).EQ.4)    GO TO 71

      CALL UCOPY (IDEOF(1),IDOLDV(1),9)
      IDOLDV(5) = NVARRI(5)
      IDOLDV(6) = NVARRI(6)                                             -A8M
      CALL POPIN
      LTK = IABS (IQ(LARX))
      CALL KDCOPY (IQ(LTK))
      WRITE (IQPRNT,9032) IDF,NDECKR,(KIMA(J),J=1,NWTK)
      WRITE (IQPRNT,9000)
      GO TO 35

C-----             START NEXT RECORD

   34 IF (NVARRI(3).EQ.0)    GO TO 41
      IF (NVARRI(3).GE.3)    GO TO 31
      CALL SETID (IDOLDV(1))
      CALL POPIN
      IF (NVARRI(1).EQ.1)    GO TO 37
      NEWPAT = NDECKR
      IF (LOGLEV.LT.1)       GO TO 36
      WRITE (IQPRNT,9034) IDP,NDECKR
   35 NEWPAT = 0
   36 NEWDEC = 0
      CALL LIFTBK (LPATU,1,0,MMPAT(1),7)
      IQ(LPATU+1) = NDECKR
      IQ(LPATU+2) = IDOLDV(3)
      IQ(LPATU+3) = IDOLDV(4)                                           -A8M
      J = 4
      GO TO 38

   37 J      = 2
      NEWDEC = NDECKR
      IF (LOGLEV.LT.2)       GO TO 38
      WRITE (IQPRNT,9037) NDECKR,IDD
   38 IF (MOPTIO(25).NE.0)   GO TO 39
      CALL LIFTBK (LDECKU,J,0,MMDEC(1),7)
      IQ(LDECKU-2) = LPATU
      IQ(LDECKU+1) = NDECKR
      IQ(LDECKU+2) = IDOLDV(1)
      IQ(LDECKU+3) = IDOLDV(2)                                          -A8M
   39 LTK    = IQ(LARX)
      GO TO 421


C----              PROCESS RECORD

   41 CALL POPIN
   42 LTK = -IQ(LARX)
  421 IF (LTK.LT.0)          GO TO 67
      CALL KDCOPY (IQ(LTK))
      NCHKD = IQCHAW * NWTK
      JCCTYP= JARTYP (KIMA(1))
      IF (JCCTYP.EQ.0)       GO TO 67
      CALL CCKRAK(KIMA(1))
      LISTCC= 0
      IF (JCCTYP.GE.2)       GO TO 49
      IF (JCCTYP.EQ.1)       GO TO 47
      IF (JCCTYP.EQ.-1)      GO TO 45
      IF (JCCTYP.EQ.-2)      GO TO 44
      IF (JCCTYP.GE.MCCEOD)  GO TO 43
      IF (NCCPZ+NCCPT+NCCPIF.EQ.0)   GO TO 57

C--                C/C OTHER THEN +SELF, +SEQ, +KEEP, ACTION

   43 IF (MOPTIO(3).EQ.0)    GO TO 57
      GO TO 51

C--                +SELF, Z=...

   44 IF (NCCPZ.EQ.0)        GO TO 57
      IF (MOPTIO(19).EQ.0)   GO TO 57
      GO TO 51

C--                +SEQ, Z=...   SPECIAL: +SEQ,QCARD1,R=RNAME

   45 IF (JCCPD.NE.0)        GO TO 461
      IF (MOPTIO(19).EQ.0)   GO TO 57
      IF (NCCPZ.GE.2)        GO TO 51
      IF (NCCPZ.EQ.0)        GO TO 57
      IDNEWV(1) = MCCPAR(JCCPZ+1)
      IDNEWV(2) = MCCPAR(JCCPZ+2)                                       -A8M
      J = IUCOMP (IDNEWV(1),MSEQSP(1),NSEQSP)
      IF (J.EQ.0)            GO TO 51
C     IF (IDNEWV(2).NE.MSEQS2(J))       GO TO 51                         A6
C     IF (J.NE.1)            GO TO 57                                    A6M

      IF (J.EQ.1)            GO TO 46                                   -A6M
      IF (IDNEWV(2).NE.MSEQS2(J+1))     GO TO 51                        -A6M
      GO TO 57                                                          -A6M
   46 IF (IDNEWV(2).EQ.MSEQS2(2))       GO TO 57                        -A6M
      IF (IDNEWV(2).NE.MSEQS2(1))       GO TO 51                        -A6M
      GO TO 57

  461 IF (LOGLEV.LT.2)       GO TO 57
      GO TO 51

C--                +KEEP,...    +DEF,Z=...

   47 IF (JCCPT.EQ.0)        GO TO 48
      IF (JBIT(MCCPAR(JCCPT+1),4).NE.0)  GO TO 57                       -MSK
C     IF ((MCCPAR(JCCPT+1).AND.8).NE.0)  GO TO 57                        MSKC
   48 IF (MOPTIO(26).NE.0)   GO TO 481
      CALL LIFTBK (L,3,0,MMSEQ(1),0)
      IQ(L-2) = LDECKU
      IQ(L+1) = MCCPAR(JCCPZ+1)
      IQ(L+2) = MCCPAR(JCCPZ+2)                                         -A8M
  481 IF (MOPTIO(11).EQ.0)   GO TO 57
      GO TO 51

C--                ACTION CARDS,  +ADB,... ETC

   49 IF (MOPTIO(1)+MOPTIO(3).EQ.0)     GO TO 57
      IF (JCCPC.EQ.0)        GO TO 43
      IF (MOPTIO(1).EQ.0)    GO TO 57
      IF (NCCPP+NCCPD.EQ.0)  GO TO 57

C----              HANDLE IF= PARAMETERS

   51 LISTCC = 7
   57 IF (JCCPIF.EQ.0)       GO TO 61
      LISTCC = LISTCC + MOPTIO(9)

      LIF = JCCPIF
      NIF = NCCPIF
C  54 LP = LQFIND   (MCCPAR(LIF+1),2,1,J)                                A8M
   54 LP = LQLONG (2,MCCPAR(LIF+1),2,1,J)                               -A8M
      IF (LP.NE.0)           GO TO 56
      CALL LIFTBK (LP,1,0,MMPAT(1),7)
      IQ(LP+1) = -11111
      IQ(LP+2) = MCCPAR(LIF+1)
      IQ(LP+3) = MCCPAR(LIF+2)                                          -A8M
   56 CALL SBIT1 (IQ(LP),1)                                             -MSK
C  56 IQ(LP) = IQ(LP) .OR. 1                                             MSKC
      LIF = LIF + 3
      NIF = NIF - 1
      IF (NIF.GT.0)          GO TO 54

C----              LIST SELECTED C/C

   61 IF (LISTCC.EQ.0)       GO TO 67
      IF (LOGLEV.GE.2)       GO TO 64
      IF (NEWPAT.EQ.0)       GO TO 62
      WRITE (IQPRNT,9034) IDP,NEWPAT
      NEWPAT = 0
   62 IF (NEWDEC.EQ.0)       GO TO 64
      WRITE (IQPRNT,9037) NEWDEC,IDD
      NEWDEC = 0
   64 WRITE (IQPRNT,9062) JCARD,(KIMA(J),J=1,NWTK)
   67 JCARD = IQ(LARX+1)
      LARX  = LARX + 2
      IF (LARX.LT.LARXE)     GO TO 42
      GO TO 34


C-------           EOI OF PAM

   71 IF (LQUSER(1).EQ.0)    RETURN
      CALL AUXFIL (512,NVOLD(1),0)
      DO 72  J=1,3
   72 MOPTIO(J+23) = MAX  (MOPTIO(J+23),1-LQUSER(J))
      NQUSED = NQLNOR

C----              PRINT PATCH INDEX

      IF (MOPTIO(24).NE.0)   GO TO 75
      CALL QTOPSY (1)
C     CALL QSORTH   (2, 1)                                               A8M
      CALL QSORVH (2,2, 1)                                              -A8M
      NQUSED = NQLPTH + 3
      WRITE (IQPRNT,9072)
      LP = LQUSER(1)
   73 IDOLDV(3)= IQ(LP+2)
      IDOLDV(4)= IQ(LP+3)                                               -A8M
      IF ((IDP(1).EQ.IDEOF(3)).AND.(IDP(2).EQ.IDEOF(4))) GO TO 74       -A8M
C     IF  (IDP   .EQ.IDEOF(3))     GO TO 74                              A8M
      J = JBIT (IQ(LP),1)                                               -MSK
C     J = IQ(LP) .AND. 1                                                 MSKC
      IFLG = IFLGV(J+1)
      IF (IQ(LP+1).GE.0)           GO TO 731
      LN = IQ(LP-1)
      IF (LN.EQ.0)                 GO TO 731
      IF (IQ(LN+2).NE.IQ(LP+2))    GO TO 731
      IF (IQ(LN+3).NE.IQ(LP+3))    GO TO 731                            -A8M
      LP = LN
  731 NDECKR = IQ(LP+1)
      WRITE (IQPRNT,9074) IFLG,NDECKR,IDP
      NQUSED = NQUSED + 1
   74 LP = IQ(LP-1)
      IF (LP.NE.0)           GO TO 73
      NQUSED = MOD (NQUSED,NQLMAX)


C----              PRINT DECK INDEX

   75 IF (MOPTIO(25).NE.0)   GO TO 81
      CALL QTOPSY (2)
C     CALL QSORTH   (2, 2)                                               A8M
      CALL QSORVH (2,2, 2)                                              -A8M
      J      = 0
      NQUSED = NQUSED + 1
      IF (NQUSED+10.LT.NQLNOR) GO TO 78
      J      = 1
      NQUSED = NQLPTH
   78 NQUSED = NQUSED + 3
      WRITE (IQPRNT,9075) J
      LD = LQUSER(2)
   76 LP = IQ(LD-2)
      NDECKR   = IQ(LD+1)
      IDOLDV(1)= IQ(LD+2)
      IDOLDV(2)= IQ(LD+3)                                               -A8M
      IDOLDV(3)= IQ(LP+2)
      IDOLDV(4)= IQ(LP+3)                                               -A8M
      IF (IDOLDV(1).EQ.IQBLAN)   GO TO 77
      WRITE (IQPRNT,9076) NDECKR,IDP,IDD
      NQUSED = NQUSED + 1

C--                CHECK DUPLICATE DECK

      LN = LD
  763 LN = IQ(LN-1)
      IF (LN.EQ.0)                GO TO 77
      IF (IQ(LN+2).NE.IDOLDV(1))  GO TO 77
      IF (IQ(LN+3).NE.IDOLDV(2))  GO TO 77                              -A8M
      IF (IQ(LN-2).NE.LP)    GO TO 763
      WRITE (IQPRNT,9077) IDP,IDD
      WRITE (IQPRNT,9078)
      NQUSED = NQUSED + 2
   77 LD = IQ(LD-1)
      IF (LD.NE.0)           GO TO 76
      NQUSED = MOD (NQUSED,NQLMAX)

C----              PRINT SEQ INDEX

   81 IF (MOPTIO(26).NE.0)   RETURN
      CALL QTOPSY (3)
C     CALL QSORTH   (1, 3)                                               A8M
      CALL QSORVH (1,2, 3)                                              -A8M
      J      = 0
      NQUSED = NQUSED + 1
      IF (NQUSED+10.LT.NQLNOR) GO TO 83
      J      = 1
      NQUSED = NQLPTH
   83 NQUSED = NQUSED + 3
      WRITE (IQPRNT,9081) J
      L = LQUSER(3)
   82 LD       = IQ(L-2)
      LP       = IQ(LD-2)
      NDECKR   = IQ(LD+1)
      IDOLDV(1)= IQ(LD+2)
      IDOLDV(2)= IQ(LD+3)                                               -A8M
      IDOLDV(3)= IQ(LP+2)
      IDOLDV(4)= IQ(LP+3)                                               -A8M
      IDOLDV(5)= IQ(L+1)
      IDOLDV(6)= IQ(L+2)                                                -A8M
      WRITE (IQPRNT,9082) NDECKR,IDP,IDD,IDF
   86 L = IQ(L-1)
      IF (L.NE.0)            GO TO 82
      RETURN

 9000 FORMAT (1X)
 9001 FORMAT (1H1)
C9032 FORMAT (1X/3H F=,A10,    5H-----,I6,6H .--- ,8A10)                 A10
C9032 FORMAT (1X/3H F=,A8,   7H  -----,I6,6H .--- ,10A8)                 A8
C9032 FORMAT (1X/3H F=,A6,A2,7H  -----,I6,6H .--- ,14A6)                 A6
C9032 FORMAT (1X/3H F=,2A5,    5H-----,I6,6H .--- ,16A5)                 A5
 9032 FORMAT (1X/3H F=,2A4,  7H  -----,I6,6H .--- ,20A4)                 A4
C9034 FORMAT (7X,3HP= ,A8,   I6,6H . D= )                                A8M
C9034 FORMAT (7X,3HP= ,A6,A2,I6,6H . D= )                                A6
C9034 FORMAT (7X,3HP= ,A5,A3,I6,6H . D= )                                A5
 9034 FORMAT (7X,3HP= ,2A4,  I6,6H . D= )                                A4
C9037 FORMAT (18X,I6,6H . D= ,A8)                                        A8M
C9037 FORMAT (18X,I6,6H . D= ,2A6)                                       A6
C9037 FORMAT (18X,I6,6H . D= ,2A5)                                       A5
 9037 FORMAT (18X,I6,6H . D= ,2A4)                                       A4
C9062 FORMAT (30X,I7,3H - ,8A10)                                         A10
C9062 FORMAT (30X,I7,3H - ,10A8)                                         A8
C9062 FORMAT (30X,I7,3H - ,13A6,A2)                                      A6
C9062 FORMAT (30X,I7,3H - ,16A5)                                         A5
 9062 FORMAT (30X,I7,3H - ,20A4)                                         A4
 9072 FORMAT (20H1   INDEX OF PATCHES /4X,8(1H-),1X,7(1H-)/1X)
C9074 FORMAT (A4,I6,3H = ,A8,1H.)                                        A8M
C9074 FORMAT (A4,I6,3H = ,A6,A2,1H.)                                     A6
C9074 FORMAT (A4,I6,3H = ,A5,A3,1H.)                                     A5
 9074 FORMAT (A4,I6,3H = ,2A4,1H.)                                       A4
 9075 FORMAT (I1,11X,15HINDEX OF  DECKS/12X,8(1H-),2X,5(1H-)/1X)
C9076 FORMAT (3X,I6,3H = ,A8,2H. ,A8)                                    A8M
C9076 FORMAT (3X,I6,3H = ,A6,A2,2H. ,2A6)                                A6
C9076 FORMAT (3X,I6,3H = ,A5,A3,2H. ,2A5)                                A5
 9076 FORMAT (3X,I6,3H = ,2A4,  2H. ,2A4)                                A4
C9077 FORMAT (31X,'***** DUPLICATE ',A8,   1H., A8,' NOT ALLOWED')       A8M
C9077 FORMAT (31X,'***** DUPLICATE ',A6,A2,1H.,A6,A3,'NOT ALLOWED')      A6
C9077 FORMAT (31X,'***** DUPLICATE ',A5,A3,1H.,2A5,'NOT ALLOWED')        A5
 9077 FORMAT (31X,'***** DUPLICATE ',2A4,  1H.,2A4,' NOT ALLOWED')       A4
 9078 FORMAT (31X,15(1H*))
 9081 FORMAT (I1,22X,24HINDEX OF  SEQUENCE  DEF./23X,8(1H-),2X,8(1H-)
     F/1X)
C9082 FORMAT (3X,I6,3H = ,A8,1H.,A8,4H Z= ,A8)                           A8M
C9082 FORMAT (3X,I6,3H = ,A6,A2,1H.,A6,A2,4H Z= ,2A6)                    A6
C9082 FORMAT (3X,I6,3H = ,A5,A3,1H.,A5,A3,4H Z= ,2A5)                    A5
 9082 FORMAT (3X,I6,3H = ,2A4,  1H.,2A4,  4H Z= ,2A4)                    A4
      END
