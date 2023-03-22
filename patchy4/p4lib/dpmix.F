CDECK  ID>, DPMIX.
      SUBROUTINE DPMIX

C-    +MIX  OUTPUT FOR A BUNCH OF CARDS, CALLED FROM DEPART
C-                 NEEDS  LDPMAT, NVDEP(12-13)

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
      COMMON /DPWORK/JDPMKT(2),JDPMK(2),JDECKN,MMLEV,MMACT, LEAD(14)
     +,              MTAIL(36),LTAIL(36), IDDEPP(2),IDDEPD(2),IDDEPZ(2)
     +,              JNUMM,KNUMM(5), JDEC,KDEC(5), JNUM,KNUM(5)
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
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
      EQUIVALENCE (LASM,NVDEP(2)), (LUNASM,NVDEP(3))

      DIMENSION    MMNUM(5),MMBCD(5),MTAILX(9)
      EQUIVALENCE (MMNUM(1),KNUMM(1)), (MMBCD(1),MTAIL(4))

      EQUIVALENCE (MTAILX(1),MTAIL(1)), (KIMATL,KIMAPS(1))              -A6
C     EQUIVALENCE (MTAILX(3),MTAIL(1)), (KIMATL,KIMA(14))                A6

      DIMENSION    KIMAX(22),KIMAV(29)                                   A4
C     DIMENSION    KIMAX(18),KIMAV(23)                                   A5
C     DIMENSION    KIMAX(15),KIMAV(20)                                   A6
C     DIMENSION    KIMAX(11),KIMAV(15)                                   A8
C     DIMENSION    KIMAX(9), KIMAV(12)                                   A10
      EQUIVALENCE (KIMAX(1), KIMAV(1),  KIMA(1))


      IF (NVDEP(1).EQ.0)     GO TO 71
   11 NCD   = NVDEP(12)
      LTK   = LDPMAT
      NVDEP(1)= NVDEP(1) + NCD

C--                CONSTRUCT TAIL OF FIRST CARD

      CALL SETNUM (NVDEP(13),MMNUM(1),MMBCD(1))
      MTAIL(2) = JDPMKT(1)
      MTAIL(3) = JDPMKT(2)
      NCH = 8
      IF (IDDEPP(1).EQ.0)    GO TO 31
      IF (IDDEPZ(1).EQ.0)    GO TO 26
      MTAIL(9) = IQBLAN
      CALL UBLOW (IDDEPZ(1),MTAIL(10),8)
      NCH = 17

   26 IF (IDDEPD(1).EQ.IQBLAN)  GO TO 28
      MTAIL(NCH+1)= IQDOT
      CALL UBLOW (IDDEPD(1),MTAIL(NCH+2),8)
      NCH = NCH + 9

   28 MTAIL(NCH+1) = IQEQU
      CALL UBLOW (IDDEPP(1),MTAIL(NCH+2),8)
      NCH = NCH + 9

C--                WRITE FIRST CARD

   31 CALL KDFILL (IQ(LTK))
C     CALL UBLOW (KIMA(14),MTAILX(1),2)                                  A6
C     NCH = NCH + 2                                                      A6
      CALL UBUNCH (MTAILX(1),KIMATL,NCH)
      NW = (NCH+79)/ 4  + 1                                              A4
C     NW = (NCH+79)/ 5  + 1                                              A5
C     NW = (NCH+77)/ 6  + 1                                              A6
C     NW = (NCH+79)/ 8  + 1                                              A8
C     NW = (NCH+79)/ 10 + 1                                              A10
      CALL XOUTCF (LUNASM,KIMAV(1),NW)
      MTAIL(2) = JDPMK(1)
      MTAIL(3) = JDPMK(2)


C-----             WRITE FURTHER CARDS

   41 NCD = NCD - 1
      IF (NCD.EQ.0)          RETURN
      N = MMNUM(5) + 1
      IF (N.EQ.10)           GO TO 51
      MMNUM(5)= N
      MMBCD(5)= NUMVAL(N)

   44 CALL KDFILL (IQ(LTK))
C     CALL UBLOW  (KIMA(14),MTAILX(1),2)                                 A6
C     CALL UBUNCH (MTAILX(1),KIMATL,10)                                  A6
      CALL UBUNCH (MTAILX(1),KIMATL,8)                                  -A6
      WRITE (LUNASM,9001) KIMAX
      GO TO 41

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

C----              NEW DECK, START ASM IF VERY FIRST

   71 CALL DPEXGO
      GO TO 11

 9001 FORMAT (29A4)                                                      A4
C9001 FORMAT (23A5)                                                      A5
C9001 FORMAT (19A6,A2)                                                   A6
C9001 FORMAT (14A8,A4)                                                   A8
C9001 FORMAT (11A10,A6)                                                  A10
      END
