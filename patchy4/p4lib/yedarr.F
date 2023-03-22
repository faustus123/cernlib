CDECK  ID>, YEDARR.
      SUBROUTINE YEDARR

C-    COPY 1 DECK FROM OLD TO NEW     FOR MVOLD1=0
C-    SKIP 1 DECK FROM OLD            FOR MVOLD1=-1

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDOLDV(1)), (IDP(1),IDOLDV(3)), (IDF(1),IDOLDV(5))
C--------------    END CDE                             -----------------  ------

 9037 FORMAT (40X,'TRYING TO READ BEYOND EOI OR FILE',I4,' ON ',A4/
     F40X,'COLLECT TRAILING DECKS ONLY.')
C9042 FORMAT (5X,2H- ,A8, 6X,4H- D=)                                     A8M
C9042 FORMAT (5X,2H- ,2A6, 6H  - D=)                                     A6
C9042 FORMAT (5X,2H- ,2A5,4X,4H- D=)                                     A5
 9042 FORMAT (5X,2H- ,2A4,6X,4H- D=)                                     A4
C9043 FORMAT (21X,4H-   ,A8)                                             A8M
C9043 FORMAT (21X,4H-   ,2A6)                                            A6
C9043 FORMAT (21X,4H-   ,2A5)                                            A5
 9043 FORMAT (21X,4H-   ,2A4)                                            A4


C-------           COPY NEXT DECK

   21 IF (NROLD.EQ.0)        GO TO 31
      IF   (MVOLD1)          41,22,39
   22 IQ(LBUF+3)= IDOLDV(7)
      IQ(LBUF+4)= IDOLDV(8)                                             -A8M
      MODEPR = IQLETT(JOLD)
      IF (JOLD.EQ.1)  MODEPR=IQDOT

   27 IQ(LBUF+1) = 7
      CALL POPIN
      IF (NVARRI(3).NE.0)    GO TO 71
      CALL POPOFF
      GO TO 27

C----              START OF NEW FILE, GET FILE-IDENT

   31 IF (NVOLD(7).GE.MAXEOF)   GO TO 37
   32 CALL UCOPY (IDEOF(1),IDOLDV(1),9)
      IF (NVOLD(7).GE.MAXEOF)   RETURN
      IF (NRTOLD.GE.0)       GO TO 34
      CALL AUXFIL (256,NVOLD(1),0)

C--                READ FILE-NAME  RECORD

   34 CALL POPIN
      IF (NVARRI(1).EQ.4)    GO TO 36
      IDOLDV(5) = NVARRI(5)
      IDOLDV(6) = NVARRI(6)                                             -A8M
      RETURN

C--                EOI READ

   36 MAXEOF = NVOLD(7)
      RETURN

C----              PASSING EOI OR DECLARED MAXIMUM

   37 WRITE (IQPRNT,9037) NVOLD(7),NVOLD(6)
      IF (MOPTIO(11).NE.0)   CALL PABEND
      NVOLD(7) = NVOLD(7) + 1
   39 RETURN


C-------           SKIP NEXT DECK

   41 IF (JPDOLD-2)          43,42,51
   42 IF (LOGLEV.LT.2)       GO TO 46
      WRITE (IQPRNT,9042) IDP
      GO TO 46
   43 IF (LOGLEV.LT.4)       GO TO 46
      WRITE (IQPRNT,9043) IDD

   46 IQ(LBUF+1) = -7
      CALL POPIN
      GO TO 72

C--                SKIP PENDING  EOF/TITLE, BUT SAVE IT IN CASE

   51 IQ(LBUF+1) = 7
      CALL POPIN
      MODEPR= IQMINS
      CALL PRTITL
      IF (IQ(LLAST+1).GE.-1) GO TO 56
      IQ(LBUF+1)= -1
      LDO  = LBUF
      LBUF = LLAST
      LLAST= LDO
   56 IF (NVARRI(3).EQ.0)    GO TO 46
      GO TO 72

C------            READY FOR NEXT DECK WAITING

   71 IQ(LBUF+1)= 0
      CALL POPOFF
   72 CALL SETID (IDOLDV(1))
      IF (JPDOLD.NE.3)       RETURN

C--                END FILE, ACCOUNT AND GET FILE-NAME OF NEXT

      CALL AUXFIL (0,NVOLD(1),0)
      GO TO 32
      END
