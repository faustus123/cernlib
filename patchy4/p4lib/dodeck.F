CDECK  ID>, DODECK.
      SUBROUTINE DODECK

C-    PROCESS DECK MATERIAL

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDARRV(1)), (IDP(1),IDARRV(3)), (IDF(1),IDARRV(5))
     +,          (LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
     +,         (KACTEX,NVACT(4)), (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LASM,NVDEP(2))



C---  ACTIVATION BITS  1 = SELECTED OR NOT INHIBITED
C-                     0 = NOT SELECTED OR INHIBITED
C-
C-             FORGN INHIB TRANS  SELF
C-         DIV     1     6    11    15
C-         MIX     2     7    12    16
C-         EXE     3     8    13    17
C-         LIST    4     9    14    18
C-         USE     5    10

      CALL UPKBYT (NVUSEB(4),1,NVUSEB(5),3,MPAK5(1))
      NVUSEB(10) = JBYT (NVUSEB(8),15,4)
      NVUSEB(11) = JBYT (NVUSEB(8), 6,4)
      IF (JBIT(NVUSEB(11),3).EQ.0)  CALL SBYT (0,NVUSEB(11),1,2)        -MSK
C     IF ((NVUSEB(11).AND.4).EQ.0)  NVUSEB(11)=NVUSEB(11).AND.8          MSKC

      IF (LACTEX.EQ.0)  CALL ACSORT
      IF (MODPAM.NE.0)  JCARD=1
      JANSW  = 0
      JPROPD = 0
      NDPLEV = 0
      NVDEP(1) = 0
      NVDEP(10)= 0
      NVDEPL(1)= 0
      MEXDEC(5)= 0

C------            SET PROCESSING MODES

   21 NVUSEB(10) = JBYTET (NVUSEB(10),NVUSEB(11),1,4)                   -MSK
C  21 NVUSEB(10) = NVUSEB(10) .AND. NVUSEB(11)                           MSKC
      CALL UPKBYT (NVUSEB(10),1,MEXDEC(1),4,0)

      NVUSEB(13) = MIN  (MOPTIO(6),MEXDEC(4))                           -MSK
      NVUSEB(9)  = MAX  (NVUSEB(9),NVUSEB(13))                          -MSK
C     NVUSEB(9)  = NVUSEB(9) .OR. (MOPTIO(6) .AND. MEXDEC(4))            MSKC

      NVUSEB(13) = 31 - NVUSEB(10)
      NVUSEB(14) = JBYTET (NVUSEB(13),NVUSEB(11),1,4)                   -MSK
C     NVUSEB(14) = NVUSEB(13) .AND. NVUSEB(11)                           MSKC

C--                SELECT ASM-FILE

      JASM = NVDEP(6)
      IF (MEXDEC(1).NE.0)  JASM=JASM+5
      LASM = IQ(LSASM-JASM)
      IF (IQ(LASM+5).NE.0)   GO TO 23
      MEXDEC(3) = 0
      CALL SBIT0 (NVUSEB(14),3)                                         -MSK
C     NVUSEB(14) = NVUSEB(14) .AND. 11                                   MSKC
      GO TO 24

   23 IQ(LSASM+1) = JASM
      IF (JBIT(IQ(LASM+12),13)  .EQ.0)  GO TO 24                        -MSK
C     IF ((IQ(LASM+12).AND.4096).EQ.0)  GO TO 24                         MSKC
      MEXDEC(2) = 1
      CALL SBIT0 (NVUSEB(14),2)                                         -MSK
C     NVUSEB(14) = NVUSEB(14) .AND. 13                                   MSKC

   24 IF (MEXDEC(3).NE.0)    GO TO 26
      MEXDEC(2) = 0
      CALL SBIT0 (NVUSEB(14),2)                                         -MSK
C     NVUSEB(14) = NVUSEB(14) .AND. 13                                   MSKC

C--                EXE/MIX/LIST MODE

   26 MEXDEC(6) = MEXDEC(2) + MEXDEC(3) - 1
      IF (MEXDEC(4).NE.0)    MEXDEC(6)=MEXDEC(6)+3

C--                PRINT DECK HEADER CARD

      MSELF  = MADRVS
      IF (MEXDEC(5).NE.0)    GO TO 52
      MDEPAR = 2
      IF (JCCBAD.NE.0)       GO TO 27
      IF (NVUSEB(9).EQ.0)    GO TO 28
      IF (NVOPER(3).NE.0)    GO TO 28
      MDEPAR = 4
   27 CALL DEPART

C--                DECIDE PROCESSING OF START OF DECK

   28 IF (MOPTIO(23).NE.0)   GO TO 29
      IF (MEXDEC(6).GE.0)    GO TO 52
      MSELF = MAFLAT
      IF (NVOPER(2).EQ.0)  MSELF=MACHEK
      GO TO 52

   29 MEXDEC(5) = 7
      GO TO 52


C-------------     DRIVE DECK MATERIAL          ------------------------

   40 JASK = MADEL
   41 CALL ARRIVE
      IF (JCARD.GT.JCWAIT)   CALL ACEXQ (-7)
   42 IF (JANSW.NE.0)        GO TO 82

C--                FOREIGN MATERIAL

      IF (JCCTYP.LE.0)       GO TO 44
      CALL DOMATF
      IF (JCCTYP.NE.0)       GO TO 42
   43 JASK = MASKIP
      GO TO 41

C--                CHECK DELETION

   44 IF (JCARD-JCWDEL)      40,52,45
   45 IF (JCCTYP.NE.0)       GO TO 58

C-------           PROCESS SELF-MATERIAL

   52 JASK = MSELF
      IF  (JASK.EQ.MAFLAT)   GO TO 41
      IF (JCARD.LT.JCWAIT)   GO TO 41
      CALL ACEXQ (0)
      IF (JCARD.GE.JCWDEL)   GO TO 41
      GO TO 40

   58 IF (NVUSEB(9).EQ.0)    GO TO 59
      MDEPAR = 4
      CALL DEPART
   59 IF (JCCTYP.LT.-2)      GO TO 71


C----              PROCESS  +SELF  OR  +SEQ

      NVUSEB(13) = MXCCIF
      JMISSW = JBIT(MCCPAR(JCCPT+1),16)
      IF (JCCTYP.EQ.-1)      GO TO 62

C--                HANDLE  +SELF, Z=..., T=PASS, IF=...

      IF (JCCIFV.NE.0)       GO TO 66
      IF (NCCPZ.EQ.0)        GO TO 61
      LTHISQ = LOCSEQ (MCCPAR(JCCPZ+1),KADRV(2),KADRV(3),0,7)
      IF (LTHISQ.NE.0)       GO TO 64
      CALL SBYTOR (NVUTY(16),NVUSEB(13),1,4)                            -MSK
C     NVUSEB(13) = NVUSEB(13) .OR. NVUTY(16)                             MSKC
   61 JCCTYP = -1
      GO TO 66


C--                HANDLE  +SEQ, Z=..., T=PASS, IF=...

   62 IF (JBIT(MCCPAR(JCCPT+1),4).NE.0)    GO TO 68                     -MSK
C  62 IF ((MCCPAR(JCCPT+1).AND.8).NE.0)    GO TO 68                      MSKC
      IF (JCCIFV.NE.0)       GO TO 66
      IF (NCCPZ.EQ.0)        GO TO 69

   63 LTHISQ = LOCSEQ (MCCPAR(JCCPZ+1),KADRV(2),KADRV(3),0,JMISSW)
      IF (LTHISQ.NE.0)       GO TO 64
      CALL SBYTOR (NVUTY(16),NVUSEB(13),1,4)                            -MSK
C     NVUSEB(13) = NVUSEB(13) .OR. NVUTY(16)                             MSKC
      GO TO 65

   64 CALL SBYTOR (IQ(LTHISQ),NVUSEB(13),1,4)                           -MSK
C  64 NVUSEB(13) = NVUSEB(13) .OR. IQ(LTHISQ)                            MSKC
      CALL ACPEEL (LTHISQ)

   65 JCCPZ = JCCPZ + 3
      NCCPZ = NCCPZ - 1
      IF (NCCPZ.NE.0)        GO TO 63

   66 IF (MOPTIO(12).EQ.0)   GO TO 67
      NVUSEB(13) = JBYTET (NVUSEB(13),NVUSEB(14),1,4)                   -MSK
C     NVUSEB(13) = NVUSEB(13) .AND. NVUSEB(14)                           MSKC
      IF (NVUSEB(13).EQ.0)   GO TO 67
      MDEPAR = 11
      CALL DEPART
   67 IF (JCCTYP.EQ.-1)      GO TO 52
      GO TO 43

C--                HANDLE  +SEQ, Z=..., T=DUMMY, IF=...

   68 IF (MEXDEC(5).EQ.0)    GO TO 52
      IF (JCCIFV.NE.0)       GO TO 685
  682 IF (NCCPZ.EQ.0)        GO TO 685

      LTHISQ = LOCSEQ (MCCPAR(JCCPZ+1),KADRV(2),KADRV(3),0,7)
      IF (LTHISQ.NE.0)       GO TO 683
      CALL SBYTOR (NVUTY(16),NVUSEB(13),1,4)                            -MSK
C     NVUSEB(13) = NVUSEB(13) .OR. NVUTY(16)                             MSKC
      GO TO 684

  683 IF (JBIT(IQ(LTHISQ),5).NE.0)  CALL ACXREF (LTHISQ,NVUSEB(13))
      CALL SBYTOR (IQ(LTHISQ),NVUSEB(13),1,4)                           -MSK
C     NVUSEB(13) = NVUSEB(13) .OR. IQ(LTHISQ)                            MSKC

  684 JCCPZ = JCCPZ + 3
      NCCPZ = NCCPZ - 1
      GO TO 682

  685 IF (JBYTET (NVUSEB(13),NVUSEB(14),1,4) .EQ.0)  GO TO 52           -MSK
C 685 IF ((NVUSEB(13).AND.NVUSEB(14))        .EQ.0)  GO TO 52            MSKC

      CALL SBYTOR (NVUSEB(13),NVUSEB(10),1,4)                           -MSK
C     NVUSEB(10) = NVUSEB(10) .OR. NVUSEB(13)                            MSKC
      GO TO 21

C--                FAULTY CARD  +SEQ.

   69 MDEPAR = 2
      CALL DEPART
      GO TO 66

C----     +IMITATE, +SUSPEND, +FORCE, +USE, +LIST, +EXE, +MIX, +DIVERT

   71 IF (JCCIFV.NE.0)       GO TO 52
      IF (JCCTYP-MCCASM)     75,74,72
   72 IF (JCCTYP.LE.MCCOPT)  GO TO 73
      CALL DOUSE
      GO TO 52

C--                HANDLE  +WARN, +ONLY, +PARA, +OPTION

   73 CALL DOOPT
      GO TO 52

C--                HANDLE  +ASM

   74 CALL DOASM
      GO TO 52

C--                HANDLE  +EOD

   75 IF (JCCTYP.EQ.MCCEOD)  GO TO 82

C--                IGNORE  +PAM, +QUIT  ON PAM-FILE

      GO TO 52

C-------------     END OF DECK                  ------------------------

   82 NQRESV = LQTOL - LQWORK
      NDIFFG = NVGARB(1) - NQRESV
      NVGARB(2) = MAX  (NVGARB(2),NDIFFG)
      IF (JCWAIT.NE.LARGE)   CALL DOUREF (0)
      IF (NVDEP(1).EQ.0)     GO TO 84
      IQ(LASM+2) = IQ(LASM+2) + NVDEP(1)
      IF (MOPTIO(13).EQ.0)   GO TO 84
      IF (NQUSED.GE.NQLMAX)  CALL DPPAGE
      WRITE (IQPRNT,9083) NDECKR,IDD,IDP,NVDEP(1),IQ(LASM+4)
      NQUSED = NQUSED + 1
   84 IF (NVDEPL(1).NE.0)  NVDEPL(2)=NVDEPL(1)
      IF (MOPTIO(2).EQ.0)          RETURN
      IF (16*NDIFFG.LT.NVGARB(3))  RETURN
      NQUSED = NQUSED + 1
      WRITE (IQPRNT,9084) NDECKR,NVGARB(1),NQRESV,NDIFFG
      RETURN

 9083 FORMAT (1X,I9,3H D=,2A4,  3H P=,2A4,  I6,' LINES TO  ASM',A2)      A4
C9083 FORMAT (1X,I9,3H D=,A5,A3,3H P=,A5,A3,I6,' LINES TO  ASM',A2)      A5
C9083 FORMAT (1X,I9,3H D=,A6,A2,3H P=,A6,A2,I6,' LINES TO  ASM',A2)      A6
C9083 FORMAT (1X,I9,3H D=,A8,   3H P=,A8,   I6,' LINES TO  ASM',A2)      A8M
 9084 FORMAT (1X,I9,60X,'GAPS BEF/AFT',3I6)
      END
