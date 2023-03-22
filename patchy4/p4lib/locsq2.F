CDECK  ID>, LOCSQ2.
      SUBROUTINE LOCSQ2 (KPAR)

C-    SLAVE TO LOCSEQ

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
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (L,NVUTY(13)), (KSQLOC,NVUTY(14))


C     DATA  LOCID  /2/                                                   B60M
      DATA  LOCID  /3/                                                  -B60M


      K = KPAR
      KNIL = 0
   11 CONTINUE
C     L = LQFIND   (NVUTY(11),LOCID,K,KSQLOC)                            A8M
      L = LQLONG (2,NVUTY(11),LOCID,K,KSQLOC)                           -A8M
      IF (NVUTY(15).EQ.0)    RETURN
      IF (L.EQ.0)            RETURN
      IF (NVUTY(16).NE.0)    GO TO 21
   14 IF (JBIT(IQ(L),10) .NE.0)  GO TO 31                               -MSK
C  14 IF ((IQ(L).AND.512).NE.0)  GO TO 31                                MSKC
      RETURN

C--                NEW SEQ AFTER NIL-SEQ, DE-LINK & TRANSMIT EXE-BITS

   21 CALL SBYTOR (NVUTY(16),IQ(L),1,4)                                 -MSK
C  21 IQ(L) = IQ(L) .OR. (NVUTY(16).AND.15)                              MSKC
      NVUTY(16)= 0
      IF (KNIL.EQ.0)         GO TO 14
      IF (KSQLOC.EQ.K)  KSQLOC=KNIL
C-                           LQUSER(5) SUPPORTS GARBAGE-STRUCTURE
      CALL QSHUNT (KNIL,0,5,0)
      NVUTY(15)= NVUTY(15) - 1
      KNIL  = 0
      GO TO 14

C--                NIL-SEQ FOUND, SAVE EXE-BITS, FIND NEXT SEQ

   31 NVUTY(16)= IQ(L)
      KNIL= KSQLOC
      K   = L-1
      GO TO 11
      END
