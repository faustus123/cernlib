CDECK  ID>, LOCSEQ.
      FUNCTION LOCSEQ (IDPAR,KP,KD,LINK,IFLAG)

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
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (L,NVUTY(13)), (KSQLOC,NVUTY(14))
      DIMENSION    IDPAR(9)


      NVUTY(11) = IDPAR(1)
      NVUTY(12) = IDPAR(2)                                              -A8M
      NVUTY(16) = 0
      IF (IFLAG.LT.0)        GO TO 21

C--                GLOBAL SET - IF IFLAG +VE OR 0

      CALL LOCSQ2 (KADRV(1))
      IF (L.EQ.0)            GO TO 21
      IF (LINK.NE.0)  IQ(LINK-2)=L
      IQ(KSQLOC)= IQ(L-1)
      IQ(L-1)   = LQUSER(6)
      LQUSER(6) = L
      KSQLOC= 6
   19 LOCSEQ= L
      RETURN

C--                PATCH-DIRECTED SET - IF KP NOT ZERO

   21 IF (KP.EQ.0)           GO TO 24
      CALL LOCSQ2 (KP)
      IF (L.NE.0)            GO TO 27

C--                DECK-DIRECTED SET - IF KD NOT ZERO

   24 IF (KD.EQ.0)           GO TO 31
      CALL LOCSQ2 (KD)
      IF (L.EQ.0)            GO TO 31
   27 IF (LINK.EQ.0)         GO TO 19
      IQ(LINK-2)= -L
      GO TO 19

C--                MISSING SEQUENCE - PRINT IF IFLAG = 0

   31 IF (IFLAG.NE.0)        GO TO 19
      NVWARN(2) = NVWARN(2) + 1
      IF (NVWARN(2).GE.61)   GO TO 19
      LDPACT= LINK
      MDEPAR= 3
      CALL DEPART
      LOCSEQ = 0
      RETURN
      END
