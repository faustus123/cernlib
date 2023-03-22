CDECK  ID>, DOSPGO.
      SUBROUTINE DOSPGO

C-    READY NEXT PAM-FILE FOR PROCESSING, READ PAM HEADER RECORD

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
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +, KADRV(9), LEXD,LEXH,LEXP,LPAM,LDECO, LADRV(14)
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEB(14),MEXDEC(6)
     +, NVINC(6),NVUTY(16),NVIMAT(6),NVACT(6),NVGARB(6),NVWARN(6)
     +, JASK,JCWAIT,JCWDEL,LARMAT,LAREND,NCARR
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(9),LARX,LARXE,LINBUF
     +, NVCCP(7),JARDO,JARWT,JARLEV
     +, NVDEP(14),LDPMAT,JDPMAT,LDPACT,JDPACT,NDPLEV,MDEPAR, NVDEPL(6)
     +, MWK(80),MWKX(80)
      EQUIVALENCE(LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
C--------------    END CDE                             -----------------  ------
      DIMENSION    MVPR(30), MMRPAM(4)
      EQUIVALENCE (MVPR(1),MWKX(1))

C     DATA  MMRPAM /4HRPAM,2,1,4/                                        A8M
      DATA  MMRPAM /4HRPAM,2,1,5/                                       -A8M
      DATA  MMQUE  /4H????/


      CALL VZERO  (NCHKD,5)
      CALL VBLANK (KARDCC(1),84)
      IDARRV(5)= MMQUE
      IDARRV(6)= IQBLAN                                                 -A8M
      LUNPAM   = NVARR(1)
      NVOPER(6)= 0
      NDKSV    = NDECKR
      JPROPD   = 0


C----              READ FILE-NAME RECORD,  COMPACT BINARY

      NDPLEV = 0
      IF (MODPAM.NE.0)       GO TO 31
      MCCTOU = 0

      JARDO = 7
      CALL ARBIN
      IF (NVARRI(1).NE.3)    GO TO 25
      IF (NVARRI(3).NE.3)    GO TO 27
      IF (NVARRI(2).NE.0)    GO TO 27
      IF (JARDO    .NE.0)    GO TO 27
      NVARRI(3)= 0
      IDARRV(5)= NVARRI(5)
      IDARRV(6)= NVARRI(6)                                              -A8M
      NDECKR = 100 * ((NDECKR+98)/100)
      IF (IQ(LPAM+5).EQ.0)   GO TO 41

C--                READY NEXT RECORD WITH  +PAM,...,P=  : JPROPD=2
      JARDO = 7
      CALL ARBIN
      IF (NVARRI(1).NE.3)    GO TO 27
      NDECKR = NDECKR - 1
      JPROPD = 2
      GO TO 41

C--                START OF PATCH FOUND, CONTINUE PREV. FILE : JPROPD=-2

   25 IF ( NVARRI(1).NE.2)   GO TO 27
      IF (IQ(LRBIG+1).LT.0)  GO TO 27
      LRPAM = IQ(LRBIG-2)
      IDARRV(5) = IQ(LRPAM+4)
      IDARRV(6) = IQ(LRPAM+5)                                           -A8M
      N      = MOD (IQ(LRBIG+1)+1,100)
      NDECKR = N + 100*( (NDECKR-N+98) /100)
      JPROPD = -2
      GO TO 41

C--                EOI  OR  POSITIONING FAULT

   27 IF (JPROPD.GE.4)       RETURN
      WRITE (IQPRNT,9027)
      CALL PABEND


C--                READ TITLE CARD,  CARD-PAM

   31 MCCTOU = -7
      JCARD  =  1
      IF (IQ(LPAM+5).EQ.0)   GO TO 34
      IF (NVARR(9).LT.0)     GO TO 34
      JPROPD = 2
      GO TO 41

   34 JARWT  = 2
      LARMAT = LINBUF
      LAREND = LARMAT + 40
      JARDO  = 0
      CALL ARBCD
      IF (JPROPD.GE.4)       RETURN
      IF (JCCTYP.EQ.MCCTIT)  GO TO 31
      IF (NVDEP(12).EQ.0)    GO TO 41
      CALL NAMEFL (IQ(LINBUF),IDARRV(5))

C------            READY  RPAM-BANK,  LQUSER(7) SUPPORTS 'PAST PAT'-STR.

   41 CALL LIFTBK (LRPAM,7,0,MMRPAM,7)
      IQ(LRPAM+1) = NDECKR
      IQ(LRPAM+2) = IQDOT
      IQ(LRPAM+4) = IDARRV(5)
      IQ(LRPAM+5) = IDARRV(6)                                           -A8M
      IQ(LRBIG-2) = LRPAM

C--                PREPARE PRINTING

      CALL VBLANK (MVPR(1),30)
      CALL UBLOW (IDARRV(5),MVPR(2), 8)
      CALL UBLOW (6H.START, MVPR(12),6)
      IF (NVARR(9).LT.0)        GO TO 58
      IF (IDARRV(5).EQ.MMQUE)   GO TO 61
      IF (LQUSER(1).EQ.0)       GO TO 61
      IF (IQ(LRBIG+1).GE.0)     GO TO 61


C--                CHECK FILE DE-SELECTED

      LB = LQUSER(1)
   53 N  = IQ(LB+1)
      L  = LB + 2

      DO 54 J=1,N
      IF (IQ(L+1).NE.IDARRV(6))  GO TO 54                               -A8M
      IF (IQ(L)  .NE.IDARRV(5))  GO TO 54
      IQ(L) = 0
      GO TO 61
C  54 L  = L + 1                                                         A8M
   54 L  = L + 2                                                        -A8M
      LB = IQ(LB-1)
      IF (LB.NE.0)           GO TO 53
   58 NVARR(9) = NVARR(9) + 1
      CALL UBLOW (6H.SKIP ,MVPR(12),6)
      IQ(LRPAM+1) = -NDKSV - 1
      GO TO 64

C----              FILE ACCEPTED

   61 IF (JPROPD.NE.2)       GO TO 64
      JCCIFV = 0
      JCCPT  = 4
      MCCPAR(5) = IQ(LPAM+4)
      IDARRV(7) = IQ(LPAM+5)
      IDARRV(8) = IQ(LPAM+6)                                            -A8M
      IQ(LPAM+5)= 0

C--                PRINT START-OF-FILE INFORMATION

   64 NVARR(7) = NVARR(7) + 1
      MVPR(19) = 100*IQ(LPAM+11) + NVARR(7)
      CALL SBYT (MVPR(19),IQ(LRPAM),1,17)
      CALL UCTOH1 ('REWINDRESUMECONTIN',IQUEST(1),18)
      J = 6*IQ(LPAM+3)
      CALL UCOPY (IQUEST(J+1),MVPR(22),6)
      WRITE (IQPRNT,9064) MVPR
      NQUSED= NQUSED + 2
      IQ(LPAM+3)  = 2
      IQ(LRBIG+1) = -7
      RETURN

 9027 FORMAT ('0***  PAM IS NOT PACKED BINARY OR IS BADLY POSITIONED.')
 9064 FORMAT (1X/1X,10(1H-),18A1,'PAM-FILE',I4,6H,   --,11A1)
      END
