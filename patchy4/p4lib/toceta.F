CDECK  ID>, TOCETA.
      SUBROUTINE TOCETA (KARD)

C-    PUT 1 CARD INTO THE CETA BUFFER, WRITE TO TAPE

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /COMCET/INILEV,NWCEIN,NCHCEU,NWCEU
     +,              NWCEBA,IPAKCE(5),IPAKKD(5),JPOSA1,MXINHO
     +,              LCESAV(4)
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
      EQUIVALENCE (LORGH,LQPRIV(1)), (LORGI,LQPRIV(2))
     +,           (LXREF,LQPRIV(3)), (LTOCE,LQPRIV(4))
     +,           (LCETA,LQPRIV(7))
      EQUIVALENCE (LSTART,LCESAV(1)), (LEND, LCESAV(2))
     +,           (LSTORE,LCESAV(3)), (LTAKE,LCESAV(4))
C--------------    END CDE                             --------------
      DIMENSION    KARD(80)
      EQUIVALENCE (NCH,NCHKD)
      EQUIVALENCE (LUNEW,NVNEW(1))
      EQUIVALENCE (JMODDK,NVUTY(16))



C--   ACTION REQUEST THRU NCHKD=NCH

C-                +VE  STORE NEW CARD OF NCH CHAR.
C-                  0  CLOSE CURRENT CETA RECORD
C-                 -2  WRITE ZERO-RECORD TO END SECTION
C-                 -3  WRITE ZERO-RECORD + EOF TO END FILE
C-                 -4  INITIALIZE  TOCETA

      IF   (NCH)   71,40,11
   11 CONTINUE


C----------------  TRANSLATE 1 CARD   TO   CETA  ------------------

      CALL UPKBYT(KARD(1),1,MWK(1),NCH,IPAKKD(1))
   21 NX    = 0
      N     = 0
      JTAKE = 1
      LPUT  = LSTORE

C----              DO NEXT CHARACTER

   22 IF (JTAKE.GT.NCH)      GO TO 37
      JTAKE = JTAKE + 1
      JINHO = MWK(JTAKE-1)
      JCETA = IQ(LTOCE+JINHO)
      JCETU = IQ(LXREF+JCETA)
      IF (JCETU.EQ.0)        GO TO 31
      IF (JCETU.GE.256)      GO TO 24
      IQ(LPUT) = JCETU
      LPUT = LPUT + 1
      N    = N    + 1
      GO TO 22

   24 IF (JCETA.EQ.62)       GO TO 33

C--               HANDLE 'TAB' ON DEC MACHINES

      IF (JINHO.NE.9)          GO TO 29
      IF (JTAKE.LE.NCH)        GO TO 25
      IF (N.NE.0)              GO TO 37
      NBL = 1
      GO TO 28

   25 NBL = 8 - JBYT (N,1,3)
      IF (JMODDK.NE.0)         GO TO 28
      IF      (N.LT.6)         GO TO 261
      IF (N+NBL.LT.68)         GO TO 28
      NBL = NBL + NX
      GO TO 28

  261 NX  = 2
      IF (N.EQ.0)              GO TO 262
      IF (IQ(LSTORE).NE.45)    GO TO 268
      IF (IQ(LPUT-1).NE.45)    GO TO 268
  262 JINHO = MWK(JTAKE)
      JCETA = IQ(LTOCE+JINHO)
      IF (JCETA.LT.27)         GO TO 268
      IF (JCETA.GE.37)         GO TO 268
      NX = 3
  268 NBL = NBL - NX
      N   =   N + NX
      IF (NBL.EQ.0)            GO TO 22
   28 CALL VFILL (IQ(LPUT),NBL,45)
      LPUT = LPUT + NBL
      N    = N    + NBL
      GO TO 22
   29 CONTINUE

C--                INTERNAL C/CODE  ->  CETA  UP UP X

   30 JCETU = JCETU - 1000
      IF (JCETU.LE.0)        GO TO 31
      IQ(LPUT)   = 62
      IQ(LPUT+1) = 62
      IQ(LPUT+2) = JCETU
      LPUT = LPUT + 3
      N    = N    + 1
      GO TO 22

   31 JCETU = 57
      GO TO 35

C--                INTERNAL  UP UP X  ->  CETA C/CODE

   33 JCETU = 62
      IF (MWK(JTAKE)  .NE.JINHO)  GO TO 35
      IF (JTAKE  .EQ. NCH)        GO TO 35
      JINHO = MWK(JTAKE+1)
      JCETA = IQ(LTOCE+JINHO)
      JCETA = IQ(LXREF+JCETA+512)
      IF (JCETA.EQ.0)             GO TO 35
      JTAKE = JTAKE + 2
      JCETU = IQ(LXREF+JCETA)
      IF (JCETU.GE.256)           GO TO 30
   35 IQ(LPUT) = JCETU
      LPUT = LPUT + 1
      N    = N    + 1
      GO TO 22

C----              CARD COMPLETE

   37 LPUT = LPUT - 1
      IF (LPUT.EQ.LSTORE)    GO TO 39
      IF (IQ(LPUT).EQ.45)    GO TO 37

   39 LPUT = LPUT + 1
      IF (LPUT.GE.LEND)      GO TO 40
      IQ(LPUT) = 0
      LSTORE   = LPUT + 1
      RETURN

C---------         CLOSE COMPLETED CETA RECORD

   40 NREST = LEND+1 - LSTORE
      CALL VZERO (IQ(LSTORE),NREST)
      CALL PKBYT  (IQ(LSTART),IQ(LCETA),1,NCHCEU,IPAKCE(1))

C----              WRITE CETA RECORD

   41 NRNEW = NRNEW + 1
      NWOUT = NWCEU

      IF (MOPTIO(1).EQ.0)    GO TO 56
      WRITE (LUNEW,REC=NRNEW,IOSTAT=ISTAT) (IQ(J+LCETA-1),J=1,NWOUT)
      IF (ISTAT.EQ.0)        GO TO 58
      WRITE (IQPRNT,9843) ISTAT,ISTAT
 9843 FORMAT (1X/' ****** Stop for write error on d/a CETA file,'
     F /' ****** IOSTAT=',Z16,' hex = ',I12,' decimal')
      CALL PABEND
   56 CONTINUE
      CALL XOUTBF (LUNEW,IQ(LCETA),NWOUT)

   58 LSTORE = LSTART
      IF (NCH.GT.0)          GO TO 21
      RETURN

C------------      SPECIAL MODE ENTRIES      ------------------------
C-                 NCH = -2  WRITE ZERO-RECORD TO END SECTION
C-                       -3  WRITE Z/R + EOF TO END FILE
C-                       -4  INITIALISE  TOCETA

   71 LSTART = LCETA + 11
      LEND   = LCETA + 10 + NCHCEU
      LSTORE = LSTART
      IF (NCH.LT.-3)         RETURN

      CALL VZERO (IQ(LCETA),NWCEU)
      GO TO 41

      END
