CDECK  ID>, YLISEX.
      SUBROUTINE YLISEX

C-    YLIST, LIST CARD IMAGES OF COMPACT BINARY FILE

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
     +, MARKW(5),LASTP(2),NEWP(2),LASTD(2),NEWD(2)
     +, MODEPR,NEXTCC,NUINCA,NUINCB
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDOLDV(1)), (IDP(1),IDOLDV(3)), (IDF(1),IDOLDV(5))
C--------------    END CDE                             -----------------  ------
      DIMENSION    MARK(4)
      EQUIVALENCE (MARK(1),MARKW(2))

C     DIMENSION    NSEQEJ(1)                                             A8M
      DIMENSION    NSEQEJ(2)                                            -A8M
      DIMENSION    LPPAGE(4)
      DATA  NSEQEJ /4HQEJE,4HCT  /

      DATA  LPPAGE / 56, 62, 84, 110 /
C--                SET LINES PER PAGE IF OPTION-SELECTED

      DO 16  J=1,4
      IF (MOPTIO(J+26).NE.0)  GO TO 17
   16 CONTINUE
      GO TO 18

   17 NQLNOR = LPPAGE(J)
      NQLMAX = NQLNOR
      NQLPTH = 0
   18 CONTINUE
      JCWYL  = -7
      NQUSED = 12


      IQ(LBUF+1) = 7
      IQ(LBUF+2) = 7
      IOTON = 256

C-    1 ATT, 2 RES, 4 CARD, 8 DET, 16 EOF, 32 HOLD, 64 OUT, 256 I, 512 F

C-----     START NEW PAM,  READ PAM HEADER RECORD

   21 CALL AUXFIL (0,NVOLD(1),4HPAM )
      CALL POPIN
      IF (NVARRI(1).EQ.4)    GO TO 29

      CALL UCOPY (IDEOF(1),IDOLDV(1),9)
      IDOLDV(5) = NVARRI(5)
      IDOLDV(6) = NVARRI(6)                                             -A8M
      IF (JCWYL.GE.0)  NQUSED = NQLNOR
      JCARD  = 0
      CALL YLISPG
      JCARD  = 1
      JCWYL  = 1
      MODEPR = IQMINS
      GO TO 36

C--                E O I

   29 CALL AUXFIL (512,NVOLD(1),0)
      N = NQLMAX - NQLPTH
      WRITE (IQPRNT,9027) N,LPPAGE

      IF (NVWARX(1)+NVWARX(2).EQ.0)     RETURN
      WRITE (IQPRNT,9029)  (NVWARX(J),J=1,2)
      RETURN


C----              READ RECORD BY RECORD AND LIST CARDS

   31 IF (NVARRI(3).EQ.0)    GO TO 36
      NVCCP(1) = JCARD
      IF (NVARRI(3).GE.3)    GO TO 21
      CALL SETID (IDOLDV(1))

   36 CALL POPIN
      IF (NVARRI(1).EQ.0)    GO TO 52
      IF (NVARRI(1).EQ.3)    GO TO 52

C--                ANALYZE P/D CARD

      LTK    = IQ(LARX)
      CALL KDCOPY (IQ(LTK))
      NCHKD = IQCHAW * NWTK
      JCCTYP= MCCDEF - NVARRI(1)
      CALL CCKRAK (KIMA(1))
      CALL YLISPG
      IF (MOPTIO(23).EQ.0)   GO TO 37
      WRITE (IQPRNT,9043) JCWYL,JCARD,IQPLUS,(KIMA(J),J=1,NWTK)
      GO TO 38

   37 WRITE (IQPRNT,9047) JCARD,IQPLUS,(KIMA(J),J=1,NWTK)
   38 MODEPR = IQMINS
      JCARD  = JCARD + 1
      JCWYL  = JCWYL + 1
      NQUSED = NQUSED + 1
      IF (JCCBAD.NE.0)       GO TO 79

C--                LIST CARD-GROUP WITH WYLBUR LINES

   41 NEXTCC = IQ(LARX+1)
      IF (MOPTIO(23).EQ.0)   GO TO 46
   42 IF (JCARD.EQ.NEXTCC)   GO TO 51
      CALL KDCOPY (IQ(LTK))
      IF (NQUSED.GE.NQLNOR)  GO TO 44
   43 WRITE (IQPRNT,9043) JCWYL,JCARD,MODEPR,(KIMA(J),J=1,NWTK)
      JCARD  = JCARD + 1
      JCWYL  = JCWYL + 1
      NQUSED = NQUSED + 1
      GO TO 42

   44 CALL YLISPG
      IF (MOPTIO(23).NE.0)   GO TO 43
      GO TO 47

C--                LIST CARD-GROUP WITHOUT WYLBUR LINES

   46 IF (JCARD.EQ.NEXTCC)   GO TO 51
      CALL KDCOPY (IQ(LTK))
      IF (NQUSED.GE.NQLNOR)  GO TO 44
   47 WRITE (IQPRNT,9047) JCARD,MODEPR,(KIMA(J),J=1,NWTK)
      JCARD  = JCARD + 1
      NQUSED = NQUSED + 1
      GO TO 46

C--                YTOBIN PACKING INCONSISTENCY

   50 WRITE (IQPRNT,9050)
      NVWARX(2) = NVWARX(2) + 1
      NQUSED    = NQUSED + 3
      LTK = - IQ(LARX+2)

C--                NEW C/C GROUP

   51 IF (LTK+IQ(LARX+2) .NE.0)    GO TO 50
      LARX = LARX + 2
      IF (LARX.GE.LARXE)     GO TO 31
   52 LTK  = IQ(LARX)
      IF (LTK.GE.0)          GO TO 41

C----              ANALYSE C/C

      LTK = -IQ(LARX)
      CALL KDCOPY (IQ(LTK))
      NCHKD  = IQCHAW*NWTK
      JCCTYP = JARTYP (KIMA(1))
      CALL CCKRAK (KIMA(1))
      MARK(1) = IQBLAN
      MARK(2) = JCARD
      MARK(3) = IQBLAN
      MARK(4) = IQPLUS
      NUINCB  = 1
      IF (JCCTYP+1)          54,57,61

C--                +SELF, ALL OTHER C/C

   54 MODEPR = IQMINS
      IF (JCCTYP.EQ.-2)      GO TO 71
      GO TO 73

C--                +CDE / +SEQ,   HANDLE Z=QEJECT

   57 MARK(3)= IQDOT
      MARK(4)= MODEPR
      IF (MCCPAR(JCCPZ+1).NE.NSEQEJ(1))  GO TO 73
      IF (MCCPAR(JCCPZ+2).NE.NSEQEJ(2))  GO TO 73                       -A8M
      IF (NQUSED.LT.10)                  GO TO 73
      IF (JCCBAD.NE.0)                   GO TO 73
      NUINCA = NQLMAX - NQUSED
      IF (NUINCA.EQ.0)                   GO TO 81
      IF (NUINCA.LT.10)                  GO TO 75
      IF (MOPTIO(5)+MOPTIO(19).NE.2)     GO TO 73
      IF (JCCPN.EQ.0)                    GO TO 75
      IF (NQUSED+MCCPAR(JCCPN+1).GE.NQLNOR)       GO TO 75
      GO TO 73

C--                +KEEP / +DEL / +REPL / +ADD / +ADB

   61 MODEPR = IQDOT
      IF (JCCTYP.EQ.1)       GO TO 72
      IF (NCCPC .NE.0)       GO TO 62
      IF (JCCTYP.EQ.2)       GO TO 54
      JCCBAD = 7

   62 JCCPD   = MAX  (1,JCCPD)
      NEWD(1) = MCCPAR(JCCPD+1)
      NEWD(2) = MCCPAR(JCCPD+2)                                         -A8M
      IF (JCCPP.EQ.0)           GO TO 65
      NEWP(1) = MCCPAR(JCCPP+1)
      NEWP(2) = MCCPAR(JCCPP+2)                                         -A8M
      IF (NVUTY(17).EQ.0)       GO TO 68
      IF (NEWP(1).NE.LASTP(1))  GO TO 68
      IF (NEWP(2).NE.LASTP(2))  GO TO 68                                -A8M
      GO TO 66

   64 JCCBAD = 7
      GO TO 72


   65 IF (NVUTY(17).EQ.0)    GO TO 64
      IF (JCCPD.EQ.1)        GO TO 72
   66 CONTINUE
      IF (NEWD(2).NE.LASTD(2))   GO TO 68                               -A8M
      IF (NEWD(1).EQ.LASTD(1))   GO TO 72

   68 NVUTY(17)= NEWP(1)
      LASTP(1) = NEWP(1)
      LASTP(2) = NEWP(2)                                                -A8M
      LASTD(1) = NEWD(1)
      LASTD(2) = NEWD(2)                                                -A8M

C--                PRINT CURRENT C/C

   71 MARK(3)= IQMINS
   72 NUINCB = 4
      NQUSED = NQUSED + 1
      MARK(1)= IQNUM(1)

   73 NUINCA = 1
      IF (NQUSED+NUINCB.GE.NQLNOR)  GO TO 81
   75 IF (MOPTIO(23).EQ.0)   GO TO 77
      MARKW(1) = MARKW(2)
      MARKW(2) = JCWYL
      WRITE (IQPRNT,9076)  MARKW, (KIMA(J),J=1,NWTK)
      GO TO 78

   77 WRITE (IQPRNT,9077)  MARK,  (KIMA(J),J=1,NWTK)
   78 JCARD  = JCARD  + 1
      JCWYL  = JCWYL  + 1
      NQUSED = NQUSED + NUINCA
      IF (JCCBAD.EQ.0)       GO TO 41

   79 WRITE (IQPRNT,9079)
      NQUSED = NQUSED + 1
      NVWARX(1) = NVWARX(1) + 1
      GO TO 41

C--                PAGE EJECT

   81 CALL YLISPG
      MARK(1) = IQBLAN
      NUINCA  = 1
      GO TO 75

 9027 FORMAT (1X/1X,14(1H-)/' LINES PER PAGE'/' ACTIVE:',I7/
     F1X/' THE OPTIONS  0,  1,  2,  3'/' SELECT:',3X,4I4)
 9029 FORMAT (1X,3(/1X,44(1H*)),I6,' FAULTY CONTROL CARDS SEEN'/
     F45X,I6,' PACKING INCONSISTENCIES.')
 9050 FORMAT (1X/20X,18(1H*),
     F'  YTOBIN PACKING INCONSISTENCY DETECTED IN LAST CARD GROUP   '
     F,18(1H*)/1X)
C9043 FORMAT (4X,I6,1H.,I6,1X,A2,8A10)                                   A10
C9043 FORMAT (8X,I6,1H.,I6,1X,A2,10A8)                                   A8
C9043 FORMAT (2X,I6,1H.,I6,1X,A2,14A6)                                   A6
C9043 FORMAT (4X,I6,1H.,I6,1X,A2,16A5)                                   A5
 9043 FORMAT (4X,I6,1H.,I6,1X,A2,20A4)                                   A4
C9047 FORMAT (1X,I6,1X,A2,8A10)                                          A10
C9047 FORMAT (7X,I6,1X,A2,10A8)                                          A8
C9047 FORMAT (3X,I6,1X,A2,14A6)                                          A6
C9047 FORMAT (1X,I6,1X,A2,16A5)                                          A5
 9047 FORMAT (3X,I6,1X,A2,20A4)                                          A4
C9076 FORMAT (A4,I6,1H.,I6,A1,A2,8A10)                                   A10
C9076 FORMAT (A8,I6,1H.,I6,A1,A2,10A8)                                   A8
C9076 FORMAT (A2,I6,1H.,I6,A1,A2,14A6)                                   A6
C9076 FORMAT (A4,I6,1H.,I6,A1,A2,16A5)                                   A5
 9076 FORMAT (A4,I6,1H.,I6,A1,A2,20A4)                                   A4
C9077 FORMAT (A1,I6,A1,A2,8A10)                                          A10
C9077 FORMAT (A7,I6,A1,A2,10A8)                                          A8
C9077 FORMAT (A3,I6,A1,A2,14A6)                                          A6
C9077 FORMAT (A1,I6,A1,A2,16A5)                                          A5
 9077 FORMAT (A3,I6,A1,A2,20A4)                                          A4
 9079 FORMAT (1X,40(1H*),20X,'ABOVE C/C IS FAULTY')
      END
