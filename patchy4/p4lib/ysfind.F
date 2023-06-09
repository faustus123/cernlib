CDECK  ID>, YSFIND.
      SUBROUTINE YSFIND

C-    TEXT-SEARCHING, PROCESS CARDS UNTIL NEXT ACTIVE CARD

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
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
     +, NVNEW(7),NRTNEW,NRNEW,LLASTN, IDNEWV(8),JPDNEW,NDKNEW
     +, NVNEWL(3),NCDECK,JNEW,MODEPR,  MWK(80),MWKX(80)
     +,    LASTEX, MCONTI
     +,    NINDX,NTOTCC,NCHOVF,NSPLIT,LUNSCR, LIMITF,MINSER
C--------------    END CDE                             -----------------  ------

      EQUIVALENCE (LINDX,LQMAIN), (LUNEW,NVNEW(1))




      NCHOVF = -7
      IFLMON = 0
      IFLSPL = 0
      NSPLIT = 0
      GO TO 11

C--                WRITE LAST CARD IF COPY-OPTION

   10 IF (MOPTIO(3).EQ.0)    GO TO 11
      CALL UBUNCH (KARDCC(1),MWK(1),NCH)
      CALL XOUTCF (LUNEW,MWK(1),NWTK)
      NRNEW  = NRNEW + 1

C--                READY NEXT CARD

   11 JCARD = JCARD + 1
      IF (JCARD.GE.NTOTCC)   RETURN
      LE = LTK + KDNWT1 - 1
      DO 12 L=LTK,LE
      IF (AND(IQ(L),Z'FF000000').EQ.0)    GO TO 14
   12 CONTINUE
      NWTK = KDNWT
      NCH  = 80
      GO TO 15

   14 NWTK = L - LTK + 1
      NCH  = NWTK * IQCHAW - 1

   15 CALL UBLOW (IQ(LTK),KARDCC(1),NCH)
      NCHCCT = NCH
      LTK    = LTK + NWTK

C--                CHECK CONTINUATION CARD

      IF (MCONTI.EQ.0)           GO TO 17
      IF (LASTEX+1.NE.JCARD)     GO TO 17
      IF (KARDCC(6).EQ.IQBLAN)   GO TO 17
      DO 16 J=1,5
      IF (KARDCC(J).NE.IQBLAN)   GO TO 17
   16 CONTINUE
      IFLMON = 7
   17 CONTINUE

C----              ANALYSE EACH CHARACTER

      NRUN = MIN  (NCH,72)
      LIMIT= MIN  (NRUN-MINSER,LIMITF)
      JRUN = 0
      NGET = 0
      NPUT = 0

C--                CHECK START CHARACTER IS IN INDEX-BANK

   21 IF (JRUN.GE.LIMIT)     GO TO 61
      JRUN = JRUN + 1

      JFIRST = IUCOMP (KARDCC(JRUN),IQ(LINDX+1),NINDX)
      IF (JFIRST.EQ.0)       GO TO 21
      LTEXT = IQ(LINDX - JFIRST)
      GO TO 27

C--                CONDITION PROCESSING

   23 IF (IQ(LCOND+5).EQ.JCARD) GO TO 272
      GO TO 24

  232 IF (NFIX.EQ.JRUN)      GO TO 271

C--                COMPARE FOR TEXT-STRINGS STARTING WITH THIS CHAR.

   24 LTEXT = IQ(LTEXT-1)
      IF (LTEXT.EQ.0)        GO TO 21

   27 NFIX = IQ(LTEXT+4)
      IF   (NFIX.NE.0)       GO TO 232
  271 LCOND = IQ(LTEXT-2)
      IF (LCOND.NE.0)        GO TO 23
  272 JN     = JRUN
      NCHSER = IQ(LTEXT+2)
      IF (NCHSER.EQ.0)       GO TO 41
      IF (NCHSER+JRUN.GT.NRUN)  GO TO 24
      NF = LTEXT + 6
      NL = NF+NCHSER-1
      DO 28 J = NF,NL
      JN = JN + 1
      IF (KARDCC(JN).NE.IQ(J))  GO TO 24
   28 CONTINUE

C--                STRING FOUND, REPLACE UNLESS  NCHREP=0 OR -VE

   41 JN     = MIN  (JN+IQ(LTEXT+3),NRUN)
      NCHREP = IQ(LTEXT+1)
      IF  (NCHREP)           46,43,42
   42 N = JRUN - NGET - 1
      CALL UCOPY (KARDCC(NGET+1),MWK(NPUT+1),N)
      NGET  = JN
      NPUT  = NPUT + N
      CALL UBLOW (IQ(LTEXT+NCHSER+6),MWK(NPUT+1),NCHREP)
      NPUT  = NPUT + NCHREP
   43 IFLMON= 7
      JRUN  = JN
      GO TO 21

C--                CONDITION SATISFIED

   45 IQ(LTEXT+5) = JCARD
      GO TO 21

C--                -VE NCHREP,  CONDITION, BYPASS OR SPLIT STRING

   46 JRUN = JN
      IF (NCHREP.EQ.-255)    GO TO 21
      IF (NCHREP.EQ.-511)    GO TO 45
      CALL SBIT1 (NSPLIT,-NCHREP)
      IFLSPL= 7
      GO TO 21


C--        END OF CARD. CHECK REPLACEMENTS, COPY REMAINING CHARACTERS

   61 IF (IFLMON+IFLSPL.EQ.0)    GO TO 10
      IF (IFLSPL.EQ.0)           GO TO 63
      CALL YSERBF
      IFLSPL = 0
      NSPLIT = 0

   63 IF (IFLMON.EQ.0)       GO TO 10
      NCHOVF = 0
      IF (NPUT.EQ.0)         RETURN
      IF (NGET.GE.NRUN)      GO TO 71
      N = NRUN - NGET
      CALL UCOPY (KARDCC(NGET+1),MWK(NPUT+1),N)
      NPUT = NPUT + N

C--        CARD WITH TAG

   71 IF (NCH.LT.73)         GO TO 81
      MISS = 72 - NPUT
      IF (MISS)              77,73,72
   72 CALL VBLANK (KARDCC(NPUT+1),MISS)
   73 CALL UCOPY (MWK(1),KARDCC(1),NPUT)
      RETURN

C--        DISCARD TRAILING BLANKS IN OVERFLOW

   77 IF (NPUT.EQ.72)        GO TO 73
      IF (MWK(NPUT).NE.IQBLAN)  GO TO 78
      NPUT = NPUT - 1
      GO TO 77

   78 NCHOVF = NPUT
      NPUT   = 72
      GO TO 73

C--        CARD WITHOUT TAG

   81 IF (MWK(NPUT).NE.IQBLAN)  GO TO 82
      NPUT = NPUT - 1
      GO TO 81

   82 IF (NPUT.GE.73)        GO TO 86
   83 CALL UCOPY (MWK(1),KARDCC(1),NPUT)
      NCHCCT = NPUT
      RETURN

C--        REMAINING OVERFLOW

   86 NCHOVF = NPUT
      NPUT   = 72
      GO TO 83
      END
