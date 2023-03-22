CDECK  ID>, YPATCH.
      PROGRAM YPATCH

      PARAMETER      (NQFNAE=2, NQFNAD=1, NQFNAU=3)
      PARAMETER      (IQFSTR=19, NQFSTR=6,  IQFSYS=25, NQFSYS=8)
      COMMON /MQCF/  NQNAME,NQNAMD,NQNAMU, IQSTRU,NQSTRU, IQSYSB,NQSYSB
      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /MQCT/  IQTBIT,IQTVAL,LQTA,LQTB,LQTE,LQMTB,LQMTE,LQMTH
     +,              IQPART,NQFREE
      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QCN/   IQLS,IQID,IQNL,IQNS,IQND,IQFOUL
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QSTATE/QVERSN,NQINIT,NQSTAG(2),NQPHAS,NQERR,QDEBUG,NQDCUT
     +,              NQNEWB,NQAFTB,NQM99,NQLOWB,NQWCUT,NQLOCK,QSTDUM
     +,              NQAUGM(2),NQZIP(8),AQMEM(12)
                         INTEGER QDEBUG
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /QHEADP/IQHEAD(20),IQDATE,IQTIME,IQPAGE,NQPAGE(4)
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /ARRVRQ/MAFIL,MAPAT,MADEC,MAREAL,MAFLAT,MASKIP,MADEL
     +,              MACHEK,MADRVS,MADRVI,MAPRE,  MSELF
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTEXT/NCCVEC,MCCVEC(28),MCCSW(29),NCCDFI,MCCDF(24)
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
      COMMON /NAMES/ NAMEP(4),NAMEH(4),NAMED(4),NAMEOR(4),NAMACT(4)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON /SQK/   KQMAIN,KQT,KQR,KQJ,KQF,KQZ,KQH(4),KQS(8)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQT,LQR,LQJ,LQF,LQZ
     +,              LQH(4),LQS(6),   LQWM,LQWF,LQWZ,LQWSYS(6),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +, KADRV(9), LEXD,LEXH,LEXP,LPAM,LDECO, LADRV(14)
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEB(14),MEXDEC(6)
     +, NVINC(6),NVUTY(16),NVIMAT(6),NVACT(6),NVGARB(6),NVWARN(6)
     +, NVARRQ(6),NVARR(10),IDARRV(10),NVARRI(12),NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
     +,            ISPACE(160000),LAST
C--------------    END CDE                             --------------

      PARAMETER   (NCNAME=48)
      PARAMETER   (NFILES=13)
      CHARACTER    NAME(NFILES)*(NCNAME)


      DATA NAME/ 'PAM     .pam        11    1024       0      !FF!'
     +,          'ASM     .f          21      68       0      !FF!'
     +,          'READ    .cra         1       4       0      !FF!'
     +,          'PRINT   .lis         2      68       0      !FF!'
     +,          'ASMA    .s          22      68       0      !FF!'
     +,          'ASMD    .dat        23      68       0      !FF!'
     +,          'ASM2    .f          31      68       0      !FF!'
     +,          'ASMA2   .s          32      68       0      !FF!'
     +,          'ASMD2   .dat        33      68       0      !FF!'
     +,          'ASMX    .c          24      68       0      !FF!'
     +,          'ASMX2   .c          34      68       0      !FF!'
     +,          'ASMY    .y          25      68       0      !FF!'
     +,          'ASMY2   .y          35      68       0      !FF!' /
C-                _:.=+=.:_1_:.=+=.:_2_:.=+=.:_3_:.=+=.:_4_:.=+=.:


      CALL FLPARA (NFILES,NAME,
     +   'YPATCHY .')

      CALL PINIT
      NQUSED= 20

   21 CALL DOSPEC
      IF (JANSW.GE.5)        GO TO 31
      CALL DORUN
      GO TO 21

   31 CONTINUE
      CALL PEND
      END
