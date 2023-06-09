CDECK  ID>, DOSPEC.
      SUBROUTINE DOSPEC

C-    HANDLE SPECIAL RARE RUN CONDITIONS

      COMMON /MQCT/  IQTBIT,IQTVAL,LQTA,LQTB,LQTE,LQMTB,LQMTE,LQMTH
     +,              IQPART,NQFREE
      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
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
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
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
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(11),LINBUF,NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
      EQUIVALENCE(LPAST,LADRV(1)),  (LPCRA,LADRV(2)), (LDCRAB,LADRV(3))
     +,          (LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
     +,         (KACTEX,NVACT(4)), (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
     +,           (LCRP,NVUTY(3)),   (LCRH,NVUTY(4)),   (LCRD,NVUTY(5))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (JCCF,JCCPC)
      DIMENSION    MVPR(6)
      EQUIVALENCE (MVPR(1),IQUEST(11))
      DIMENSION    MMRBIG(4), MMUNIT(2)


      DATA  MMRBIG /4HRBIG,2,1,2/
      DATA  MMUNIT /4H RCR,4H CAR /,  ICRA/4HCRA*/


C----              GARBAGE COLLECTION

      GO TO (21,27,41,61), JANSW

   21 NVGARB(1) = LQTOL - LQWORK
      IF (LQUSER(5).EQ.0)    GO TO 22
      CALL QTOUCH (IQDROP,LQUSER(5),3HSH.)
      CALL MQGARB
      NVGARB(4) = NVGARB(4) + 1
   22 NQFREE = 0
   24 NVGARB(5) = NQFREE
   25 NQRESV = LQTOL - LQWORK
      NQFREE = NVGARB(1) - NQRESV
      NQUSED = NQUSED + 1
      IF (MOPTIO(2).NE.0)  WRITE (IQPRNT,9025) NDECKR,
     +                                         NVGARB(1),NQRESV,NQFREE
      IF (JANSW.EQ.3)        GO TO 48
      RETURN

C----              ROLL-IN MATERIAL FOR CURRENT PATCH

   27 CONTINUE
      RETURN

C----              EOF SEEN ON PAM-FILE,  (ALSO START P=CRA*,D=BLANK )

   41 IF (NVARR(6).NE.0)     GO TO 51
      IF (NCARDP.EQ.0)       GO TO 43
      NVARR(8)    = NVARR(8)    + NCARDP
      IQ(LPAM+10) = IQ(LPAM+10) + NSKIPR
      IQ(LRPAM+3) = NDECKR
      NDECKR = NDECKR + 1
      IF (JPROPD.GE.4)       GO TO 43
      IF (NVARR(7).LT.NVARR(10))  GO TO 71

C--                MULTI PAM FINISHED, TERMINAL REWIND

   43 J = LPAM + 9 - MODPAM
      IQ(J) = IQ(J) + NVARR(8)
      CALL IOFILE (512,NVARR(1))
      IF (IOMODE(6).EQ.0)  IQ(LRBIG+1)=-7

      WRITE (IQPRNT,9044) IQ(LPAM+11),NVARR(8),MMUNIT(MODPAM+1),MVPR
      NQUSED = NQUSED + 2


C----              RE-START INPUT FROM CRADLE

      NVARR(6) = 1
      IDARRV(1)= ICRA
      IDARRV(2)= IQBLAN                                                 -A8M
      IDARRV(3)= ICRA
      IDARRV(4)= IQBLAN                                                 -A8M
      JANSW    = 3
      IF (LQTOL-LQWORK.LT.NVGARB(3))  GO TO 21
   48 NVUTY(6)= 7
      CALL CREAPD (IDARRV(3),0)
      LEXH  = IQ(LEXP-2)
      LEXD  = 0
      LPCRA = LEXP
      LDECO = 0
      CALL SBYT (NDECKR,IQ(LEXP+1),16,15)
      NVUSEB(3) = IQ(LEXP)

   51 NVUSEB(4) = NVUSEB(3)
      NVUSEB(8) = NVUSEB(4)                                             -MSK
      CALL SBIT0      (NVUSEB(8), 8)                                    -MSK
      CALL SBYTOR (513,NVUSEB(8), 9,10)                                 -MSK
C     NVUSEB(8) = 131328 .OR. (NVUSEB(4).AND.130943)                     MSKC
      NVUSEB(9) = 1
      KADRV(2)  = 0
      KADRV(3)  = 0
      IDARRV(5) = IQSTAR
      IDARRV(6) = IQBLAN                                                -A8M
      NVGARB(1) = LQTOL - LQWORK
      NVDEP(5)  = 1
      NVDEP(6)  = 1
      NVDEPL(3) = 1
      NVDEPL(4) = 7
      NVOPER(3) = 0
      KACTEX= 0
      LACTEX= -7
      JCWAIT= LARGE
      JCWDEL= 0
      MODPAM= 1
      NCHKD = -1
      NCARDP= 0
      LUNPAM= IQREAD
      CALL KDNGO
      MCCTOU= -7
      JANSW = 3
      RETURN

C----              +QUIT IN CRADLE

   59 JANSW= 5
      RETURN

C-------           END OF CRADLE, START NEW PAM

   61 IQ(LPAM+7) = IQ(LPAM+7) + NCARDP
      IF (JCCTYP.NE.MCCPAM)  GO TO 59
      IQ(LPAM+1) = MCCPAR(JCCPD+1)
      IQ(LPAM+2) = MCCPAR(JCCPD+2)                                      -A8M
      IQ(LPAM+11)= IQ(LPAM+11) + 1
      MPAMTP     = MCCPAR(JCCPT+1)
      MODPAM     = JBIT(MPAMTP,3)
      NVOPER(3)  = JBIT(MPAMTP,21)
      NVARR(3)   = MCCPAR(JCCF+1)
      NVARR(5)   = IOTYPE (MPAMTP,0)
      NVARR(6)   = 0
      NVARR(7)   = 0
      NVARR(8)   = 0
      NVARR(9)   = 0
      IF (NCCPN.LT.2)        GO TO 62
      NVARR(9)   = -MCCPAR(JCCPN+1)
      JCCPN = JCCPN + 3
   62 NVARR(10)  = MCCPAR(JCCPN+1) - NVARR(9)
      IF (NVARR(10).EQ.0)    NVARR(10)=999

      IQ(LPAM+4) = 0
      IQ(LPAM+5) = MCCPAR(JCCPP+1)
      IQ(LPAM+6) = MCCPAR(JCCPP+2)                                      -A8M
      IF (NCCPP.LT.2)        GO TO 64
      CALL UBLOW (MCCPAR(JCCPP+4),IQUEST(1),2)
      J = IUCOMP (IQUEST(1),IQLETT(1),4)
      IF (J.EQ.0)            GO TO 64
      CALL SBIT1 (IQ(LPAM+4),J)

C--                READY  RBIG-BANK FOR NEW BIG-FILE

   64 CALL IOFILE (256+2048,NVARR(1))
      IQ(LPAM+3) = IOMODE(2)
      IF (IOPARF(3).NE.0)    GO TO 67
      IF (LRBIG.NE.0)        GO TO 69
      IOPARF(3) = IOPARF(1)
C-                           LQUSER(2) SUPPORTS 'RBIG'-STRUCTURE
   67 LRBIG = LQFIND   (IOPARF(3),2,2,K)
      IF (LRBIG.NE.0)        GO TO 69
      CALL LIFTBK (LRBIG,2,0,MMRBIG,7)
      IQ(LRBIG+1) = -7
      IQ(LRBIG+2) = IOPARF(3)
   69 IF (IOMODE(2).EQ.0)  IQ(LRBIG+1)=-7

   71 CALL DOSPGO
      IF (JPROPD.GE.4)       GO TO 43
      JANSW = 4
      RETURN

 9025 FORMAT (1X,I9,42X,'COLLECT GARBAGE,  GAPS BEF/AFT',3I6)
 9044 FORMAT (1X/1X,19(1H-),'  .END   PAM',I3,'  AFTER',I7,A4,
     F'DS TOTAL,   --  ',6A1)
      END
