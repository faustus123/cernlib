CDECK  ID>, PILEUP.
      SUBROUTINE PILEUP

C-    COMPACT CARDS FOR 1 DECK AND OUTPUT TO POPOFF

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
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
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDNEWV(1)), (IDP(1),IDNEWV(3)), (IDF(1),IDNEWV(5))
C--------------    END CDE                             -----------------  ------
      DIMENSION    NSTCC(3)
      EQUIVALENCE (NSTCC(1),MWKX(1))


      IQ(LCCIX+1) = 0
      NSTCC(3) = 0
      JEODK    = 0
   12 NCDECK   = NCARDP
      IF (JCCTYP.EQ.99)  JCCTYP=JARTPX(KDHOLD(1))
      IF (JPDNEW.LT.3)       GO TO 27


C----              START TITLE

      IF (JCCTYP - MCCEOD)   24,23,22
   22 CALL VBLANK (MWK(1),80)
      CALL UBLOW  (KDHOLD(1),MWK(1),NCHKD)
      CALL UBUNCH (MWK(1),KDHOLD(1),80)
      NCHKD = 80
      NWKD  = KDNWT
      CALL UCOPY (IDEOF(1),IDNEWV(1),8)
      GO TO 32

   23 NCHKD = 0
      RETURN

   24 IF (JCCTYP.NE.MCCTIT)  GO TO 26
   25 CALL KDNEXT (KDHOLD(1))
      JCCTYP = 99
      IF (NCHKD.GE.0)        GO TO 12
      IF (NCHKD.EQ.-1)  NCHKD=0
      RETURN

   26 CALL CCKRAK (KDHOLD(1))
      IF (JCCTYP.GE.MCCEOD)  GO TO 22
      IF (JCCTYP.LT.MCCPAT)  GO TO 25
      RETURN

C----              START PATCH / DECK

   27 CALL CCKRAK (KDHOLD(1))
      J = JCCPP
      IF (JPDNEW.EQ.1)  J=JCCPD
      IF (J.EQ.0)            GO TO 29
      IDNEWV(7) = MCCPAR(J+1)
      IDNEWV(8) = MCCPAR(J+2)                                           -A8M
      IDNEWV(1) = 0
      CALL SETID (IDNEWV(1))
      IF (NCCPIF.NE.0)  NSTCC(3)=3
      IF (JCCBAD.EQ.0)       GO TO 32
      WRITE (IQPRNT,9058) IDP,IDD,JEODK, (KARDCC(J),J=1,NCHCCT)
      NVWARX(1) = NVWARX(1) + 1
      GO TO 32

C--                PATCH/DECK PARAMETER MISSING

   29 NVWARX(1) = NVWARX(1) + 1
      JC = 9999
      WRITE (IQPRNT,9058) IDP,IDD,JC,(KARDCC(J),J=1,NCHCCT)
      IF (NCHKD.LT.6)        CALL PABEND
      CALL UCTOH1 ('+DEC,?. +PAT,?. ',MWK(1),16)
      J = 8*(JPDNEW-1)
      CALL UBUNCH (MWK(J+1),KDHOLD(1),8)
      GO TO 27


C-------------     START NEW BUFFER

   31 JPDNEW    = 0
      NSTCC(3)  = 0

   32 NSTCC(2)  = 0
      NSTCC(1)  = 0
      NTOTCC    = 0
      IQ(LBUF+5)= JPDNEW

      NCREC  = NCARDP
      LENDGO = IQ(LBUF-4)
      LCARDS = LENDGO - 508
      L      = LCARDS
      LN     = L + NWKD
      CALL UCOPY (KDHOLD(1),IQ(L),NWKD)

      LEND   = LENDGO - NWSENM
      LX4    = LCCIX + 4
      IQ(LX4)= LCARDS
      LX     = LX4
      NBYTW  = MPAK9(2) - 4
      IF (JPDNEW.EQ.0)       GO TO 44

      IQ(LBUF+3)= IDNEWV(7)
      IQ(LBUF+4)= IDNEWV(8)                                             -A8M


C-------------     ACCUMULATE 1 BUFFER

C--            ACCEPT LAST, READ NEXT CARD
   41 L = LN
   42 CALL KDNEXT (IQ(L))
      IF (NCHKD.LT.0)        GO TO 61
      JCCTYP = JARTPX (IQ(L))
      LN = L + NWKD
      IF (LN.GE.LEND)        GO TO 74
   44 IF (JCCTYP.EQ.0)       GO TO 41

C----              NEW CARD IS  C / C

      CALL CCKRAK (IQ(L))
      IF (JCCBAD.NE.0)       GO TO 57
   46 JNST = 3
      IF (JCCTYP.GE.0)       GO TO 48
      IF (JCCTYP-MCCEOD)     51,73,47
   47 JNST = MIN  (-JCCTYP,3)

C--            AUGMENT INDEX VECTOR

   48 IF (NTOTCC.GE.48)      GO TO 74
      NTOTCC = NTOTCC + 1
      NSTCC(JNST) = JNST
      LX          = LX + 2
      IQ(LX-1)    = NCARDP - NCREC
      IQ(LX)      = L
      NBYTW       = NBYTW - 2
      IF (NBYTW.GE.0)        GO TO 41
      LEND  = LEND - 1
      NBYTW = NBYTW + MPAK9(2)
      GO TO 41

C--            END OF DECK IF NEW C/C IS  +DECK, +PATCH, +TITLE

   51 IF (JCCTYP.LT.MCCTIT)  GO TO 48
      JEODK = 7
      GO TO 74

C--            BAD C/C
   57 JC = NCARDP - NCDECK
      WRITE (IQPRNT,9058) IDP,IDD,JC,(KARDCC(J),J=1,NCHCCT)
      NVWARX(1) = NVWARX(1) + 1
      GO TO 46

C----              EOI, EOF, EOR (CDC)

   61 JCCTYP = 0


C-------------     END OF BUFFER

   72 NINREC = NCARDP+1 - NCREC
      GO TO 78

   73 NCHKD = 0
      GO TO 77

   74 CALL UCOPY (IQ(L),KDHOLD(1),NWKD)
   77 NINREC = NCARDP - NCREC
   78 IF (NINREC.EQ.0)       RETURN

C--                DISPATCH COMPLETED BUFFER TO POPOFF

      NWPRE  = LENDGO - LEND
      LSTART = LCARDS - NWPRE - 1
      CALL VZERO (IQ(LSTART+1),NWPRE)

      IQ(LSTART) = NWPRE + (L - LCARDS)
      IQ(LCCIX+2)= NTOTCC
      IQ(LCCIX+3)= NINREC
      IQ(LBUF+11)= NTOTCC
      IQ(LBUF+12)= NINREC
      IQ(LBUF+13)= NWPRE + 1
      IF (NTOTCC.NE.0)       GO TO 84                                   -B36M
      LX = LX - 1                                                       -B36M
      GO TO 86                                                          -B36M

   84 DO 85 J=LX4,LX,2
   85 IQ(J) = IQ(J) - LSTART
C     IF (IQ(LX4+1).EQ.0)  IQ(LX4+1)=0                                   UNI

   86 L = LSTART + NWNAME
      CALL PKBYT (IQ(LCCIX+1),IQ(L+1),1,LX-LCCIX,MPAK9(1))

      IQ(LBUF-2) = LSTART
      IQ(LBUF+1) = 0
      IQ(LBUF+6) = MAX (NSTCC(1),NSTCC(2),NSTCC(3))
      CALL POPOFF

      IF (NCHKD.LE.0)        RETURN
      IF (JEODK.EQ.0)        GO TO 31
      RETURN

C9058 FORMAT (3H0P=,A8,   3H D=,A8,   3H C=,I6,16H *** FAULTY C/C ,72A1) A8M
C9058 FORMAT (3H0P=,A6,A2,3H D=,A6,A2,3H C=,I6,16H *** FAULTY C/C ,72A1) A6
C9058 FORMAT (3H0P=,A5,A3,3H D=,A5,A3,3H C=,I6,16H *** FAULTY C/C ,72A1) A5
 9058 FORMAT (3H0P=,2A4,  3H D=,2A4,  3H C=,I6,16H *** FAULTY C/C ,72A1) A4
      END
