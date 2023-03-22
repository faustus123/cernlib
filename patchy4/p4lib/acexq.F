CDECK  ID>, ACEXQ.
      SUBROUTINE ACEXQ (IPARAP)

C-    HANDLE ACTIONS ON MATERIAL CURRENTLY ARRIVING
C-                 PARAMETER  -VE  STEP OVER BANKS LEFT BEHIND
C-                              0  ACTION INTO SELF-MATERIAL
C-                            +VE  ACTION INTO FOREIGN MATERIAL

      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
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
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE                  (KACTEX,NVACT(4))
     +,                            (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (KJOIN,NVIMAT(3))



      IPARAM= IPARAP
   11 JCLA  = 4*JBYT (NVACT(3),7,3)                                     -MSK
C  11 JCLA  = NVACT(3) .AND. 448                                         MSKC
      IF (NVACT(2).GE.4)     GO TO 17
      JCWDEL= MAX  (JCWDEL,IQCC(LACTEX+1)+1)
   17 IF (IPARAM.EQ.0)       GO TO 41

C-----             STEP OVER BANKS LEFT BEHIND

   21 IF (JCLA+MEXDEC(6).LT.2)   GO TO 43
      IF (JCLA+NVUSEB(9).EQ.0)   GO TO 43
      IF (IPARAM.GE.0)           GO TO 42
      IF (JCCPRE.NE.0)           GO TO 42
      CALL SBIT1 (IQ(LACTEX),11)                                        -MSK
C     IQ(LACTEX)= IQ(LACTEX) .OR. 1024                                   MSKC
      GO TO 42
   25 IF (JCARD.GT.JCWAIT)   GO TO 11
      RETURN


C-----             EXQ ACTION ON SELF-MATERIAL

   41 IF (JCLA.EQ.0)         GO TO 44
   42 LDPACT= LACTEX
      MDEPAR= 1
      CALL DEPART
   43 IF (IPARAM)            47,44,64

   44 IF (JBIT(NVACT(3),5).NE.0)   GO TO 47                             -MSK
C  44 IF ((NVACT(3).AND.16).NE.0)  GO TO 47                              MSKC
      CALL ACPEEL (LACTEX)
      GO TO 47

C--                READY NEXT ACTION FOR EXECUTION

   47 KACTEX= LACTEX - 1
   48 LACTEX= IQ(KACTEX)
      IF (LACTEX.EQ.0)       GO TO 49
      NVACT(3)= JBYT (IQ(LACTEX),7,12)
      NVACT(2)= JBYT (NVACT(3),1,4)                                     -MSK
C     NVACT(2)= NVACT(3) .AND. 15                                        MSKC
      NVACT(1)= JBYT (NVACT(3),1,3)                                     -MSK
C     NVACT(1)= NVACT(3) .AND. 7                                         MSKC
      JCWAIT  = IQCC(LACTEX)
      IF (IPARAM.LT.0)       GO TO 25
      IF (JCARD.LT.JCWDEL)   RETURN
      IF (JCARD.LT.JCWAIT)   RETURN
      GO TO 11

   49 JCWAIT= LARGE
      RETURN

C-----             JOIN HIGH ACTION INTO LEVEL 1 ACTION

   64 IF (JBIT(NVACT(3),5).NE.0)   GO TO 47                             -MSK
C  64 IF ((NVACT(3).AND.16).NE.0)  GO TO 47                              MSKC
      IQ(KACTEX)= IQ(LACTEX-1)
      IQ(KJOIN) = LACTEX
      KJOIN     = LACTEX - 1
      IQ(KJOIN) = 0
      CALL SBYTOR (IQ(LACTEX),NVIMAT(4),1,5)                            -MSK
C     NVIMAT(4) = NVIMAT(4) .OR. IQ(LACTEX)                              MSKC
      NVIMAT(6) = NVIMAT(6) + JBYT (IQ(LACTEX+1),1,15)
      GO TO 48
      END
