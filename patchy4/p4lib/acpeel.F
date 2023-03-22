CDECK  ID>, ACPEEL.
      SUBROUTINE ACPEEL (LPARAM)

C--   PEEL-OFF ACTION DATA-STRUCTURE TO DEPART

      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
     +, NVDEP(14),LDPMAT,JDPMAT,LDPACT,JDPACT,NDPLEV,MDEPAR, NVDEPL(6)
     +, MWK(80),MWKX(80)
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE                  (INCSEQ,NVINC(1))
     +,                            (INCACT,NVINC(2)), (INCMAT,NVINC(3))
C--------------    END CDE                             -----------------  ------
      DIMENSION    LSAVE(36)
      EQUIVALENCE (LSAVE(1),MWK(1))



C----              HEADER BANK 'KEEP'

      LX = LPARAM
      JDPMAT = JBYT (IQ(LX),7,3)
      IF (JDPMAT.NE.1)              GO TO 32
      IF (JBYT(IQ(LX),13,3).NE.0)   GO TO 28
   24 NDPLEV   = 1
      LSAVE(1) = LX
      LDPACT   = LX
      JDPACT   = 1
      NVDEP(14)= INCSEQ
      GO TO 47

   28 CALL ACSEQ (LX,0)
      IF (LX.NE.0)           GO TO 24
      RETURN

C-----             ATTACK NEXT BANK

   31 JDPMAT = JBYT (IQ(LX),7,3)
      IF (JDPMAT.EQ.0)       GO TO 41

C--                HIGHER LEVEL

   32 JDPACT = JDPMAT
      LDPACT = LX
      NDPLEV = NDPLEV + 1
      IF (NDPLEV.GE.81)      GO TO 91
      LSAVE(NDPLEV) = LX
      IF (JDPACT.NE.7)       GO TO 42

C--                SEQUENCE CALL

      IF (JBIT(IQ(LX),14)  .NE.0)  GO TO 61                             -MSK
C     IF ((IQ(LX).AND.8192).NE.0)  GO TO 61                              MSKC

      JDPACT = 1
      LDPACT = IQ(LX-2)
      IF (LDPACT.LE.0)                  GO TO 36
      IF (JBYT(IQ(LDPACT),13,3) .EQ.0)  GO TO 37                        -MSK
C     IF ((IQ(LDPACT).AND.28672).EQ.0)  GO TO 37                         MSKC
      CALL ACSEQ (LDPACT,LX)
      IF (LDPACT.EQ.0)       GO TO 61
      GO TO 38

   36 JMISSW = JBIT (IQ(LX),13)                                         -MSK
C  36 JMISSW = IQ(LX) .AND. 4096                                         MSKC
      LDPACT = LOCSEQ (IQ(LX+2),KADRV(2),KADRV(3),LX,JMISSW)
      IF (LDPACT.EQ.0)       GO TO 64

   37 CALL SBYTOR (IQ(LDPACT),NVUSEB(13),1,4)                           -MSK
C  37 NVUSEB(13) = NVUSEB(13) .OR. IQ(LDPACT)                            MSKC
   38 NVDEP(14)  = INCSEQ
      JDPMAT = 1
      LX     = LDPACT
      GO TO 47

C--                DEPARTURE

   41 NVDEP(14)= INCMAT
      GO TO 47

   42 NVDEP(14)= INCACT
   47 LDPMAT   = LX
      MDEPAR   = -1
      CALL DEPART

C-----             WHAT NEXT ?

   51 IF (JDPMAT.NE.0)       GO TO 54
   52 LX = IQ(LX-1)
      IF (LX.NE.0)           GO TO 31
      GO TO 61

C--                NOT MAT BANK, CHECK STILL HIGHER LEVEL

   54 IF (JBIT(IQ(LX),10).NE.0)     GO TO 61
      LX = IQ(LX-2)
      IF (LX.NE.0)           GO TO 31

C--                GO 1 LEVEL BACKWARDS

   61 NDPLEV = NDPLEV - 1
      IF (NDPLEV.EQ.0)       RETURN
      LDPACT= LSAVE(NDPLEV+1)
      LX    = IQ(LDPACT-1)
      IF (LX.EQ.0)           GO TO 61
      LDPACT= LSAVE (NDPLEV)
      JDPACT= JBYT(IQ(LDPACT),7,3)
      IF (JDPACT.NE.7)       GO TO 31
      LDPACT= IABS (IQ(LDPACT-2))
      JDPACT= 1
      GO TO 31

   64 CALL SBYTOR (NVUTY(16),NVUSEB(13),1,4)                            -MSK
C  64 NVUSEB(13) = NVUSEB(13) .OR. NVUTY(16)                             MSKC
      GO TO 61

C----              ACTION LEVEL TOO HIGH

   91 NVDEPL(5) = 8
      CALL DPPAGE
      WRITE (IQPRNT,9091) JCARD
      CALL PABEND

 9091 FORMAT (1X/' ***  FAULT AT C=',I5/
     F' ***  ACTION LEVEL 81 REACHED, MAYBE SEQUENCE CALL LOOP.')
      END
