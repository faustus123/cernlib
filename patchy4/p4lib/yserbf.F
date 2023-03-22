CDECK  ID>, YSERBF.
      SUBROUTINE YSERBF

C-    SPLIT-OUTPUT BUFFER HANDLING

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
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
     +,    LASTEX, MCONTI
     +,    NINDX,NTOTCC,NCHOVF,NSPLIT,LUNSCR
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDNEWV(1)), (IDP(1),IDNEWV(3)), (IDF(1),IDNEWV(5))
C--------------    END CDE                             -----------------  ------
      DIMENSION    MMSBUF(4)


      DATA  MMSBUF /4HSBUF,0,0,510/,  NW/0/, NALL/0/


C---  SBUF-BANK    SPLIT-OUTPUT BUFFER RECORD

C-         LLAST + 0  (STATUS)
C-               + 1  START-SIGNAL:  0 CONT, 1 DECK, 2 PATCH, 3 FILE
C-                                   4 END-OF-BUFFER FILE
C-               + 2  DECK-NAME, PATCH-NAME, FILE-NAME
C-               + 3  -A8M
C-               + 4  DECK-NUMBER
C-               + 5  START OF FIRST CARD  (L=4)

C-    EACH CARD: L+1  NWC - LENGTH OF ENTRY, NWC=NWTK+3
C-                +2  STREAM-INDICARORS, BIT J SET IF CARD TO STREAM J
C-                +3  CARD-NUMBER
C-                +4  NWTK WORDS OF CARD-TEXT

 9041 FORMAT (1X/' SPLIT-OUTPUT BUFFER CONTAINS',I6,' CARDS.')
 9044 FORMAT (1H1,79(1H-)/1X)
 9046 FORMAT (47X,33HYSEARCH SPLIT-OUTPUT FOR STRING .,40A1)
C9055 FORMAT (30X,I7,3H - ,8A10)                                         A10
C9055 FORMAT (30X,I7,3H - ,10A8)                                         A8
C9055 FORMAT (30X,I7,3H - ,13A6,A2)                                      A6
C9055 FORMAT (30X,I7,3H - ,16A5)                                         A5
 9055 FORMAT (30X,I7,3H - ,20A4)                                         A4
C9056 FORMAT (13X,I6,3H D=,A8,   I7,3H - ,8A10)                          A10
C9056 FORMAT (13X,I6,3H D=,A8,   I7,3H - ,10A8)                          A8
C9056 FORMAT (13X,I6,3H D=,A6,A2,I7,3H - ,13A6,A2)                       A6
C9056 FORMAT (13X,I6,3H D=,A5,A3,I7,3H - ,16A5)                          A5
 9056 FORMAT (13X,I6,3H D=,2A4,  I7,3H - ,20A4)                          A4
C9063 FORMAT (3X,2HP=,A8)                                                A8M
C9063 FORMAT (3X,2HP=,2A6)                                               A6
C9063 FORMAT (3X,2HP=,2A5)                                               A5
 9063 FORMAT (3X,2HP=,2A4)                                               A4
C9065 FORMAT (1X/1X,19(1H-)/1X/2H ',A8,I9)                               A8M
C9065 FORMAT (1X/1X,19(1H-)/1X/2H ',2A6,I5)                              A6
C9065 FORMAT (1X/1X,19(1H-)/1X/2H ',2A5,I7)                              A5
 9065 FORMAT (1X/1X,19(1H-)/1X/2H ',2A4,I9)                              A4


   17 IF (JPDOLD.NE.0)       GO TO 31


C------            COPY NEW CARD TO SPLIT-BUFFER

      N = NWTK + 3
      IF (N+NW.GE.MMSBUF(4)) GO TO 27
   22 LP = LLAST + NW
      IQ(LP+1) = N
      IQ(LP+2) = NSPLIT
      IQ(LP+3) = JCARD
      CALL UBUNCH (KARDCC(1),IQ(LP+4),NCHCCT)
      NW   = NW + N
      NALL = NALL + 1
      RETURN

C----              SEND COMPLETED BUFFER TO FILE

   25 JPDOLD = -7
   26 IF (NW.EQ.0)           GO TO 30
   27 WRITE (LUNSCR) NW,(IQ(LLAST+J),J=1,NW)
      IQ(LLAST+1) = 0
      NW = 4
      IF (JPDOLD.EQ.0)       GO TO 22
      IF (JPDOLD.GE.0)       GO TO 32
      IQ(LLAST+1) = 1
      GO TO 34

C-------           START-OF-SOMETHING

   30 CALL LIFTBK (LLAST,0,0,MMSBUF,0)
      REWIND LUNSCR
      NW = 4
   31 IF (NW.NE.4) GO TO 26
   32 IQ(LLAST+1) = JPDOLD
      IQ(LLAST+4) = NDECKR + 1
      GO TO (34,36,37,39,41), JPDOLD

C--                1 NEW DECK
   34 IQ(LLAST+2) = IDOLDV(1)
      IQ(LLAST+3) = IDOLDV(2)                                           -A8M
      JPDOLD = 0
      RETURN

C--                2  NEW PATCH
   36 IQ(LLAST+2) = IDOLDV(3)
      IQ(LLAST+3) = IDOLDV(4)                                           -A8M
      GO TO 25

C--                3  NEW FILE
   37 IQ(LLAST+2) = IDOLDV(5)
      IQ(LLAST+3) = IDOLDV(6)                                           -A8M
      IQ(LLAST+4) = NDECKR
      GO TO 25

C--                4  END-OF-RUN
   39 JPDOLD = 5
      GO TO 27


C--------------    OUTPUT PHASE, PRINT EACH STRING    ------------------

   41 WRITE (IQPRNT,9041) NALL
      IF (NALL.EQ.0)         RETURN
      CALL QTOPSY (6)
      LNEXT = LQUSER(6)

   44 REWIND LUNSCR
      LSPLI = LNEXT
      IF (LSPLI.EQ.0)        RETURN
      L      = IQ(LSPLI-2)
      JSPLIT = -IQ(L+1)
      NSPLIT = 0                                                         MSK
      CALL SBIT1 (NSPLIT,JSPLIT)                                         MSK
      WRITE (IQPRNT,9044)

   45 NCHSER = IQ(L+2) + 1
      MWK(1) = IQ(LSPLI+1)
      CALL UCOPY (IQ(L+6),MWK(2),NCHSER)
      WRITE (IQPRNT,9046) (MWK(J),J=1,NCHSER)

C--                CHECK NEXT STRING IS ON SAME STREAM

      LNEXT = IQ(LSPLI-1)
      IF (LNEXT.EQ.0)        GO TO 51
      L = IQ(LNEXT-2)
      IF (-IQ(L+1).NE.JSPLIT)  GO TO 51
      LSPLI = LNEXT
      GO TO 45


C--                NEXT RECORD

   51 READ (LUNSCR) NW,(IQ(LLAST+J),J=1,NW)
      JPDOLD = IQ(LLAST+1)
      IF (JPDOLD.NE.0)       GO TO 61
   53 L    = LLAST + 4
      LEND = LLAST + NW
      N    = 0

C--                NEXT CARD

   54 L = L + N
      IF (L.GE.LEND)         GO TO 51
      N = IQ(L+1)
C     IF ((IQ(L+2).AND.NSPLIT).EQ.0)   GO TO 54                          MSKC
      IF (JBIT(IQ(L+2),JSPLIT).EQ.0)   GO TO 54                         -MSK
      IF (IDNEWV(1).NE.0)    GO TO 56
      WRITE (IQPRNT,9055) (IQ(L+J),J=3,N)
      GO TO 54

   56 IF (IDNEWV(3).EQ.0)    GO TO 57
      WRITE (IQPRNT,9063) IDP
      IDNEWV(3) = 0
   57 WRITE (IQPRNT,9056) NDECKR,IDD,(IQ(L+J),J=3,N)
      IDNEWV(1) = 0
      GO TO 54

C----              START NEW DECK, ETC.

   61 IDNEWV(1) = IQ(LLAST+2)
      IDNEWV(2) = IQ(LLAST+3)                                           -A8M
      NDECKR    = IQ(LLAST+4)
      GO TO (53,63,65,44), JPDOLD
   63 IF (LOGLEV.LT.1)       GO TO 64
      WRITE (IQPRNT,9063) IDD
      IDNEWV(3) = 0
      GO TO 51

   64 IDNEWV(3) = IDNEWV(1)
      IDNEWV(4) = IDNEWV(2)                                             -A8M
      GO TO 51

C--                NEW FILE

   65 WRITE (IQPRNT,9065) IDD,NDECKR
      GO TO 51
      END
