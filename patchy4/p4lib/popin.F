CDECK  ID>, POPIN.
      SUBROUTINE POPIN

C-    READ/SKIP NEXT RECORD OF COMPACT PAM

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
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
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LUNUSE,NVOLD(1))


      LINBIN = IQ(LBUF-3)
      JPROC  = IQ(LBUF+1)
    9 IF   (JPROC)           12,12,21

C----              SKIP NEXT DECK, SKIP RECORD WITHOUT C/C

   11 IF (NVARRI(3).NE.0)    RETURN
   12 CONTINUE
      J = 3
      CALL XINB (LUNUSE,IQ(LINBIN+1),J)
      IF   (J.EQ.0)          GO TO 81
      IF   (J.LT.0)          GO TO 80
      GO TO 31

C----              READ NEXT RECORD IN FULL

   21 CONTINUE
      J = 510
      CALL XINB (LUNUSE,IQ(LINBIN+1),J)
      IF   (J.EQ.0)          GO TO 81
      IF   (J.LT.0)          GO TO 80
      IQ(LINBIN) = J
      IQ(LBUF-2) = LINBIN


C----              DIGEST CONTROL-INFORMATION

   31 NROLD = NROLD + 1
C     LLX   = LINBIN + 2                                                 A8M
      LLX   = LINBIN + 3                                                -A8M
      CALL UPKBYT (IQ(LLX),1,NVARRI(1),4,MPAK2(1))
      CALL UPKBYT (IQ(LLX),2,NVARRI(7),3,MPAK9(1))
      IF (NVARRI(7).EQ.0)  NVARRI(9)=NWSEN1
      NVARRI(5) = IQ(LINBIN+1)
      NVARRI(6) = IQ(LINBIN+2)                                          -A8M
      CALL UCOPY (NVARRI(1),IQ(LBUF+5),9)
      IQ(LBUF+15) = IQ(LBUF+15) + NVARRI(8)

      IF (NROLD.LT.3)        GO TO 71
      IF (NVARRI(1).EQ.0)    GO TO 34

C--                NEW DECK/PATCH STARTING

   33 JCARD  = 0
      NDECKR = NDECKR + 1
      IQ(LBUF+14) = IQ(LBUF+15) - NVARRI(8)
   34 IF   (JPROC)           11,35,61
   35 IF (IQ(LBUF+2).NE.0)   GO TO 68
   39 RETURN

C----              CONSTRUCT C/C-INDEX

   61 IF (IQ(LBUF+2))        68,39,62
   62 IF (NVARRI(7).EQ.0)    GO TO 68
      N = 2*NVARRI(7) + 3
      CALL UPKBYT (IQ(LLX),2,IQ(LCCIX+1),N,MPAK9(1))

      LARX  = LCCIX + 3
      LARXE = LCCIX + N + 1
      IQ(LARXE)  = NVARRI(8)
      IQ(LARXE+1)= -(LINBIN+IQ(LINBIN)+1)

      DO 64   L=LARX,LARXE,2
      IQ(L)   = - (IQ(L)+LINBIN)
   64 IQ(L+1) =   IQ(L+1) + JCARD
      IQ(LARX) = -IQ(LARX)
      IF (IQ(LARX+1).NE.JCARD)  RETURN
      LARX = LARX + 2
      RETURN

C----              CONSTRUCT C/C-INDEX FOR NO C/C

   68 LARX  = LCCIX + 3
      LARXE = LARX  + 1
      IQ(LARX)   = NVARRI(9) + LINBIN
      IQ(LARXE)  = NVARRI(8) + JCARD
      IQ(LARXE+1)= -(LINBIN+IQ(LINBIN)+1)
      RETURN


C-------           START OF NEW FILE,  NROLD=1 FOR FILE-ID RECORD

   71 IF (NROLD.NE.1)        GO TO 73
      IF (NVARRI(1)+NVARRI(3).NE.6)  GO TO 79
      IF (NVARRI(2).NE.0)            GO TO 79
      NDECKR = 100 * ((NDECKR+99)/100)
      IQ(LBUF+14) = 0
      IQ(LBUF+15) = 0
      JCARD  = 1
      RETURN

C--                NROLD=2 FOR  FILE TITLE RECORD

   73 IF (NVARRI(1).EQ.3)    GO TO 34

C--                BAD FORMAT

   79 WRITE (IQPRNT,9079) NVOLD(6)
      GO TO 89

C-------           MACHINE EOF SEEN

   80 CALL PABERR (LUNUSE)
   81 NVARRI(1) = 4
      NVARRI(3) = 3
      IF (NROLD.NE.0)        GO TO 86
      WRITE (IQPRNT,9082) NVOLD(6)
      RETURN

C--                UNEXPECTED EOF

   86 WRITE (IQPRNT,9086) NVOLD(6)
   89 CALL PABEND
      RETURN

 9079 FORMAT (1X/' ***  ',A6,' NOT COMPACT BINARY OR BADLY POSITIONED.')
C9082 FORMAT (9H EOI ON  ,A5)                                           -A4
 9082 FORMAT (9H EOI ON  ,A4)                                            A4
 9086 FORMAT (1X/' ***  UNEXPECTED EOF READ ON ',A6)
      END
