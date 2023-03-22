CDECK  ID>, DEPMSG.
      SUBROUTINE DEPMSG

C-    SET UP (WARNING) MESSAGE READY FOR LISTING

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /DPLINE/LTK,NWTK, KIMAPR(3), KIMA(20), KIMAPS(9)
      COMMON /DPWORK/JDPMKT(2),JDPMK(2),JDECKN,MMLEV,MMACT, LEAD(14)
     +,              MTAIL(36),LTAIL(36), IDDEPP(2),IDDEPD(2),IDDEPZ(2)
     +,              JNUMM,KNUMM(5), JDEC,KDEC(5), JNUM,KNUM(5)
      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
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

C     EQUIVALENCE (LEADCC,LEAD(3))                                      A5,A10
C     EQUIVALENCE (LEADCC,LEAD(5))                                      A8
      EQUIVALENCE (LEADCC,LEAD(1))                                      A4,A6

C-    LDPACT.EQ.0 :  SELF-MATERIAL
C-                   JDPACT.EQ.0  READY LAST CONTROL-CARD FOR PRINTING
C-                   JDPACT.NE.0  READY MISSING-SEQUENCE MESSAGE
C-                                NVUTY(11) HAS SEQUENCE-NAME

C-    LDPACT.NE.0 :  FOREIGN MATERIAL, NVDEP(13) HAS C/C OF MATERIAL
C-                                     NVDEP(13)-1 IS C/C OF CONTR.-CARD
C-                   JDPACT=1    READY SEQUENCE MESSAGE, IDDEPZ HAS NAME
C-                               MDEPAR.LT.0  ZERO-CARD SEQUENCE
C-                               MDEPAR.GT.0  MISSING SEQ CALLED
C-                   JDPACT=2-5  READY ACTION-NATURE FOR PRINTING
C-                               (POSSIBLY NIL-ACTION, CLASH-WARNING)

      DIMENSION    KIMA2(2),KIMA3(2),KIMA4(2),KIMA5(2),KIMA8(2)

      EQUIVALENCE    (KIMA2(1),KIMA(3)),   (KIMA3(1),KIMA(5))
     +,              (KIMA4(1),KIMA(6)),   (KIMA5(1),KIMA(10))
     +,              (KIMA6,   KIMA(15)),  (KIMA7,   KIMA(18))
     +,              (KIMACT,  KIMA(16)),  (KIMA8(1),KIMA(19))
      DIMENSION    MSGMIS(3), MSGBPD(5), MSGURF(4)

C     DIMENSION    MSGBIF(1), MSGDEL(1), MSGCLA(1), MSGSTA(1)            A8M
      DIMENSION    MSGBIF(2), MSGDEL(2), MSGCLA(2), MSGSTA(2)           -A8M
      DIMENSION    IONE(4), IACT(5)

      DATA  MSGMIS /4HMISS,4HING ,4HZ=  /
      DATA  MSGBPD /4H    ,4HBY P,4H=   ,4H    ,4H  D=/
      DATA  MSGURF /4H****,4H    ,4H* U/,4HREF /

      DATA  MSGBIF /4HBY I,4HF   /
      DATA  MSGDEL /4HDELE,4HTED /
      DATA  MSGCLA /4HCLAS,4HH LV/
      DATA  MSGSTA /4H****,4H****/

      DATA   IONE  /    4H****, 4HDO  , 4HNIL , 4HSKIP/
C     DATA   IACT  /8H    Z = , 4HDEL,, 4HREP,, 4HADB,, 4HADD, /         A8M
      DATA   IACT  /    4H Z= , 4HDEL,, 4HREP,, 4HADB,, 4HADD, /        -A8M



      LDPMAT   = 0
      NVDEP(12)= 1
      CALL VBLANK (KIMA(1),KDNWT)
      IF (LDPACT.NE.0)       GO TO 31

C-------           LDPACT=0,  SELF MATERIAL

      NVDEP(13)= JCARD - 1
      IF (JDPACT.NE.0)       GO TO 21

C--                READY FOR LAST C/C

      IDDEPP(1)= 0
      CALL UBUNCH (KARDCC,KIMA(1),NCHCCT)
      NVDEPL(3)= JCARD
      JDPMKT(1)= IQPLUS
      JDPMKT(2)= IQBLAN
      IF   (JCCTYP)          12,15,17
   12 IF (JCCTYP+2)          14,16,13
   13 JDPMKT(1)= IQDOT
   14 RETURN

   15 JDPMKT(1)= IQEQU
      RETURN

   16 IF (NCCPIF+NCCPZ.EQ.0) RETURN
      GO TO 19

   17 IF (NVUTY(10).NE.0)  JDPMKT(1)=IQOPEN
      IF (NVUTY(9) .NE.0)  JDPMKT(2)=IQMINS
   19 LEADCC = IQNUM(1)
      NQUSED = NQUSED + 1
      NVDEPL(5) = 3
      RETURN


C--                MISSING SEQUENCE

   21 KIMA8(1)= NVUTY(11)
      KIMA8(2)= NVUTY(12)                                               -A8M
      JDECKN   = NVWARN(2)
      IDDEPP(1)= MSGSTA(1)
      IDDEPP(2)= MSGSTA(2)                                              -A8M
      IDDEPD(1)= MSGSTA(1)
      IDDEPD(2)= MSGSTA(2)                                              -A8M
      MMLEV = IQBLAN
      MMACT = IQBLAN

   24 IF (MDEPAR.EQ.6)       GO TO 71
C     CALL VFILL (KIMA(1), 7,MSGSTA(1))                                  A8M
C     CALL VFILL (KIMA(1),10,MSGSTA(1))                                  A6,A5
      CALL VFILL (KIMA(1),14,MSGSTA(1))                                  A4
      CALL VBLANK (IQUEST(1),10)
      CALL SETNUM (NVWARN(2),IQUEST(11),IQUEST(4))
      IQUEST(9) = IQSTAR
      CALL UBLOW  (MSGMIS(1),IQUEST(11),10)
C     CALL UBUNCH (IQUEST(1),KIMA6,20)                                   A10,A5
      CALL UBUNCH (IQUEST(5),KIMA6,16)                                   A8,A4
C     CALL UBUNCH (IQUEST(3),KIMA6,18)                                   A6
      IDDEPZ(1)= MSGSTA(1)
      IDDEPZ(2)= MSGSTA(2)                                              -A8M
      JDPMKT(1)= IQSTAR
      JDPMKT(2)= IQBLAN
      RETURN


C-------           LDPACT NON-ZERO, FOREIGN MATERIAL

   31 NVDEP(13)= NVDEP(13) - 1
      IF (JDPACT.NE.1)       GO TO 41

C--                JDPACT=1, SEQUENCE

      KIMA8(1)= IDDEPZ(1)
      KIMA8(2)= IDDEPZ(2)                                               -A8M
      IF (MDEPAR.GE.0)       GO TO 24
      KIMA(1) = IONE(2)
      KIMA7   = IACT(1)
      RETURN

C--                JDPACT = 2,3,4,5   ACTION CARD-COUNT PARAMETERS

   41 CALL VBLANK (IQUEST(5),14)
      CALL UBLOW (IACT(JDPACT),IQUEST(1),4)
      IQUEST(6)= IQLETT(3)
      IQUEST(7)= IQEQU
      J = IQCC(LDPACT)
      IF (JDPACT.EQ.5)  J=J-1
      CALL SETNUM (J,IQUEST(21),IQUEST(8))
      IF (JDPACT.GE.4)       GO TO 43
      IQUEST(13)= IQMINS
      CALL SETNUM (IQCC(LDPACT+1),IQUEST(21),IQUEST(14))
   43 IQUEST(19)= IQDOT
      CALL ULEFT (IQUEST(1),8,19)
      CALL UBUNCH (IQUEST(1),KIMACT,19)
      IF (MDEPAR.EQ.6)       GO TO 72
      J = JBYT (IQ(LDPACT),10,2)
      IF (J.EQ.3)  J=1
      KIMA(1)= IONE(J+2)
      IF (J.NE.1)            GO TO 61

C--                NIL ACTION

      KIMA2(1)= MSGDEL(1)
      KIMA2(2)= MSGDEL(2)                                               -A8M
      L = IQ(LDPACT-2)
      IF (L.NE.0)            GO TO 47
      KIMA4(1)= MSGBIF(1)
      KIMA4(2)= MSGBIF(2)                                               -A8M
      RETURN

   47 J = IQ(L-1)
      CALL UBLOW  (MSGBPD(1),IQUEST(1),20)
   48 CALL UBLOW  (IQ(J+2),IQUEST(10),8)
C     CALL UBUNCH (IQUEST(1),KIMA4(1),20)                                A10,A5
      CALL UBUNCH (IQUEST(5),KIMA4(1),16)                                A4,A8
C     CALL UBUNCH (IQUEST(3),KIMA4(1),18)                                A6
      KIMA5(1)= IQ(L+1)
      KIMA5(2)= IQ(L+2)                                                 -A8M
      RETURN


C--                CLASH WARNING

   61 J = JBYT (IQ(LDPACT),13,3)
      IF (J.EQ.0)            RETURN
      J = MIN  (J,2)
      NVWARN(J+4) = NVWARN(J+4) + 1
      KIMA2(1)= MSGCLA(1)
      KIMA2(2)= MSGCLA(2)                                               -A8M
      CALL SETNUM (NVWARN(J+4),IQUEST(11),IQUEST(2))
      IQUEST(1) = IQNUM(J+1)
      IQUEST(7) = IQSTAR
      CALL UBUNCH (IQUEST(1),KIMA3(1),7)
      IF   (J.EQ.1)          GO TO 68
      IDDEPZ(1)= MSGSTA(1)
      IDDEPZ(2)= MSGSTA(2)                                              -A8M
   68 KIMA5(1) = MSGSTA(1)
      KIMA5(2) = MSGSTA(2)                                              -A8M
      RETURN

C----              UREF, UNSATISFIED REFERENCE

   71 KIMA7 = IACT(1)
   72 NVWARN(4) = NVWARN(4) + 1
      CALL UBLOW  (MSGURF(1),IQUEST(1),15)
      CALL SETNUM (NVWARN(4),IQUEST(21),IQUEST(4))
      CALL UBUNCH (IQUEST(1),KIMA(1),15)
      IDDEPZ(1)= MSGSTA(1)
      IDDEPZ(2)= MSGSTA(2)                                              -A8M
      J = LEXP
      L = LEXD
      CALL UBLOW  (MSGBPD(1),IQUEST(1),20)
      IQUEST(5) = IQLETT(20)
      IQUEST(6) = IQLETT(15)
      GO TO 48
      END
