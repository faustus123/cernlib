CDECK  ID>, CRDECO.
      SUBROUTINE CRDECO

C--   CREATE ORIGIN DECK BANK ODEC

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
     +, NVARRQ(6),NVARR(10),IDARRV(10),NVARRI(12),NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------


      CALL LIFTBK (LDECO,0,0,NAMEOR(1),7)
      IQ(LDECO-1) = LEXP
      IQ(LDECO+1) = IDARRV(1)
      IQ(LDECO+2) = IDARRV(2)                                           -A8M
C     IQ(LDECO)   = IQ(LDECO) .OR. NDECKR                                MSKC
      CALL SBYT (NDECKR,IQ(LDECO),1,15)                                 -MSK
      RETURN
      END
