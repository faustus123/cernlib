CDECK  ID>, DEPID.
      SUBROUTINE DEPID

C-    SET UP TAIL-WORDS FOR LIST & MIX OUTPUT ACCORDING TO ACTION LDPACT
C-    IT NEEDS:  NDPLEV, LDPACT, JDPACT, JDPMAT

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
      COMMON /DPWORK/JDPMKT(2),JDPMK(2),JDECKN,MMLEV,MMACT, LEAD(14)
     +,              MTAIL(36),LTAIL(36), IDDEPP(2),IDDEPD(2),IDDEPZ(2)
     +,              JNUMM,KNUMM(5), JDEC,KDEC(5), JNUM,KNUM(5)
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
      DIMENSION    NUMVAL(9)
      EQUIVALENCE (NUMVAL(1),IQNUM(2))
      DIMENSION    MKV(8)


      DATA  MKV    / 1H/,1HZ,1HD,1HR,1HB,1HA,1H-,1HZ /


C-------           HANDLE 'KEEP' BANK

      IF (JDPACT.NE.1)       GO TO 41
      IF (JDPMAT.NE.1)       GO TO 26
      IF (JBIT(IQ(LDPACT),16).NE.0)  GO TO 91
      IDDEPZ(1)= IQCC(LDPACT)
      IDDEPZ(2)= IQCC(LDPACT+1)                                         -A8M
      IF (NDPLEV.NE.1)       GO TO 44
      JDPMKT(1)= IQBLAN
      JDPMKT(2)= IQDOT
      JDPMK(1) = IQBLAN
      JDPMK(2) = IQBLAN
      GO TO 46

C--                HANDLE SEQ CALL BANK

   26 IF (JDPMAT.EQ.0)       GO TO 41
      NVDEP(13)= IQ(LDPACT+1)
      IDDEPZ(1)= IQ(LDPACT+2)
      IDDEPZ(2)= IQ(LDPACT+3)                                           -A8M
      GO TO 44

C-------           HANDLE ACTION BANKS

   41 IDDEPZ(1)= 0
   44 JDPMKT(1)= MKV(JDPMAT+1)
      JDPMKT(2)= JDPMKT(1)
      JDPMK(1) = IQPLUS
      JDPMK(2) = IQPLUS
   46 J = MAX (NDPLEV,1)
      MMLEV = NUMVAL(J)
      MMACT = MKV(JDPACT+1)

      L = IQ(LDPACT-3)
      JDECKN = JBYT (IQ(L),1,15)                                        -MSK
C     JDECKN = IQ(L) .AND. 32767                                         MSKC
      IDDEPD(1)= IQ(L+1)
      IDDEPD(2)= IQ(L+2)                                                -A8M
      L = IQ(L-1)
      IDDEPP(1)= IQ(L+2)
      IDDEPP(2)= IQ(L+3)                                                -A8M
      RETURN

C--                SUPPRESS LIST OUTPUT

   91 IDDEPP(1)= 0
      RETURN
      END
