CDECK  ID>, CREBUF.
      SUBROUTINE CREBUF

C-    CREATE 1 PAM I/O-BUFFER, + POSS. INDEX EXPANSION/CREATION BANK
C-
C-    MULTI-FLAG CONTROL-PARAMETER  NBUFCI
C-    IABS(NBUFCI) = NWCI    WORDS OF PRE-BUFFER INFORMATION (MIN 16)
C-                           WORDS L+1  -  L+16   STANDARD MEANING
C-                           WORDS L+17 ONWARDS   SPECIAL, ANY PROGRAM
C-                           BUFFER-REGION STARTS AT  L+NWCI+1
C-    NBUFCI  +VE, EVEN      NO PILEUP TO THIS BANK, NO INDEX-BANK
C-    NBUFCI  +VE, ODD       PILEUP PROVISION, YES INDEX-BANK
C-    NBUFCI  -VE            NO PILEUP, BUT LIFT INDEX-BANK

      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)
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
C--------------    END CDE                             -----------------  ------

      DIMENSION    MMCCIX(4),  MMBUF(6)


      DATA  MMCCIX /4HCCIX,0,0,100/
      DATA  MMBUF  /4HBUF ,4,0,2H**,16,512/
C     DATA  NWPILE /15/                                                  B64
C     DATA  NWPILE /17/                                                  B60
C     DATA  NWPILE /20/                                                  B48
C     DATA  NWPILE /25/                                                  B36
      DATA  NWPILE /34/                                                  B32


      NWCI     = MAX  (MMBUF(5),IABS(NBUFCI))
      NTOL     = KDNWT + 8
      MMBUF(4) = MMBUF(6) + NWCI + NTOL
      IF (NBUFCI.LT.0)           GO TO 24
      IF (JBIT(NBUFCI,1).EQ.0)   GO TO 25                               -MSK
C     IF ((NBUFCI.AND.1).EQ.0)   GO TO 25                                MSKC
      MMBUF(4) = MMBUF(4) + NWPILE
   24 IF (LCCIX.NE.0)        GO TO 25
      CALL LIFTBK (LCCIX,0,0,MMCCIX(1),0)

   25 CALL LIFTBK (LBUF, 0,0,MMBUF(1), 0)
      CALL VZERO (IQ(LBUF+1),MMBUF(4))
      IQ(LBUF-4) = LBUF + MMBUF(4) - NTOL
      IQ(LBUF-3) = LBUF + NWCI + 1
      IQ(LBUF-2) = IQ(LBUF-3)
      IQ(LBUF+1) = -7
      RETURN
      END
