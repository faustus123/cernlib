CDECK  ID>, DORUN.
      SUBROUTINE DORUN

C-    CONTROL PROCESSING OF INDIVIDUAL PATCHES AND DECKS

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
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
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
      EQUIVALENCE(LPAST,LADRV(1)),  (LPCRA,LADRV(2)), (LDCRAB,LADRV(3))
     +,          (LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
     +,         (KACTEX,NVACT(4)), (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
     +,           (LCRP,NVUTY(3)),   (LCRH,NVUTY(4)),   (LCRD,NVUTY(5))
C--------------    END CDE                             -----------------  ------


      DATA  ICRA   /4HCRA*/


C--   BRANCH:  1 GARB.COLL DONE,  2 ROLL-IN COMPLETE,  3 START CRADLE
C--                                                    4 START PAM
      GO TO (75,54,11,12), JANSW

C-----             START OR RE-START CRADLE INPUT

   11 NVOPER(6)  = 0
      IQ(LPAM+1) = 0
      GO TO 91

C-------------     START NEW PAM-FILE      -----------------------------

   12 IF (IQ(LRPAM+1).LT.0)  GO TO 17
      IF  (JPROPD.EQ.0)      GO TO 18
C     IF (IABS(JPROPD).NE.2) CALL QFATAL                                DEBUG
      IF (JPROPD.GE.0)       GO TO 13

C--                FOR  JPROPD=-2 : DECODE CARD +PATCH IN PENDING RECORD

      JASK = MAFIL-1
      CALL ARRIVE
      IDARRV(7)= MCCPAR(JCCPP+1)
      IDARRV(8)= MCCPAR(JCCPP+2)                                        -A8M

C  13 WRITE (IQPRNT,9013) IDARRV(7)                                      A8M
   13 WRITE (IQPRNT,9013) IDARRV(7),IDARRV(8)                           -A8M
      NQUSED = NQUSED + 2
      GO TO 42

C--                FILE DE-SELECTED

   17 JASK = MAFIL
      CALL ARRIVE
      NDECKR = -IQ(LRPAM+1) - 2
      JANSW  = 3
      RETURN

C--                FILE ACCEPTED, PRINT TITLE

   18 WRITE (IQPRNT,9019)
      NVDEPL(1)= 7
      NSV   = NQUSED
      NQUSED= 0
      JASK  = MAFIL-1
      CALL ARRIVE
      NQUSED = NQUSED + NSV + 2
      WRITE (IQPRNT,9019)
      GO TO 42


C-------------     SPECIAL CONDITIONS      -----------------------------

C--                ROLL-IN NEEDED FOR NEW PATCH

   21 JANSW = 2
      RETURN

C--                GARBAGE COLLECTION NEEDED FOR NEW DECK

   22 JANSW = 1
      RETURN

C--                END OF INPUT,   RETURN=PNAME,  EOF, +PAM, +QUIT

   23 NVARR(10)  = 0
      IQ(LRBIG+1)= NDECKR

   24 JANSW= 3
      IF (NVARR(6).EQ.0)     RETURN
      JANSW= 4
      RETURN


C-------------     NEXT PATCH ?            -----------------------------

C--                LAST PATCH PROCESSING FINISHED

   30 CALL DOUREF (7)
      GO TO 36

   31 CALL SBIT1 (IQ(LEXP+1),1)                                         -MSK
C  31 IQ(LEXP+1)= IQ(LEXP+1) .OR. 1                                      MSKC

   34 JPROPD = 0
   36 LSV = LEXP
C-                           LQUSER(7) SUPPORTS 'PAST PAT'-STRUCTURE
      CALL QSHUNT (KADRV(8),0,7,0)
      IF (LEXH.EQ.0)                GO TO 42
      IF (JBIT(IQ(LSV+1),5) .NE.0)  GO TO 42                            -MSK
C     IF ((IQ(LSV+1).AND.16).NE.0)  GO TO 42                             MSKC
C-                           LQUSER(5) SUPPORTS GARBAGE-STRUCTURE
      CALL QSHUNT (LSV,-2,5,0)
      GO TO 42

   39 IF (MOPTIO(1).NE.0)    GO TO 34
      LEXP  = IQ(LEXP-1)
      LQSTA = LSTASV
      LQEND = LSTASV

C----              FIND NEXT PATCH-NAME

   41 JASK = MAPAT
      CALL ARRIVE
   42 IF (IABS(JPROPD)-2)    41,43,24

C--                CHECK EXIT FOR  +PAM, RETURN=PNAME.

   43 IF (NVOPER(6).NE.0)    GO TO 23
      IDARRV(3)= IDARRV(7)
      IDARRV(4)= IDARRV(8)                                              -A8M
   44 IF (IDARRV(3).EQ.IQ(LPAM+1))  NVOPER(6)=7
      IF (IDARRV(4).NE.IQ(LPAM+2))  NVOPER(6)=0                         -A8M

C--                CREATE + RE-LINK PAT-BANK

      NVUTY(6) = 7
      NVUTY(7) = 7
      LSTASV = LQSTA
      CALL CREAPD (IDARRV(3),1)
      N = NDECKR
      IF (JPROPD.LT.0) N=N+1
      CALL SBYT (N,IQ(LCRP+1),16,15)
      NVUSEB(3) = IQ(LCRP)
      LEXH = IQ(LCRP-2)


C--                CHECK PATCH USE-ENABLED, PARTIAL USE + NOT INHIB
C--                CHECK DE-SELECTION FOR IMITATION

      IF (JBIT(NVUSEB(3),5) .NE.0)   GO TO 49                           -MSK
      IF (NVUTY(7).EQ.0)             GO TO 39                           -MSK
      IF (JBIT(IQ(LCRP+1),4).EQ.0)   GO TO 34                           -MSK
      IF (JBIT(NVUSEB(3),10).EQ.0)   GO TO 34                           -MSK
   49 IF (JBIT(IQ(LCRP+1),2).NE.0)   GO TO 34                           -MSK

C     IF ((NVUSEB(3).AND.16).NE.0)   GO TO 49                            MSKC
C     IF (NVUTY(7).EQ.0)             GO TO 39                            MSKC
C     IF ((IQ(LCRP+1).AND.8).EQ.0)   GO TO 34                            MSKC
C     IF ((NVUSEB(3).AND.512).EQ.0)  GO TO 34                            MSKC
C  49 IF ((IQ(LCRP+1).AND.2).NE.0)   GO TO 34                            MSKC

C--                CHECK ROLL-IN NEEDED

      IF (LEXH.EQ.0)         GO TO 54
      IF (IQ(LEXH+1).LT.0)   GO TO 21
      IF (IQ(LEXH-1).NE.0)   GO TO 21

C--                DECODE  +PATCH,..., T=REP,COMP,ASL,DATA,X,Y, IF=...

   54 IF (JPROPD.GE.0)       GO TO 55
      JASK = MAREAL
      CALL ARRIVE
   55 MT = MCCPAR (JCCPT+1)
C     IF (IABS(JPROPD).EQ.1) CALL QFATAL                                DEBUG
      IF     (JBIT(MT,18).NE.0)  CALL SBIT1 (IQ(LEXP+1),5)              -MSK
C     IF ((MT.AND.131072).NE.0)  IQ(LEXP+1)=IQ(LEXP+1) .OR. 16           MSKC
      IDARRV(1)= IQBLAN
      IDARRV(2)= IQBLAN                                                 -A8M
      IF (JCCIFV.NE.0)       GO TO 31
      NVDEP(5) = 1
      IF (JBIT(MT,25).NE.0)  NVDEP(5)=5
      IF (JBIT(MT,24).NE.0)  NVDEP(5)=4
      IF (JBIT(MT,4) .NE.0)  NVDEP(5)=3                                 -MSK
      IF (JBIT(MT,1) .NE.0)  NVDEP(5)=2                                 -MSK
C     IF ((MT.AND.8) .NE.0)  NVDEP(5)=3                                  MSKC
C     IF ((MT.AND.1) .NE.0)  NVDEP(5)=2                                  MSKC
      IF     (JBIT(NVUSEB(3),18).NE.0)  NVDEPL(2)=40                    -MSK
C     IF ((NVUSEB(3).AND.131072).NE.0)  NVDEPL(2)=40                     MSKC
      NVDEP(7)= IDARRV(3)
      NVDEP(8)= IDARRV(4)                                               -A8M
      JPROPD = 1
      GO TO 74

C-------------     NEXT DECK ?             -----------------------------

C--                LAST DECK PROCESSING FINISHED

   61 IF (LEXD.EQ.0)         GO TO 71
   65 JPROPD= 0
C-                           LQUSER(5) SUPPORTS GARBAGE-STRUCTURE
   66 CALL QSHUNT (LEXH,-2,5,0)
      GO TO 72

C----              FIND NEXT DECK NAME

   71 JASK = MADEC
      CALL ARRIVE
   72 IF (IABS(JPROPD)-1)    71,73,30
   73 IDARRV(1)= IDARRV(7)
      IDARRV(2)= IDARRV(8)                                              -A8M
      NVDEP(7) = IDARRV(1)
      NVDEP(8) = IDARRV(2)                                              -A8M

C--                CHECK GARBAGE COLLECTION NEEDED

   74 NQRESV = LQTOL - LQWORK
      IF (NQRESV.GE.NVGARB(3))       GO TO 75
      IF (LQUSER(5)+NVGARB(5).NE.0)  GO TO 22
   75 NVGARB(1) = LQTOL - LQWORK

C--                FIND DEC-BANK, RELINK IF ANY

      NVUSEB(3) = IQ(LEXP)
      KADRV(2)  = 0
      KADRV(3)  = 0
      LEXH  = IQ(LEXP-2)
      IF (LEXH.EQ.0)         GO TO 79
      KADRV(2) = LEXH-3
C     LEXD = LQFIND   (IDARRV(1),1,LEXH-2,K)                             A8M
      LEXD = LQLONG (2,IDARRV(1),1,LEXH-2,K)                            -A8M
      IF (LEXD.EQ.0)         GO TO 79
      CALL QSHUNT (K,0,LEXH,-2)
      KADRV(3) = LEXD-3

C--                CHECK USE-INHIBIT

      CALL MXJOIN (NVUSEB(3),IQ(LEXD))
      NVUSEB(4)= IQ(LEXD)
      IF (JBIT(NVUSEB(4),5) .NE.0)  GO TO 81                            -MSK
C     IF ((NVUSEB(4).AND.16).NE.0)  GO TO 81                             MSKC
      GO TO 65

   79 IF (JBIT(NVUSEB(3),5) .EQ.0)  GO TO 71                            -MSK
C  79 IF ((NVUSEB(3).AND.16).EQ.0)  GO TO 71                             MSKC
      NVUSEB(4)= NVUSEB(3)
      LEXD = 0


C--                DECODE  +DECK,..., T=COMP,ASL,DATA,X,Y,JOIN, IF=...

   81 NVUSEB(8) = NVUSEB(4)
      CALL MXJOIN (NVUSEB(1),NVUSEB(8))
      NVUSEB(9) = 0
      NVDEPL(3) = 0
      NVDEPL(4) = 7
      KACTEX = 0
      LACTEX = 0
      LDECO  = 0
      IF (JPROPD.GE.0)       GO TO 85
      JASK = MAREAL
      CALL ARRIVE
   85 IF (JCCIFV.NE.0)       GO TO 61
      MT = MCCPAR(JCCPT+1)
      NVDEPL(4)= JBIT (MT,10)                                           -MSK
C     NVDEPL(4)= MT .AND. 512                                            MSKC
      NVDEP(6) = NVDEP(5)
      IF (JBIT(MT,25).NE.0)  NVDEP(6)=5
      IF (JBIT(MT,24).NE.0)  NVDEP(6)=4
      IF (JBIT(MT,4) .NE.0)  NVDEP(6)=3                                 -MSK
      IF (JBIT(MT,1) .NE.0)  NVDEP(6)=2                                 -MSK
      IF (JBIT(MT,3) .NE.0)  NVDEP(6)=1                                 -MSK
C     IF ((MT.AND.8) .NE.0)  NVDEP(6)=3                                  MSKC
C     IF ((MT.AND.1) .NE.0)  NVDEP(6)=2                                  MSKC
C     IF ((MT.AND.4) .NE.0)  NVDEP(6)=1                                  MSKC
      IF (LEXD.NE.0)         GO TO 94

C--                PROCESS DECK FOR LEXD=0  (AND P=CRA*,D=,D=CRA*)

   91 CALL DODECK
      IF (LEXD.EQ.0)         GO TO 72
      IQ(LEXH-2)= IQ(LEXD-1)
      IF (LEXD.NE.LDCRAB)    GO TO 72
      CALL DOASM
      LEXD = 0
      GO TO 72

C--                PROCESS DECK FOR  LEXD.NE.0

   94 CALL DODECK
      GO TO 66

C9013 FORMAT (49X,2HP=,A10/1X)                                           A10
C9013 FORMAT (49X,2HP=,A8/1X)                                            A8
C9013 FORMAT (49X,2HP=,2A6/1X)                                           A6
C9013 FORMAT (49X,2HP=,2A5/1X)                                           A5
 9013 FORMAT (49X,2HP=,2A4/1X)                                           A4
 9019 FORMAT (1X)
      END
