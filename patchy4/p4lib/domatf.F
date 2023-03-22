CDECK  ID>, DOMATF.
      SUBROUTINE DOMATF

C-    READ FOREIGN MATERIAL INTO MEMORY
C-    ( INDIRECT OR I- MATERIAL IS AN OLD NAME FOR 'FOREIGN' MATERIAL )
C-    CALLED FROM DODECK FOR   +KEEP,  +DELETE,  +REPLACE,  +ADBEF, +ADD

      PARAMETER      (NQFNAE=2, NQFNAD=1, NQFNAU=3)
      PARAMETER      (IQFSTR=19, NQFSTR=6,  IQFSYS=25, NQFSYS=8)
      COMMON /MQCF/  NQNAME,NQNAMD,NQNAMU, IQSTRU,NQSTRU, IQSYSB,NQSYSB
      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /ARRVRQ/MAFIL,MAPAT,MADEC,MAREAL,MAFLAT,MASKIP,MADEL
     +,              MACHEK,MADRVS,MADRVI,MAPRE,  MSELF
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /NAMES/ NAMEP(4),NAMEH(4),NAMED(4),NAMEOR(4),NAMACT(4)
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
     +, NVDEP(14),LDPMAT,JDPMAT,LDPACT,JDPACT,NDPLEV,MDEPAR, NVDEPL(6)
     +, MWK(80),MWKX(80)
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE                  (KACTEX,NVACT(4))
     +,                            (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
     +,         (INCSEQ,NVINC(1)), (INCACT,NVINC(2)), (INCMAT,NVINC(3))
     +,           (LCRP,NVUTY(3)),   (LCRH,NVUTY(4)),   (LCRD,NVUTY(5))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (KJOIN,NVIMAT(3))
      EQUIVALENCE (JNILTH,NVUTY(10))
      DIMENSION    JDESCR(4)
      DIMENSION    NAMCSQ(5), NAMMAT(4)


C     DATA  NAMCSQ /4HCSQ ,3,1,2,7/                                      A8M
      DATA  NAMCSQ /4HCSQ ,3,1,3,8/                                     -A8M
      DATA  NAMMAT /4HMAT ,1,1,2H**/
C     DATA  MMACT  /4HACT /, MMSEQ/4HKEEP/                               DEBUG


C----       JDESCR (1)  WORDS OF VOLUME
C--                (2)  NO. OF WORDS OF MATERIAL
C--                (3)  NO. OF CARDS OF MATERIAL
C--                (4)  CARD COUNT ORIGIN

      MXCD1 = 0

C-------           CONSTRUCT EXE-BITS  NVIMAT(5)

C-----             DELETED ACTION MATERIAL

      IF (JCARD.GT.JCWDEL)   GO TO 7
      NVIMAT(5)= 0
      CALL MXACTD (-1)
      LDELOR= IQ(LACDEL-3)
      IF (JCCPIF.EQ.0)       GO TO 6
      NVIMAT(5)= JBYTET (MXCCIF,NVIMAT(5),1,4)                          -MSK
C     NVIMAT(5)= NVIMAT(5) .AND. MXCCIF                                  MSKC
      GO TO 6

C--                READY FOR NIL-ACTION, IF OTHER THAN GLOBAL BITS

    5 NVIMAT(5)= MXCCIF
    6 JNILTH = 8
      IF (MXNEW(NVIMAT(5),NVUSEB(2)).NE.0)  GO TO 11
      JNILTH = -7
      GO TO 11

C-----             NON-DELETED ACTION MATERIAL

    7 LDELOR = 0
      IF (JCCIFV.NE.0)       GO TO 5
      NVIMAT(5)= NVUSEB(4)
      IF (LADRV(10).NE.0)    CALL MXACTN (-1)
      IF (MXCCIF.NE.0)  CALL SBYTOR (MXCCIF,NVIMAT(5),1,4)              -MSK
C     NVIMAT(5)= NVIMAT(5) .OR. MXCCIF                                   MSKC
      JNILTH= 0

C-------           READY MEMORY TO RECEIVE ACTION MATERIAL

   11 JSTAT = JCCTYP + JNILTH
      IF (JCCPIF.NE.0)       JSTAT=JSTAT+32
      IF (LDECO.EQ.0)        CALL CRDECO
      JDESCR(3) = 0
      JDESCR(4) = JCARD

   14 LHEAD = 0
      LHOLD = 0
      NVIMAT(4)= 0
      NVIMAT(6)= 0
      IF (JCCTYP.NE.1)       GO TO 31


C-----             READY HEADER BANK  'KEEP'  FOR
C--                +KEEP, SNAME, P=PNAME, D=DNAME, T=NOLIST, DUMMY

      IF (JNILTH.LT.0)       GO TO 25
      IF (JBIT(MCCPAR(JCCPT+1),4).NE.0)     GO TO 29                    -MSK
C     IF ((MCCPAR(JCCPT+1).AND.8).NE.0)     GO TO 29                     MSKC
      JLOW = -1
      KP   = 0
      KD   = 0
      LCRH = 0
      IF (JCCPP.EQ.0)        GO TO 24
      JLOW = 0
      CALL CREAPD (MCCPAR(JCCPP+1),MCCPAR(JCCPD+1))
      KP   = LCRH-3
      KD   = MAX  (0,LCRD-3)
   24 L = LOCSEQ (MCCPAR(JCCPZ+1),KP,KD,0,7)
      IF (L.NE.0)            GO TO 27

      IF (NVUTY(16).NE.0)  CALL SBYTOR (NVUTY(16),NVIMAT(5),1,4)        -MSK
C     NVIMAT(5) = NVIMAT(5) .OR. NVUTY(16)                               MSKC
      KJOIN     = NVUTY(14)
   25 IF (NVUSEB(9).EQ.0)    GO TO 26
      NVUTY(9) = 0
      MDEPAR = 4
      CALL DEPART

   26 IF (JNILTH.LT.0)       GO TO 97
      LSTAT = LQWORK + NQNAME + NAMACT(2)
      INCC  = INCSEQ
      LARMAT= LSTAT + INCC
C     NAMACT(1) = MMSEQ                                                  DEBUG
      IQCC(LSTAT)  = MCCPAR(JCCPZ+1)
      IQCC(LSTAT+1)= MCCPAR(JCCPZ+2)                                    -A8M
      IF (JNILTH.NE.0)       GO TO 91
      IF (JCCPT.EQ.0)        GO TO 50
      IF (JBIT(MCCPAR(JCCPT+1),14)  .EQ.0)  GO TO 50                    -MSK
C     IF ((MCCPAR(JCCPT+1).AND.8192).EQ.0)  GO TO 50                     MSKC
      JSTAT = JSTAT + 512
      GO TO 50

C--                OVER-RULED DECK-DIRECTED SEQUENCE

   27 IF (JBIT(MCCPAR(JCCPT+1),1).NE.0)  GO TO 291                      -MSK
C  27 IF ((MCCPAR(JCCPT+1).AND.1).NE.0)  GO TO 291                       MSKC
      IF (KD.EQ.0)           GO TO 29
      NVIMAT(4) = IQ(L)
      IF (JNILTH.EQ.0)       GO TO 28
      NVIMAT(4) = JBYTET (NVIMAT(4),NVIMAT(5),1,4)                      -MSK
C     NVIMAT(4) = NVIMAT(4) .AND. NVIMAT(5)                              MSKC
   28 NVIMAT(4) = MXNEW (NVIMAT(4),IQ(LCRD))
      CALL SBYTOR (NVIMAT(4),IQ(LCRD),15,4)
   29 JNILTH = -7
      GO TO 25


C--                +KEEP, ..., T=APPEND.

  291 IF (JBIT(IQ(L),17).EQ.0)     GO TO 292
      MCCPAR(JCCPT+1) = 0
      GO TO 27

  292 CALL SBIT1 (IQ(L),17)
      LHEAD = L
      KJOIN = L-2
      NVIMAT(4) = JRSBYT (0,IQ(L),1,6)
      NVIMAT(6) = JBYT (IQ(L+1),1,15)

      IF (NVUSEB(9).EQ.0)    GO TO 294
      NVUTY(9) = 0
      MDEPAR   = 4
      CALL DEPART

  294 LSTAT  = LQWORK + NQNAME + NAMACT(2)
      INCC   = INCACT
      LARMAT = LSTAT + INCC
      JSTAT  = 5
      IQCC(LSTAT)   = 0
      IQCC(LSTAT+1) = 0

  297 IF (IQ(KJOIN).EQ.0)    GO TO 50
      KJOIN = IQ(KJOIN) - 1
      GO TO 297


C-----             READY HEADER BANK 'ACT' FOR
C--                +DEL, +REPL, +ADB, +ADD

   31 IF (NCCPC.EQ.0)        GO TO 88
      JLOW = 0
      LAST = NVIMAT(2)
      IF (JCCPP.NE.0)        GO TO 33
      LCRP = NVIMAT(1)
      LCRD = NVIMAT(2)
      IF (LCRP.EQ.0)         GO TO 88
      IF (JCCPD.EQ.0)        GO TO 35

   33 JCCPD = MAX  (JCCPD,1)
      CALL CREAPD (MCCPAR(JCCPP+1),MCCPAR(JCCPD+1))
      IF (LCRD.EQ.LEXD)      GO TO 88
      NVIMAT(1)= LCRP
      NVIMAT(2)= LCRD
   35 KJOIN = LCRD - 2
      LCRH  = IQ(LCRP-2)

      IF (NVUSEB(9).EQ.0)    GO TO 36
      NVUTY(9) = LAST - LCRD
      MDEPAR = 4
      CALL DEPART

   36 IF (JNILTH.LT.0)       GO TO 97
      LSTAT = LQWORK + NQNAME + NAMACT(2)
      INCC  = INCACT
      LARMAT= LSTAT + INCC
C     NAMACT(1) = MMACT                                                 DEBUG
      IQCC(LSTAT)  = MCCPAR(JCCPC+1)
      IQCC(LSTAT+1)= MCCPAR(JCCPC+2)
      IF (JNILTH.NE.0)       GO TO 92
      IF (JCCTYP.EQ.2)       GO TO 94
      IF (NCCPZ.EQ.0)        GO TO 50

C--                DEAL WITH OLD FORM  +REP,..., Z=ZNAME

      LMATSV = LARMAT
      LSEQ   = 0
      JCCTYP = -1
      GO TO 61


C-------           DRIVE ACTION MATERIAL TO MEMORY

   50 JCCTYP = 0
   51 LMATSV = LARMAT
   52 IF (JCARD.GE.JCWAIT)   GO TO 54
      JASK = MADRVI
      CALL ARRIVE
      IF (LARMAT.GE.LQTOL)   CALL NOMEM
      JDESCR(3) = JDESCR(3) + NCARR
      IF (JCCTYP)            58,54,61

C----              JCARD HAS REACHED JCWAIT
C--                IN CASE OF PENDING +DELETE  (REAL OR NIL)
C--                CHECK NEXT CARD PART OF CURRENT ACTION MATERIAL

   54 IF (NVACT(1).NE.2)     GO TO 60
      IF (JCCPRE.NE.0)       GO TO 60
      JASK = MAPRE
      CALL ARRIVE
      GO TO 61

C--                +SEQ SEEN, TRY DIRECT SUBSTITUTION

   58 IF (JCCTYP.NE.-1)      GO TO 61
C     NVIMAT(5) = NVIMAT(5) .OR. MXCCIF                                  MSKC
      IF (MXCCIF.NE.0)       CALL SBYTOR (MXCCIF,NVIMAT(5),1,4)         -MSK
      IF (JCCIFV.NE.0)       GO TO 61
      LSEQ = -7
      IF (NCCPZ.NE.1)                    GO TO 61
      LSEQ = LOCSEQ (MCCPAR(JCCPZ+1),0,0,0,7)
      IF (LSEQ.EQ.0)                     GO TO 61
      IF (JBIT(IQ(LSEQ),6) .EQ.0)        GO TO 61                       -MSK
C     IF ((IQ(LSEQ).AND.32).EQ.0)        GO TO 61                        MSKC
      IF (JBIT(MCCPAR(JCCPT+1),4).NE.0)  GO TO 61                       -MSK
C     IF ((MCCPAR(JCCPT+1).AND.8).NE.0)  GO TO 61                        MSKC

      N = JBYT(IQ(LSEQ+1),16,15)
      CALL UCOPY (IQMSQ(LSEQ),IQ(LARMAT),N)
      LARMAT = LARMAT + N
      JDESCR(3) = JDESCR(3) + 1
      CALL SBYTOR (IQ(LSEQ),NVIMAT(5),1,4)                              -MSK
C     NVIMAT(5) = NVIMAT(5) .OR. IQ(LSEQ)                                MSKC
      JCCTYP = 0
      IF (NVUSEB(9).EQ.0)    GO TO 52
      MDEPAR = 4
      CALL DEPART
      GO TO 52


C-----             END OF DATA, CLOSE CURRENT BANK

   60 CONTINUE
   61 JDESCR(1) = LARMAT - LQWORK
      JDESCR(2) = LARMAT - LMATSV
      NAMACT(4) = LARMAT - (LSTAT+1)
      IF (LHOLD.NE.0)        GO TO 63

C--                CLOSE HEADER BANK 'ACT' OR 'KEEP'

      CALL LIFTBK (LSTAT,KJOIN,0,NAMACT,JLOW)
      LHOLD = LSTAT
      KJOIN = LHOLD - 2
      IF (LHEAD.EQ.0)  LHEAD=LHOLD
      IQ(LSTAT-3) = LDECO
      IF (JDESCR(3).EQ.1)  MXCD1=32
      IF (NVARR(6) .NE.0)  JSTAT=JSTAT+2048
      CALL SBYT (JSTAT,IQ(LHOLD),7,12)
      GO TO 65

C--                CLOSE MAT-BANK

   63 IF (JDESCR(3).EQ.0)    GO TO 67
      NAMMAT(4) = NAMACT(4)
      CALL LIFTBK (LSTAT,KJOIN,0,NAMMAT,JLOW)
      KJOIN = LSTAT - 1
   65 NVIMAT(6)= NVIMAT(6) + JDESCR(1)
      CALL PKBYT (JDESCR(1),IQ(LSTAT+1),1,4,MPAK15(1))

C--                BRANCH:   JCCTYP = 0  STOP BY JCWAIT
C--                                  -1  +SEQ
C--                                ELSE  END OF I-MATERIAL

   67 IF (JCCTYP)            68,76,81
   68 IF (JCCTYP.NE.-1)      GO TO 81
      IF (JCCPRE.EQ.0)       GO TO 70
      JCCPRE= 0
      IF (NVACT(2).EQ.2)     GO TO 76
      CALL ACEXQ (7)
      LSEQ = -7


C-----             HANDLE  +SEQ, Z=S1,S2,..., T=PASS.

   70 IF (NVUSEB(9).EQ.0)    GO TO 71
      MDEPAR = 4
      CALL DEPART

   71 IF (NCCPZ.EQ.0)        GO TO 751
      IF (JCCIFV.NE.0)       GO TO 79
      JSTAT = 7
      CALL CBYT (MCCPAR(JCCPT+1),16,JSTAT,7,1)
      CALL CBYT (MCCPAR(JCCPT+1), 4,JSTAT,8,1)
      JLOWA = IABS(JLOW)
      IF (LSEQ.GE.0)         GO TO 73

   72 LSEQ = LOCSEQ (MCCPAR(JCCPZ+1),0,0,0,7)
   73 CALL LIFTBK (LSTAT,KJOIN,0,NAMCSQ,JLOWA)
      KJOIN = LSTAT - 1
      IQ(LSTAT-3)= LDECO
      CALL SBYT (JSTAT,IQ(LSTAT),7,9)
      IQ(LSTAT+1)= JCARD
      IQ(LSTAT+2)= MCCPAR(JCCPZ+1)
      IQ(LSTAT+3)= MCCPAR(JCCPZ+2)                                      -A8M
      IF (LSEQ.EQ.0)         GO TO 74
      IQ(LSTAT-2)= LSEQ
      CALL SBYTOR (IQ(LSEQ),NVIMAT(4),1,5)                              -MSK
C     NVIMAT(4)= NVIMAT(4) .OR. IQ(LSEQ)                                 MSKC
      IF (JBYT(IQ(LSEQ),13,3).EQ.0)   GO TO 75
      J = MAX  (JCCPD,JCCPN)
      IQ(LSTAT+2)= MCCPAR(J+1)
      IQ(LSTAT+3)= MCCPAR(J+2)                                          -A8M
      GO TO 75

   74 CALL SBIT1 (NVIMAT(4),5)                                          -MSK
C  74 NVIMAT(4)= NVIMAT(4) .OR. 16                                       MSKC
   75 NVIMAT(6)= NVIMAT(6) + NAMCSQ(5)
      NCCPZ = NCCPZ - 1
      IF (NCCPZ.EQ.0)        GO TO 79
      JCCPZ = JCCPZ + 3
      GO TO 72

C--                CARD +SEQ WITHOUT SEQ-NAMES

  751 IF (JBIT(MCCPAR(JCCPT+1),4).NE.0)  GO TO 79                       -MSK
C 751 IF ((MCCPAR(JCCPT+1).AND.8).NE.0)  GO TO 79                        MSKC
      MDEPAR = 2
      CALL DEPART
      GO TO 79


C-----             ATTACH HIGHER LEVEL ACTION

   76 CALL ACEXQ (7)
      IF (JCARD.GE.JCWDEL)   GO TO 79

C--                SKIP DELETED I-MATERIAL

   77 JSV  = JCARD + 2
      JASK = MADEL
      CALL ARRIVE
      IF (JCARD.GT.JCWAIT)   CALL ACEXQ (-7)
      IF (JCCTYP.NE.0)       GO TO 80
      IF (JCARD.GE.JSV)  CALL MXACTD (-1)
      IF (JCARD.LT.JCWDEL)   GO TO 77

C-----             READY MAT-BANK FOR CONTINUATION MATERIAL

   79 LSTAT = LQWORK + NQNAME + NAMMAT(2)
      LARMAT= LSTAT + INCMAT
      INCC  = INCMAT
      JDESCR(3) = 0
      JDESCR(4) = JCARD
      GO TO 50

C----              END OF I-MAT FOR THIS ACTION OR SEQUENCE

   80 IF (JCARD.GT.JSV)  CALL MXACTD (-2)
   81 IF (IQ(LHEAD-2).NE.0)  MXCD1=0
      CALL SBYTOR  (NVIMAT(4),MXCD1,1,5)                                -MSK
      CALL SBYTOR  (NVIMAT(5),MXCD1,1,4)                                -MSK
      CALL SBYT (MXCD1,IQ(LHEAD),1,6)                                   -MSK
C     NVIMAT(4)= NVIMAT(4) .AND. 31                                      MSKC
C     NVIMAT(5)= NVIMAT(5) .AND. 15                                      MSKC
C     IQ(LHEAD)= IQ(LHEAD) .OR. NVIMAT(5) .OR. NVIMAT(4) .OR. MXCD1      MSKC
      CALL SBYT (NVIMAT(6),IQ(LHEAD+1),1,15)
      IF (LCRH.NE.0)  IQ(LCRH+1)=IQ(LCRH+1) + NVIMAT(6)
C     IF (NVIMAT(6).LT.0)    CALL QFATAL                                 DEBUG
      IF (JCCPRE.EQ.0)       RETURN
      CALL ACEXQ (-7)
      JCCPRE= 0
      RETURN

C-----             FAULTY CARD

   88 MDEPAR = 2
      CALL DEPART
      GO TO 98

C-----             ACTION CARD DELETED, CREATE NIL-BANK

   91 NVUTY(15)= NVUTY(15) + 1
   92 NAMACT(3)= 1

C--                CLOSE ACTION-BANK FOR NIL-ACTION  OR  +DELETE

   94 JDESCR(1) = LARMAT - LQWORK
      JDESCR(2) = 0
      NAMACT(4) = LARMAT - (LSTAT+1)
      CALL LIFTBK (LSTAT,KJOIN,0,NAMACT,0)
      IQ(LSTAT-3) = LDECO
      CALL SBYTOR (NVIMAT(5),IQ(LSTAT),1,4)                             -MSK
C     IQ(LSTAT)= IQ(LSTAT) .OR. (NVIMAT(5).AND.15)                       MSKC
      CALL SBYT (JSTAT,IQ(LSTAT),7,9)
      IF (NVARR(6).NE.0)  CALL SBIT1 (IQ(LSTAT),18)
      CALL PKBYT (JDESCR(1),IQ(LSTAT+1),1,4,MPAK15(1))
      IF (LCRH.NE.0)  IQ(LCRH+1)=IQ(LCRH+1) + JDESCR(1)
      IF (NAMACT(3).NE.2)    GO TO 96

C--                REPEAT FOR MULTI-C +DELETE

      NCCPC = NCCPC - 1
      IF (NCCPC.EQ.0)        GO TO 98
      JCCPC = JCCPC + 3
      JCCPP = 0
      JCCPD = 0
      GO TO 14

C--                NIL ACTION BANK

   96 NAMACT(3) = 2
      IQ(LSTAT-2) = LDELOR

C----              IGNORE REMAINING I-MATERIAL

   97 CONTINUE
   98 JCCTYP= 0
      RETURN
      END
