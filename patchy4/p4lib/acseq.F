CDECK  ID>, ACSEQ.
      SUBROUTINE ACSEQ (LSQ,LSQCP)

C-    Handle preset sequences
C-           1 DATEQQ, 2 QCARD1, 3 QEJECT, 4 QFTITLE, 5 QFTITLCH

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
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
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE                  (INCSEQ,NVINC(1))
     +,                            (INCACT,NVINC(2)), (INCMAT,NVINC(3))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LASM,NVDEP(2))
      DIMENSION    LSQCP(9)


C     DATA  IDEAD  /4H****/                                              DEBUG


      LSQC= LSQCP(1)
      JS  = JBYT (IQ(LSQ),13,3)
      GO TO (26,21,28,31,31), JS

C-------           HANDLE Z=QCARD1,  IN FOREIGN OR IN SELF MATERIAL

   21 LSQ = 0
      IF (LSQC.NE.0)         GO TO 23
      IF (JCCPD.EQ.0)        RETURN
      NVDEP(7)= MCCPAR(JCCPD+1)
      NVDEP(8)= MCCPAR(JCCPD+2)                                         -A8M
      GO TO 24

   23 IF (IQ(LSQC+2).EQ.0)   RETURN
      NVDEP(7)= IQ(LSQC+2)
      NVDEP(8)= IQ(LSQC+3)                                              -A8M
   24 IF (NVDEP(1).EQ.0)     RETURN
      IQ(LASM+2)= IQ(LASM+2) + NVDEP(1)
      NVDEP(1) = 0
   26 RETURN


C-------           HANDLE Z=QEJECT

   28 LSQ = 0
C     N = IQ(LSQC+2)                                                    DEBUG
C     IF (LSQC.EQ.0)  N=MCCPAR(JCCPD+1)                                 DEBUG
C     IF (N.EQ.IDEAD)        CALL QFATAL                                DEBUG
      RETURN

C-------           HANDLE Z=QFTITLE,  IN FOREIGN OR IN SELF MATERIAL

   31 N = IQ(LSQC+2)
      IF (LSQC.EQ.0)  N=MCCPAR(JCCPN+1)
      N = MAX  (N,8)
      N = MIN  (N,62)
      CALL VBLANK (MWKX(1),80)
      NCH = MIN  (IQ(LPAM+12),70)
      CALL UBLOW (IQ(LPAM+13),MWKX(11),NCH)

C--                DISCARD LEADING BLANKS

      L = 11
      IF (MWKX(11).NE.IQLETT(3))  GO TO 34
      IF (MWKX(12).NE.IQBLAN)     GO TO 35
   33 L = L + 1
      IF (L.GE.19)                GO TO 35
   34 IF (MWKX(L).EQ.IQBLAN)      GO TO 33
   35 IF (L.NE.11)  CALL UCOPY (MWKX(L),MWKX(11),N)
      CALL VBLANK (MWKX(N+11),70-N)
      IF (JS.EQ.5)           GO TO 37

C--                CONSTRUCT  .....+.##Htext

      CALL SETNUM (N,MWKX(73),MWKX(5))
      MWKX(6) = IQPLUS
      MWKX(10)= IQLETT(8)
      CALL UBLOW  (8H    HOLD,MWKX(73),8)
      GO TO 39

C--                CONSTRUCT  .....+..'text'

   37 CALL UCOPY (MWKX(11),MWKX(10),N)
      MWKX(6) = IQPLUS
      MWKX(9) = IQAPO
      MWKX(10+N) = IQAPO
   39 CALL UBUNCH (MWKX(1),IQMSQ(LSQ),80)
      RETURN
      END
