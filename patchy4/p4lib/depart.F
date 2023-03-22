CDECK  ID>, DEPART.
      SUBROUTINE DEPART

C-    MAIN DEPARTURE CONTROL ROUTINE

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRVRQ/MAFIL,MAPAT,MADEC,MAREAL,MAFLAT,MASKIP,MADEL
     +,              MACHEK,MADRVS,MADRVI,MAPRE,  MSELF
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
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
     +, JASK,JCWAIT,JCWDEL,LARMAT,LAREND,NCARR
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(11),LINBUF,NVCCP(10)
     +, NVDEP(14),LDPMAT,JDPMAT,LDPACT,JDPACT,NDPLEV,MDEPAR, NVDEPL(6)
     +, MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------
C     EQUIVALENCE (LEADCC,LEAD(3))                                      A5,A10
C     EQUIVALENCE (LEADCC,LEAD(5))                                      A8
      EQUIVALENCE (LEADCC,LEAD(1))                                      A4,A6

      DIMENSION    LOSTV(4)


      DATA  LOSTV  /4HDIV ,4HMIX ,4HEXE ,4HLIST/


   10 IF   (MDEPAR)          21,11,31


C------------      SELF MATERIAL                       -----------------

   11 IF (MEXDEC(5).NE.0)    GO TO 19
      IF (MEXDEC(6))         18,17,12
   12 JDPMKT(1)= IQMINS
      JDPMKT(2)= IQBLAN
      JDPMK(1) = IQMINS
      JDPMK(2) = IQBLAN
      IDDEPP(1)= 0

C----              +LIST FOR NORMAL SELF

      IF (MEXDEC(4).EQ.0)    GO TO 14
      CALL DPLIST
      IF (MEXDEC(3).EQ.0)    RETURN
      IF (MEXDEC(2).EQ.0)    GO TO 17

C----              +MIX FOR NORMAL SELF

   14 IF (NVDEP(14).NE.0)    GO TO 15
      IDDEPD(1)= IDARRV(1)
      IDDEPD(2)= IDARRV(2)                                              -A8M
      IDDEPP(1)= IDARRV(3)
      IDDEPP(2)= IDARRV(4)                                              -A8M
      IDDEPZ(1)= 0
      JDPMKT(2)= IQMINS
   15 CALL DPMIX
      RETURN

C----              +EXE FOR NORMAL SELF

   17 CALL DPEXE
   18 RETURN

C----              DECK DEMANDS ASM FILE NOW

   19 MEXDEC(5) = 0
      IF (MEXDEC(6).GE.0)    GO TO 10
      MSELF = MAFLAT
      IF (NVOPER(2).EQ.0) MSELF=MACHEK
      IF (MDEPAR.EQ.0)     JASK=MSELF
      RETURN

C------------      FOREIGN MATERIAL FROM THIS DECK     -----------------

   20 JDPMKT(1)= IQDOT
      JDPMKT(2)= IQBLAN
      JDPMK(1) = IQDOT
      JDPMK(2) = IQBLAN
      IDDEPP(1)= 0
      CALL DPLIST
      RETURN


C------------      FOREIGN MATERIAL INTO THIS DECK     -----------------

   21 IF (MDEPAR.NE.-1)      GO TO 20
      CALL UPKBYT (IQ(LDPMAT+1),2,NVDEP(11),3,MPAK15(1))
      IF (NVDEP(12).EQ.0)    GO TO 29
      IF (MEXDEC(5).NE.0)    GO TO 19
C     IF (JBIT(IQ(LDPMAT),11).NE.0)   CALL QFATAL                       DEBUG
      LDPMAT = LDPMAT + NVDEP(14)
      IF (MEXDEC(6))         28,27,22
   22 CALL DEPID

C----              +LIST  FOR NORMAL FOREIGN

      IF (MEXDEC(4).EQ.0)    GO TO 24
      IF (IDDEPP(1).EQ.0)    GO TO 23
      NVDEPL(5)= NVDEP(12)
      CALL DPLIST
   23 IF (MEXDEC(3).EQ.0)    RETURN
      IF (MEXDEC(2).EQ.0)    GO TO 27

C----              +MIX  FOR NORMAL FOREIGN

   24 CONTINUE
      CALL DPMIX
      RETURN

C----              +EXE  FOR NORMAL FOREIGN

   27 CALL DPEXE
   28 RETURN

C-----             ZERO-CARD INDIRECT MATERIAL

   29 IF (MEXDEC(4).EQ.0)    RETURN
      GO TO 53


C------------      SPECIAL LISTING                     -----------------

   31 IF (MDEPAR-5)          32,45,46
   32 IF (MDEPAR-3)          41,42,44

C--                MDEPAR=1, ACTION ON THIS DECK, CLASH-WARNING IF ANY
   41 IF (MDEPAR.EQ.1)       GO TO 51

C--                MDEPAR=2, FAULTY CONTROL CARD
      CALL DPPAGE
      NVWARN(1)= NVWARN(1) + 1
      J = JCARD-1
      WRITE (IQPRNT,9042) NVWARN(1),J
      NQUSED= NQUSED + 1
      GO TO 44

C--                MDEPAR=3,    MISSING SEQUENCE
   42 IF (LDPACT.NE.0)          GO TO 53
      IF (NVDEPL(3).EQ.JCARD)   GO TO 43
      JDPACT= 0
      CALL DEPMSG
      NVDEPL(5)= 1
      CALL DPLIST
   43 JDPACT= 1
      GO TO 57

C--                MDEPAR=4, LIST LAST CONTROL-CARD
   44 IF (NVDEPL(3).EQ.JCARD)   RETURN
      LDPACT= 0
      JDPACT= 0
      GO TO 57

C--                MDEPAR=5, LIST PAM TITLE
   45 JDPMKT(1)= IQLETT(20)
      JDPMKT(2)= IQBLAN
      JDPMK(1) = IQLETT(20)
      JDPMK(2) = IQBLAN
      IDDEPP(1)= 0
      GO TO 58

C--                MDEPAR=6, LIST U/REF AT LDPACT

   46 IF (MDEPAR.NE.6)       GO TO 60


C----              OUTPUT FOR SPECIAL LIST

   51 JDPACT= JBYT (IQ(LDPACT),7,3)
      JDPMAT= JDPACT
   52 CALL UPKBYT (IQ(LDPACT+1),2,NVDEP(11),3,MPAK15(1))
   53 IF (LDPACT.EQ.NVDEP(10))  RETURN
      NVDEP(10)= LDPACT
      CALL DEPID
      IF (IDDEPP(1).EQ.0)    RETURN
   57 CALL DEPMSG
   58 CALL DPLIST
      LEADCC = IQBLAN
      RETURN

C------------      STRAIGHT MESSAGE PRINTING           -----------------

C--                PRINT LOST ACTIVATION WARNING

   60 IF (NVWARN(3).GE.61)   RETURN

      NVDEPL(5) = -2
      CALL DPPAGE

      J = JCARD - 1

      DO 63 JJ=1,4
      IF (JBIT(NVUSEB(13),JJ).EQ.0)  GO TO 63
      NVWARN(3) = NVWARN(3) + 1
      WRITE (IQPRNT,9063) NVWARN(3),LOSTV(JJ),J
      CALL SBIT0 (NVUSEB(14),JJ)
      NQUSED = NQUSED + 1
   63 CONTINUE
      GO TO 44

 9042 FORMAT (1X,40(1H*),I5,'*   FAULTY CONTROL CARD   C=',I5)
 9063 FORMAT (1X,40(1H*),I5,'*   LOST +',A4,' ACTIVATION FOR  C=',I5)
      END
