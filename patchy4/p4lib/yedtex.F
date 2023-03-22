CDECK  ID>, YEDTEX.
      SUBROUTINE YEDTEX

C-    STEERING ROUTINE FOR YEDIT

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCPARU/MCCTOU,JCCLOW,JCCTPX
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
      COMMON /EDTEXT/NEDVEC,MEDVEC(22),MEDDF(22), JEDDEF,JEDREP
      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)
      COMMON /MODTT/ NMODTT,JMODTT(6),TEXTTT(10)
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
     +, NVNEW(7),NRTNEW,NRNEW,LLASTN, IDNEWV(8),JPDNEW,NDKNEW
     +, NVNEWL(3),NCDECK,JNEW,MODEPR,  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (JCCF,JCCPC)
      DIMENSION    MEDTXV(48), NEXT(9), NAMLUN(8)
      EQUIVALENCE (NEXT(1),IQUEST(1))


      DATA  MEDTXV / 47, 22
     +,          4H+EOD,4H+END,4H+QUI,4H+OPT,4H+HAL,4H+NEX,4H+MAT,4H+REW
     +,          4H+STR,4H+DEF,4H+DEC,4H+PAT,4H+TIT,4H+ADB,4H+ADD,4H+REP
     +,          4H+DEL,4H+COP,4H+XCO,4H+SKI,4H+GET,4H+XSK
     +,               0,     4,     4,     4,     2,     1,     7,     1
     +,               1,     0,     2,     1,     0,     2,     2,     2
     +,               2,     2,     2,     2,     2,     2,  9,15/
      DATA  NAMLUN /4HOLD1,4HOLD2,4HOLD3,4HNEW1,4HNEW2,4HNEW3
     +,             4HOLD ,4HNEW  /
      DATA  NDRIVE /0/


C--                READY  /EDTEXT/

      CALL UCOPY (MEDTXV(2),NEDVEC,MEDTXV(1))
      NTRUNC = 80 - 8*MOPTIO(20)
      MCCTOU = 7

      IF (IQREAD.EQ.0)       GO TO 81
      LUNPAM = IQREAD
      CALL KDNGO
      NCHKD  = -1

C--------          CRACK NEXT C/C TO YEDIT

   21 CALL KDNEXT (KDHOLD(1))
      JCCTYP = 99
   22 LOGLEV = LOGLVG
      IF    (NCHKD)          80,21,24

   24 JCCPRE= JEDTYP (KDHOLD(1))
      IF   (JCCPRE)          96,21,25
   25 CALL YEDKRK
      JPDNEW = JCCPRE - JEDDEF
      N      = NCHCCD
      IF ((JPDNEW.LT.0).OR.(JPDNEW.GE.4))  N=NCHCCT
      WRITE (IQPRNT,9024) (KARDCC(J),J=1,N)
      IF (JCCBAD.NE.0)       GO TO 97

C--                COPY   F/P/D/N - PARAMETERS

      CALL VZERO (NVCCP(1),8)
      IF (JCCPZ.EQ.0)        GO TO 26
      NVCCP(5) = MCCPAR(JCCPZ+1)
      NVCCP(6) = MCCPAR(JCCPZ+2)                                        -A8M
   26 IF (JCCPP.EQ.0)        GO TO 27
      NVCCP(3) = MCCPAR(JCCPP+1)
      NVCCP(4) = MCCPAR(JCCPP+2)                                        -A8M
   27 IF (JCCPD.EQ.0)        GO TO 28
      NVCCP(1) = MCCPAR(JCCPD+1)
      NVCCP(2) = MCCPAR(JCCPD+2)                                        -A8M
      IF (MCCPAR(JCCPD+3).NE.-1)   GO TO 28
      NVCCP(7) = MCCPAR(JCCPD+4)
      NVCCP(8) = MCCPAR(JCCPD+5)                                        -A8M
   28 NVCCP(9) = MCCPAR(JCCPN+1)
      NTYP     = MCCPAR(JCCPT+1)
      NLEV     = MCCPAR(JCCPC+1)
      IF (NVOLD(7).GT.MAXEOF)   GO TO 49
      IF (JPDNEW.GE.0)       GO TO 31
      IF (JPDNEW.LT.-2)      GO TO 51
      JLUN = IUCOMP (NVCCP(3),NAMLUN(1),8)
      IF (JLUN.EQ.7)  JLUN=JOLD
      IF (JLUN.EQ.8)  JLUN=JNEW+3
      IF (JLUN.EQ.0)         GO TO 97
      GO TO 52


C--------          ACTION FOR        +DECK, +PATCH, +TITLE

   31 IF (JPDNEW.GE.4)       GO TO 41
      IF (NDRIVE.NE.0)       GO TO 35

C--                AUTO-REPLACE DECK WAITING,  POSITION OLD

      N = 2*(JPDNEW-1)
      IF (N.NE.0)  CALL UCOPY (IDEOF(1),NVCCP(1),N)
      NDRIVE= 1
      MVOLDN= 1
      CALL YEDRIV

C--                DRIVE UPDATE DECK FROM INPUT TO  NEW

   35 NDRIVE= NDRIVE - 1
      MODEPR= IQPLUS
      LOGLEV = 3
      CALL PILEUP
      GO TO 22

C----    ACTION FOR  +ADB,+ADD,+REPL,+DEL,+COPY,+XCOPY,+SKIP,+GET,+XSKIP

   41 CALL LOGLV (NTYP,JCCPC,NLEV)
      JLSV = JBYT (NTYP,28,3)
      IF (JLSV.EQ.0)           GO TO 43
      JSW  = MIN  (JLSV,3)
      JLSV = JOLD
      IF (JBIT(NTYP,24).EQ.0)  GO TO 42
      JSW  = JSW  + 3
      JLSV = JNEW + 3
   42 CALL YEDXCH (JSW)
   43 NDRIVE   = 0
      MVOLDN   = JCCPRE - JEDREP
      IF (MVOLDN.GT.0)       GO TO 44
      NDRIVE   = MAX (1,NVCCP(9))
      MVOLDN   = 1 - MVOLDN
   44 CALL YEDRIV
      IF (JLSV.NE.0)  CALL YEDXCH (JLSV)
   46 IF (MOPTIO(14)+JBIT(NTYP,14).EQ.0)  GO TO 21
   47 NEXT(1) = JPDOLD
      J = 2*JPDOLD - 1
      CALL UBLOW (IDOLDV(J),NEXT(2),8)
      WRITE (IQPRNT,9047) NEXT
      GO TO 21

C----              NVOLD(7).GT.MAXEOF,  DRIVE REMAINING DECKS

   49 IF (JCCPRE.LT.4)       GO TO 51
      IF (JCCPRE.EQ.7)       GO TO 60
      IF (JPDNEW.LT.0)       GO TO 21
      IF (JPDNEW.GE.4)       GO TO 21
      GO TO 35


C--------          OTHER C/C

   51 IF (JCCPRE.GE.4)       GO TO 52
      IF (JCCPT+JCCPC.EQ.0)  GO TO 52
      CALL SETOPT
      CALL LOGLV (MOPTIO(31),-JCCPC,NLEV)
      LOGLVG = LOGLEV
      NTRUNC = 80 - 8*MOPTIO(20)
   52 NDRIVE = 0
      GO TO (81, 84, 53, 21, 47, 59, 61, 71), JCCPRE
C-          END QUI OPT HAL NEX MAT REW STR

C--                +OPT, CCH. STRING    SET CONTOL-CHAR SUBSTITUTION

   53 IF (MOPTIO(3).EQ.0)    GO TO 56
      CALL VZERO (NCHCH(1),4)
      N = MIN  (14,NCHCCT-NCHCCD)
      IF (N.LT.2)            GO TO 54
      CALL ULEFT  (KARDCC(1),NCHCCD,NCHCCT)
      CALL UBUNCH (KARDCC(NCHCCD+1),NCHCH(1),N)
   54 CALL INCHCH
      GO TO 21

C--                +OPT, MODIF, C=C1-C2,C3-C4,C5-C6.TEXT
C--                SET PARAMETERS FOR TITLE-CARD MODIFICATION

   56 IF (MOPTIO(13).EQ.0)   GO TO 21
      CALL SBIT0 (MOPTIO(31),13)
      NMODTT = MIN  (NCCPC,3)
      IF (NMODTT.EQ.0)       GO TO 21

      CALL UBLANK (KARDCC(2),NCHCCT,79)
      JS  = 0
      NCH = 0
   57 JS = JS + 1
      JP = MCCPAR(JCCPC+1)
      N  = MCCPAR(JCCPC+2)
      N  = MAX  (N-JP,0) + 1
      JMODTT(JS)   = JP
      JMODTT(JS+3) = N
      NCH   = NCH + N
      JCCPC = JCCPC + 3
      IF (JS.NE.NMODTT)      GO TO 57

C     NCH = MIN  (NCH,80)                                                A8M
      NCH = MIN  (NCH,40)                                               -A8M
      CALL UBUNCH (KARDCC(NCHCCD+1),TEXTTT(1),NCH)
      GO TO 21

C--                +MATCH, N=NOLD

   59 CALL LOGLV (NTYP,JCCPC,NLEV)
      CALL YEDMAT
      GO TO 46


C----              +REWIND, STR=OLD2.
C-    1 ATT, 2 RES, 4 CARD, 8 DET, 16 EOF, 32 HOLD, 64 OUT, 256 I, 512 F

   60 IF (JCCPP.NE.0)        GO TO 21
      JLUN = JOLD
   61 IOTON  = 512 + 1024
      IOTOFF = 47
      LOGLEV = 0
      IF (JLUN.GE.4)         GO TO 62

C--                INPUT FILE 'OLD X'

      JLSV = JOLD
      CALL YEDXCH (JLUN)
      IF (NRTOLD+NROLD.LE.0) IOTON=256
      CALL AUXFIL (0,NVOLD(1),0)
      GO TO 66

C--                OUTPUT FILE 'NEW X'

   62 JLSV = JNEW+3
      CALL YEDXCH (JLUN)
      IF (NRTNEW+NRNEW.LE.0) GO TO 63
      CALL POPREW
      GO TO 66

   63 IOTON = 256
      CALL AUXFIL (64,NVNEW(1),0)
   66 CALL YEDXCH (JLSV)
      GO TO 21


C------            +STREAM, S=OLD2, F=FILE, T=ATT,RES,EOF,HOLD,DET,N=N.
C-    1 ATT, 2 RES, 4 CARD, 8 DET, 16 EOF, 32 HOLD, 64 OUT, 256 I, 512 F

   71 MTYP = -999
      IF (JCCPT.NE.0)   MTYP=IOTYPE (NTYP,4)
      CALL YEDXCH (JLUN)
      IF (JLUN.GE.4)         GO TO 76

C----              CONNECT INPUT STREAM 'OLD X'  (MAY-BE FINISH PRESENT)

      IF (JCCF.EQ.0)         GO TO 73
      IF (NRTOLD+NROLD.LE.0) GO TO 72
      CALL AUXFIL (512,NVOLD(1),0)

   72 NRTOLD  = -1
      NVOLD(3)= MCCPAR(JCCF+1)
      MAXEOF  = 999
      IF (NVCCP(9).NE.0)   MAXEOF=NVCCP(9)
      IF (MTYP.GE.0)       NVOLD(5)= MTYP
      CALL AUXFIL (256+2048,NVOLD(1),0)
      GO TO 21

C--                SAME FILE

   73 IF (NVCCP(9).NE.0)  MAXEOF=NVCCP(9)
      IF (MTYP.LT.0)         GO TO 21
      NVOLD(5)= MTYP
      GO TO 21

C----              CONNECT OUTPUT STREAM 'NEW X' (MAY-BE FINISH PRESENT)

   76 IF (JCCF.EQ.0)         GO TO 79
      IF (NRTNEW+NRNEW.LE.0) GO TO 77
      CALL POPREW

   77 NRTNEW  = -1
      NVNEW(3)= MCCPAR(JCCF+1)
      IF (MTYP.GE.0)      NVNEW(5)= MTYP
      CALL AUXFIL (64+256+2048,NVNEW(1),0)
      GO TO 21

C--                SAME FILE

   79 IF (MTYP.LT.0)         GO TO 21
C     NVNEW(5)= MTYP .OR. 64                                             MSKC
      NVNEW(5)= MTYP                                                    -MSK
      CALL SBIT1 (NVNEW(5),7)                                           -MSK
      GO TO 21


C------            EOF,   +END, T=HOLD, EOF, DETACH

   80 WRITE (IQPRNT,9080)

   81 MVOLD1  = 0
   82 IF (NVOLD(7).GE.MAXEOF)   GO TO 84
      CALL YEDARR
      GO TO 82

C--                +QUIT, HOLD,EOF,DETACH

   84 LOGLEV = 0
      DO 88 JLUN=1,3
      CALL YEDXCH (JLUN)
      CALL YEDXCH (JLUN+3)
      IF (NRTNEW.GE.0)  CALL POPREW
      IF (NRTOLD.GE.0)  CALL AUXFIL (512,NVOLD(1),0)
   88 CONTINUE
      RETURN

C----              STOP ON FAULTY C/C

   96 CALL UBLOW (KDHOLD(1),KARDCC(1),NCHKD)
      WRITE (IQPRNT,9024) (KARDCC(J),J=1,NCHKD)
   97 WRITE (IQPRNT,9097)
      IF (IPROMU.NE.0)       GO TO 21
      CALL PABEND
      STOP

 9024 FORMAT (1X/4H ...,32X,4H... ,80A1)
 9047 FORMAT (1X,I1,1X,8A1,' - IS NEXT.'/1X)
 9080 FORMAT (1X/4H ...,32X,'... STOP BY EOF ON INPUT.')
 9097 FORMAT (1X/' *** THIS LAST CONTROL-CARD IS FAULTY.')
      END
