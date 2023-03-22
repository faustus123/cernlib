CDECK  ID>, DPLIST.
      SUBROUTINE DPLIST

C-    +LIST OUTPUT FOR A BUNCH OF CARDS, CALLED FROM DEPART
C-                 NEEDS  LDPMAT, NVDEP(12-13)

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
C--------------    END CDE                             -----------------  ------
      DIMENSION    NUMVAL(9)
      EQUIVALENCE (NUMVAL(1),IQNUM(2))
      DIMENSION    MMNUM(5),MMBCD(5),MARK(3),LTAILS(3),LTAILX(9)
      EQUIVALENCE (MMNUM(1),KNUM(1))
      EQUIVALENCE (MMBCD(1),LEAD(5)),(MARK(1),LEAD(10))
      EQUIVALENCE (MDEC,LTAIL(1)),(LTAILP,LTAIL(7)),(LTAILD,LTAIL(16))
     +,           (LTAILS(1),LTAIL(25)),(LTAILZ,LTAIL(28))
      EQUIVALENCE (LTAILX(1),LTAIL(1)), (KIMATL,KIMAPS(1))              -A6
C     EQUIVALENCE (LTAILX(3),LTAIL(1)), (KIMATL,KIMA(14))                A6
      DIMENSION    KIMAX(23),KIMAV(32)                                   A4
C     DIMENSION    KIMAX(18),KIMAV(25)                                   A5
C     DIMENSION    KIMAX(16),KIMAV(22)                                   A6
C     DIMENSION    KIMAX(11),KIMAV(16)                                   A8
C     DIMENSION    KIMAX(9), KIMAV(13)                                   A10
      EQUIVALENCE (KIMAX(1), KIMAV(1),  KIMAPR(1))


      CALL DPPAGE
      LTK   = LDPMAT
      NCD   = NVDEP(12)
      NVDEPL(1)= NVDEPL(1) + NCD

C--                READY CARD-COUNT FOR FIRST CARD

      MARK(2) = JDPMKT(1)
      MARK(1) = JDPMKT(2)
      CALL SETNUM (NVDEP(13),MMNUM(1),MMBCD(1))
C     CALL UBUNCH (LEAD(3),KIMAPR(1),10)                                A5,A10
C     CALL UBUNCH (LEAD(5),KIMAPR(1),8)                                 A8
      CALL UBUNCH (LEAD(1),KIMAPR(1),12)                                A4,A6
      MARK(2) = JDPMK(1)
      MARK(1) = JDPMK(2)
      IF (IDDEPP(1).EQ.0)    GO TO 31

C-------           WRITE FIRST CARD WITH TAIL

      IF (LDPMAT.NE.0)       CALL KDFILL (IQ(LTK))
      IF (JDECKN.EQ.JDEC)    GO TO 24
      JDEC = JDECKN
      CALL SETNUM (JDEC,KDEC(1),MDEC)
   24 CALL UBLOW (IDDEPP(1),LTAILP,8)
      CALL UBLOW (IDDEPD(1),LTAILD,8)
      LTAILS(1)= MMLEV
      LTAILS(2)= MMACT
      IF (IDDEPZ(1).EQ.0)    GO TO 25
      CALL UBLOW (IDDEPZ(1),LTAILZ,8)
      NCH = 35
      NW  = 32                                                           A4
C     NW  = 25                                                           A5
C     NW  = 22                                                           A6
C     NW  = 16                                                           A8
C     NW  = 13                                                           A10
      GO TO 26

   25 NCH = 26
      NW  = 30                                                           A4
C     NW  = 24                                                           A5
C     NW  = 20                                                           A6
C     NW  = 15                                                           A8
C     NW  = 12                                                           A10
   26 CONTINUE
C     CALL UBLOW (KIMA(14),LTAILX(1),2)                                  A6
C     NCH = NCH + 2                                                      A6
      CALL UBUNCH (LTAILX(1),KIMATL,NCH)
      GO TO 48


C-----             WRITE FIRST CARD WITHOUT TAIL

   31 IF (LDPMAT.NE.0)       GO TO 47
      WRITE (IQPRNT,9001) KIMAX
      NQUSED= NQUSED + 1
      RETURN

C-------           WRITE FURTHER CARDS

   42 N = MMNUM(5) + 1
      IF (N.EQ.10)           GO TO 51
      MMNUM(5)= N
      MMBCD(5)= NUMVAL(N)
C  44 CALL UBUNCH (LEAD(3),KIMAPR(1),10)                                A5,A10
C  44 CALL UBUNCH (LEAD(5),KIMAPR(1),8)                                 A8
   44 CALL UBUNCH (LEAD(1),KIMAPR(1),12)                                A4,A6
      IF (NQUSED.GE.NQLNOR)   CALL DPPAGE
   47 CALL KDCOPY (IQ(LTK))
      NW = NWTK + 3                                                      A4
C     NW = NWTK + 2                                                      A5,A6
C     NW = NWTK + 1                                                      A8M
   48 NQUSED= NQUSED + 1
      CALL XOUTCF (IQPRNT,KIMAV(1),NW)
      NCD = NCD - 1
      IF (NCD.NE.0)          GO TO 42
      RETURN

C--                CARD COUNT CARRY

   51 MMNUM(5)= 0
      MMBCD(5)= IQNUM(1)
      N = MMNUM(4) + 1
      IF (N.EQ.10)           GO TO 52
      MMNUM(4)= N
      MMBCD(4)= NUMVAL(N)
      GO TO 44

   52 JS = 4
   53 MMNUM(JS)= 0
      MMBCD(JS)= IQNUM(1)
      JS = JS - 1
      N  = MMNUM(JS) + 1
      IF (JS.EQ.1)           GO TO 54                                   -A8
C     IF (JS.EQ.2)           GO TO 54                                    A8
      IF (N.EQ.10)           GO TO 53
   54 MMNUM(JS)= N
      MMBCD(JS)= NUMVAL(N)
      GO TO 44

 9001 FORMAT (32A4)                                                      A4
C9001 FORMAT (25A5)                                                      A5
C9001 FORMAT (22A6)                                                      A6
C9001 FORMAT (16A8)                                                      A8
C9001 FORMAT (13A10)                                                     A10
      END
