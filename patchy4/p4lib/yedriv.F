CDECK  ID>, YEDRIV.
      SUBROUTINE YEDRIV

C-    MOVE  OLD  FORWARD, COPYING OR SKIPPING

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
     +, NVOLDQ(4),MVOLD1,MVOLDN,  NVOLD(7),NRTOLD,NROLD,MAXEOF
     +, IDOLDV(8),JPDOLD,JOLD, NVARRI(9),LARX,LARXE,LINBIN, NVCCP(10)
     +, NVNEW(10), IDNEWV(10), NVNEWL(6),  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------

C-         +DEL, +COPY, +XCOPY, +SKIP, +GET, +XSKIP
C-            1      2       3      4     5       6

      MVOLD1 = 0
      IF (MVOLDN.LT.4)       GO TO 14
      MVOLD1 = -1
      MVOLDN = MVOLDN - 3

C--                GET FILE-NAME IF UNKNOWN

   14 IF (NROLD.EQ.0)  CALL YEDARR

C--                SUBSTITUTE CURRENT PATCH/FILE FOR BLANK P=/F=

      IF (NVCCP(3).NE.IQBLAN)  GO TO 16
      NVCCP(3) = IDOLDV(3)
      NVCCP(4) = IDOLDV(4)                                              -A8M
   16 IF (NVCCP(5).NE.IQBLAN)  GO TO 27
      NVCCP(5) = IDOLDV(5)
      NVCCP(6) = IDOLDV(6)                                              -A8M
      GO TO 27


C-         +DEL, +COPY, +XCOPY, +SKIP, +GET, +XSKIP
C-            1      2       3      4     5       6

C-------           XCOPY / XSKIP PHASE

   24 CALL YEDARR
   27 IF (NVOLD(7).GT.MAXEOF)  RETURN
      IF (JEDCHK(IDOLDV(1),NVCCP(1)).NE.0)   GO TO 24

      IF (MVOLDN.GE.3)       RETURN
      MVOLD1 = MVOLDN - 2

C-------           SUCESSOR PHASE

   31 IF (NVCCP(7).NE.0)     GO TO 35
      IF (NVCCP(1).NE.0)     GO TO 32
      IF (NVCCP(3).NE.0)     GO TO 34
      IF (NVCCP(5).NE.0)     GO TO 41

C--                +AAA, D=DDD   OR   +AAA.

   32 CALL YEDARR
      RETURN

C--                +AAA, P=PPP   OR   +AAA, D=DDD-EEE

   34 CALL YEDARR
      IF (NVOLD(7).GT.MAXEOF)     RETURN
      IF (JPDOLD.GE.2)            RETURN
   35 IF (IDOLDV(1).NE.NVCCP(7))  GO TO 34
      IF (IDOLDV(2).NE.NVCCP(8))  GO TO 34                              -A8M
      GO TO 32

C--                +AAA, F=FFF

   41 CALL YEDARR
      IF (NVOLD(7).GT.MAXEOF)   RETURN
      IF (JPDOLD.NE.3)       GO TO 41
      RETURN
      END
