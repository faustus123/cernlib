CDECK  ID>, DOUSE.
      SUBROUTINE DOUSE

C-    PROC. +IMITATE, +SUSPEND, +FORCE, +USE, +LIST, +EXE, +MIX, +DIV

      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
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
     +, NVARRQ(6),NVARR(10),IDARRV(10),NVARRI(12),NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
      EQUIVALENCE(LPAST,LADRV(1)),  (LPCRA,LADRV(2)), (LDCRAB,LADRV(3))
     +,           (LCRP,NVUTY(3)),   (LCRH,NVUTY(4)),   (LCRD,NVUTY(5))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (NFOR,IQUEST(1)),(NSUS,IQUEST(2)),(JVAL,IQUEST(3))
     +,             (MX,IQUEST(11))

C--   ACTION MATRIX     JVAL NSUSP NFORCE  NFNSVL(J)
C-    (1) SUSPEND / ON     0     1      1     = 3
C-    (2) FORCE   / ON     1     1      1     = 7
C-    (3) SUSPEND / OFF    1     1      0     = 6
C-    (4) FORCE   / OFF    0     0      1     = 1

      DIMENSION    NFNSVL(4)


      DATA  NFNSVL / 3, 7, 6, 1/


      J = JCCTYP - MCCUSE
      IF (J.EQ.-3)           GO TO 71
      CALL UPKBYT (MCCPAR(JCCPT+1),1,IQUEST(1),21,0)

C-                  9 INHIB, 20 TRANS, 15 ONLY/OFF
C-                 21 DIV, 22 MIX, 23 EXE, 24 LIST, 25 USE
C-                            18 REPEAT

      IQUEST(25)= IQUEST(21)
      IQUEST(24)= IQUEST(12)
      IQUEST(23)= IQUEST(5)
      IQUEST(22)= IQUEST(13)
      IQUEST(21)= IQUEST(4)
      IQUEST(25-J) = 1
      CALL PKBYT (IQUEST(21),MX,1,5,0)
      IF (J.LT.0)            GO TO 74

C--                PROPAGATION PERMISSION FILTER,  ACTION BRANCH

      IF (NVARR(6).NE.0)     GO TO 21
      MX = JBYTET (NVUSEB(5),MX,1,5)                                    -MSK
C     MX = MX .AND. NVUSEB(5)                                            MSKC
   21 IF (JCCPD.NE.0)        GO TO 51
      IF (JCCPP.NE.0)        GO TO 41

C---------         PROCESS GLOBAL ACTIVATION

      IF (IQUEST(9)+IQUEST(25).EQ.2)    GO TO 91
      IF (NVARR(6).EQ.0)                GO TO 91
      CALL MXSET (0,NVUSEB(2))
      L = LEXP
   33 CALL MXJOIN (NVUSEB(2),IQ(L))
      CALL DOUPD (L)
      L = IQ(L-1)
      IF (L.NE.0)            GO TO 33
      RETURN

C---------         PROCESS PATCH ACTIVATION

   41 CONTINUE
   44 CALL CREAPD (MCCPAR(JCCPP+1),1)
      CALL MXSET (NVUSEB(7),IQ(LCRP))
      IF (IQUEST(18).NE.0)  CALL SBIT1 (IQ(LCRP+1),5)                   -MSK
C     IF (IQUEST(18).NE.0)  IQ(LCRP+1)=IQ(LCRP+1) .OR. 16                MSKC
      IF (IQUEST(25).EQ.0)         GO TO 47
      IF (IQUEST(9) .NE.0)         GO TO 46
      IF (JBIT(IQ(LCRP),5) .EQ.0)  GO TO 47                             -MSK
C     IF ((IQ(LCRP).AND.16).EQ.0)  GO TO 47                              MSKC
   46 IQ(LCRP-3)=LEXP
   47 CALL DOUPD (LCRP)
      NCCPP = NCCPP - 1
      IF (NCCPP.EQ.0)        RETURN
      JCCPP = JCCPP + 3
      GO TO 44

C---------         PROCESS DECK ACTIVATION

   51 IF (NCCPP.NE.1)        GO TO 91
   54 CALL CREAPD (MCCPAR(JCCPP+1),MCCPAR(JCCPD+1))
      CALL MXSET (NVUSEB(7),IQ(LCRD))
      IF (LCRD.EQ.LEXD)      CALL DOUPD(0)
      NCCPD = NCCPD - 1
      JCCPD = JCCPD + 3
      IF (NCCPD.NE.0)        GO TO 54
      IF (IQUEST(9).NE.0)    RETURN
      IF   (MX.LT.16)        RETURN
      CALL SBIT1 (IQ(LCRP+1),4)                                         -MSK
C     IQ(LCRP+1) = IQ(LCRP+1) .OR. 8                                     MSKC
      IF (IQ(LCRP-3).EQ.0)  IQ(LCRP-3)=LEXP
      RETURN

C----------        PROCESS  +IMITATE, P=...

   71 IF (NCCPD.NE.0)        GO TO 91
   72 IF (NCCPP.EQ.0)        RETURN
      CALL CREAPD (MCCPAR(JCCPP+1),1)
      IF (JBIT(IQ(LCRP),10).EQ.0)  GO TO 73                             -MSK
      CALL SBIT1 (IQ(LCRP),5)                                           -MSK
      CALL SBIT1 (IQ(LCRP+1),2)                                         -MSK

C     IF ((IQ(LCRP).AND.512).EQ.0) GO TO 73                              MSKC
C     IQ(LCRP)  = IQ(LCRP)   .OR. 16                                     MSKC
C     IQ(LCRP+1)= IQ(LCRP+1) .OR. 2                                      MSKC
   73 NCCPP = NCCPP - 1
      JCCPP = JCCPP + 3
      GO TO 72

C-------           +SUSPEND, (OFF,) LIST, EXE, MIX, DIVERT
C--                +FORCE,   (OFF,) LIST, EXE, MIX, DIVERT

   74 IF (NVARR(6).EQ.0)     GO TO 91
      JJ = (J+3) + 2*IQUEST(15)
      CALL UPKBYT (NFNSVL(JJ),1,NFOR,3,0)

      DO 79 J=1,4
      IF (IQUEST(J+20).EQ.0) GO TO 79
      IF (NFOR.NE.0)  CALL SBIT (JVAL,NVUSEB(1),J+14)
      IF (NSUS.NE.0)  CALL SBIT (JVAL,NVUSEB(1),J+5)
   79 CONTINUE
      RETURN

C-----             FAULTY CARD

   91 MDEPAR = 2
      CALL DEPART
      RETURN
      END
