CDECK  ID>, ACXREF.
      SUBROUTINE ACXREF (LPARAM,MXLOCL)

C-    CHECK THRU ACTION DATA-STRUCTURE TO FILL X-REFERENCES FROM
C-    SEQ-CALL-BANKS TO KEEP-BANKS AND TO COLLECT THE EXE-BITS
C-    BITS FROM GLOBAL SEQUENCES ARE JOINED INTO STATUS OF HEADER
C-    BITS FROM LOCAL  SEQUENCES ARE JOINED INTO SECOND PARAMETER
C-    (MODIFIED COPY OF ACPEEL)
C-    CALLED FROM ACSORT FOR 1 PARTICULAR LEVEL 1 ACTION BANK 'LPARAM'

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
C--------------    END CDE                             -----------------  ------
      DIMENSION    LSAVE(36), MXCUM(2), LPARAM(9), MXLOCL(9)
      EQUIVALENCE (LSAVE(1),MWK(1))



C--                HEADER BANK

      LX  = LPARAM(1)
      LGO = LX

      MXCUM(1) = IQ(LX)
      MXCUM(2) = 0
      JCUM   = 1
      MXUNS  = 0
      NDPLEV = 0

C-----             ATTACK NEXT BANK

   31 JDPMAT = JBYT (IQ(LX),7,3)
      IF (JDPMAT.EQ.0)       GO TO 52

C--                HIGHER LEVEL

      NDPLEV = NDPLEV + 1
      IF (NDPLEV.GE.81)      GO TO 81
      LSAVE(NDPLEV) = LX
      IF (JDPMAT.NE.7)       GO TO 54

C--                SEQUENCE CALL

      LDPACT= IQ(LX-2)
      IF (LDPACT.GT.0)       GO TO 37
      LDPACT = LOCSEQ (IQ(LX+2),KADRV(2),KADRV(3),LX,7)
      IF (IQ(LX-2).GT.0)     GO TO 37
      MXUNS = 16
      IF (LDPACT.EQ.0)       GO TO 64
      JCUM = 2

   37 CALL SBYTOR (IQ(LDPACT),MXCUM(JCUM),1,4)                          -MSK
C  37 MXCUM(JCUM) = MXCUM(JCUM) .OR. IQ(LDPACT)                          MSKC

      IF (JBIT(IQ(LDPACT),5) .EQ.0)    GO TO 61                         -MSK
C     IF ((IQ(LDPACT).AND.16).EQ.0)    GO TO 61                          MSKC
      LX = LDPACT
      GO TO 54

C-----             WHAT NEXT ?

   52 LX = IQ(LX-1)
      IF (LX.NE.0)           GO TO 31
      GO TO 61

C--                NOT MAT BANK, CHECK STILL HIGHER LEVEL

   54 IF (JBIT(IQ(LX),10).NE.0)     GO TO 61
      LX = IQ(LX-2)
      IF (LX.NE.0)           GO TO 31

C--                GO 1 LEVEL BACKWARDS

   61 NDPLEV = NDPLEV - 1
      IF (NDPLEV.EQ.0)       GO TO 81
      LDPACT= LSAVE(NDPLEV+1)
      LX    = IQ(LDPACT-1)
      IF (LX.EQ.0)           GO TO 61
      GO TO 31

   64 CALL SBYTOR (NVUTY(16),MXCUM(2),1,4)                              -MSK
C  64 MXCUM(2) = MXCUM(2) .OR. NVUTY(16)                                 MSKC
      GO TO 61

C--                MERGE EXE-BITS COLLECTED FROM KEEP-BANKS

   81 MXCUM(1) = MXUNS +  JBYT(MXCUM(1),1,4)                            -MSK
C  81 MXCUM(1) = MXUNS + (MXCUM(1).AND.15)                               MSKC
      CALL SBYT   (MXCUM(1),IQ(LGO),1,5)
      CALL SBYTOR (MXCUM(2),MXLOCL(1),1,4)
      NDPLEV = 0
      RETURN
      END
