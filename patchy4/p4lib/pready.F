CDECK  ID>, PREADY.
      SUBROUTINE PREADY

C-    INITIALISE, READY TO READ  P=CRA*,D=,C=1.

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QHEADP/IQHEAD(20),IQDATE,IQTIME,IQPAGE,NQPAGE(4)
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /ARRVRQ/MAFIL,MAPAT,MADEC,MAREAL,MAFLAT,MASKIP,MADEL
     +,              MACHEK,MADRVS,MADRVI,MAPRE,  MSELF
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTEXT/NCCVEC,MCCVEC(28),MCCSW(29),NCCDFI,MCCDF(24)
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /DPWORK/JDPMKT(2),JDPMK(2),JDECKN,MMLEV,MMACT, LEAD(14)
     +,              MTAIL(36),LTAIL(36), IDDEPP(2),IDDEPD(2),IDDEPZ(2)
     +,              JNUMM,KNUMM(5), JDEC,KDEC(5), JNUM,KNUM(5)
      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
      COMMON /LUNSLN/NSTRM,NBUFCI,LUNVL(3),LUNVN(9),NOPTVL(4),NCHCH(6)
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
     +, JASK,JCWAIT,JCWDEL,LARMAT,LAREND,NCARR
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(11),LINBUF,NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE(LPAST,LADRV(1)),  (LPCRA,LADRV(2)), (LDCRAB,LADRV(3))
     +,          (LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
     +,         (INCSEQ,NVINC(1)), (INCACT,NVINC(2)), (INCMAT,NVINC(3))
C--------------    END CDE                             -----------------  ------
      DIMENSION    MNAMES(20),MMSEQ(4),MMPAM(4),MMASMH(4),MMASM(4)
      DIMENSION    LUNAV(11),NMASM(10),NWPAM(4)



      DATA  MNAMES /                                                    -A8M
     + 4HPAT ,3,2,3,4HHDEC,3,3,1,4HDECK,3,3,2,4HORG ,1,0,2,4HACT ,3,2,0/-A8M
C     DATA  MNAMES /                                                     A8M
C    + 4HPAT ,3,2,2,4HHDEC,3,3,1,4HDECK,3,3,1,4HORG ,1,0,1,4HACT ,3,2,0/ A8M

      DATA  MANN   /11/
      DATA  MMSEQ  /4HSEQ1,3,1,2H**/
      DATA  MMPAM  /4HPAM ,2,0,2H**/
      DATA  MMASMH /4HASMH,10,0,1/
      DATA  MMASM  /4HASM ,2,0,12/
      DATA  NMASM  /2H  ,2HA ,2HD ,2HX ,2HY ,2H2 ,2HA2,2HD2,2HX2,2HY2/
      DATA  NWPAM  /15, 100, 512, 24/
      DATA  NMCRA  /4HCRA*/

      DATA  LUNAV  / 11, 21,22,23,24,25, 31,32,33,34,35 /

C--          READY /ARRVRQ/
      DO 22 J=1,MANN
   22 IQUEST(J)= J - MANN + 2
      CALL UCOPY (IQUEST(1),MAFIL,MANN)

C--          READY /NAMES/
      CALL UCOPY (MNAMES(1),NAMEP(1),20)

C--          READY PRE-SET VARIABLES IN Q

      INCMAT = 3 / MPAK15(2) + 2
      INCACT = INCMAT + 2
C     INCSEQ = INCMAT + 1                                                A8M
      INCSEQ = INCMAT + 2                                               -A8M

      KADRV(1) = 6
      KADRV(8) = IQLOCF (LEXP)

      NVOPER(1)= 2
      NVOPER(2)= 3
C     NVGARB(3)= 1600                                                    A10
C     NVGARB(3)= 2000                                                    A8
C     NVGARB(3)= 2600                                                    A6
C     NVGARB(3)= 3200                                                    A5
      NVGARB(3)= 4000                                                    A4
      NVGARB(5)= 7


C--                SET UP OPTIONS

      CALL UPKBYT (NOPTVL(4),1,MOPTIO(1),30,0)
      CALL UBLOW  (NOPTVL(1),IQUEST(1),8)
      DO 24  J=1,8
      L = IUCOMP (IQUEST(J),IQLETT(1),30)
      IF (L.EQ.0)            GO TO 25
   24 MOPTIO(L) = 1
   25 MOPTIO(3) = 1
      MOPTIO(6) = 1
      CALL PKBYT (MOPTIO(1),MOPTIO(31),1,30,0)
      CALL SETOPT

C--                READY /DPWORK/

      CALL VBLANK (JDPMKT(1),117)
      LTAIL(6)  = IQEQU
      LTAIL(15) = IQDOT

C----              READY BANKS FOR  P=CRA*, D=BLANK.

      CALL VBLANK (IDARRV(1),8)
      IDARRV(3)= NMCRA
      CALL LIFTBK (LEXP,     0,    0, NAMEP(1),0)
      CALL LIFTBK (LPAST, LEXP,   -1, NAMEP(1),0)
      CALL LIFTBK (LEXH,  LEXP,   -2, NAMEH(1),0)
      CALL LIFTBK (LEXD,  LEXH,   -2, NAMED(1),0)
      CALL LIFTBK (LDECO,    0,    0, NAMEOR(1),0)
      LPCRA   = LEXP
      LDCRAB  = LEXD

      IQ(LPAST+2)= IQCOMA
      IQ(LEXP-3) = LEXP
      IQ(LEXP+1) = 16
      IQ(LEXP+2) = NMCRA
      IQ(LEXP+3) = IQBLAN                                               -A8M
      IQ(LEXH+1) = 0
      IQ(LEXD+1) = IQBLAN
      IQ(LEXD+2) = IQBLAN                                               -A8M
      IQ(LDECO-1)= LEXP
      IQ(LDECO+1)= IQBLAN
      IQ(LDECO+2)= IQBLAN                                               -A8M

      NVUSEB(1) =  992
      NVUSEB(2) =  992
      NVUSEB(3) =  992 + 16
      NVUSEB(4) = NVUSEB(3)

      CALL SBYT (NVUSEB(3),IQ(LEXP),1,18)                               -MSK
      CALL SBYT (NVUSEB(4),IQ(LEXD),1,18)                               -MSK
C     IQ(LEXP) = IQ(LEXP) .OR. NVUSEB(3)                                 MSKC
C     IQ(LEXD) = IQ(LEXD) .OR. NVUSEB(4)                                 MSKC
      NVARR(6) = 1


C----              READY RESERVED SEQUENCES

      CALL VBLANK (MWKX(1),80)
      IQUEST(1)= 0
      IQUEST(2)= KDNWT
      IQUEST(3)= 1
      IQUEST(4)= 1
      CALL PKBYT (IQUEST(1),MWKX(1),1,4,MPAK15(1))
      MMSEQ(4)= INCSEQ + KDNWT1
      JSTAT = 1

      DO 39  JS=1,6
      CALL LIFTBK (L,KADRV(1),0,MMSEQ(1),0)
      IQ(L-3)= LDECO
      JSTAT  = JSTAT + 64
      CALL SBYT (JSTAT,IQ(L),7,9)
      CALL UCOPY (MWKX(1),IQ(L+1),MMSEQ(4))
      GO TO (30,31,32,33,34,35), JS

   30 CALL UBLOW  (7HITIMQQ=,MWKX(47),7)
      CALL USET   (IQTIME,MWKX(41),17,20)
      CALL UBUNCH (MWKX(41),IQMSQ(L),20)
      CALL UBLOW  (8HTIMEQQ  ,IQUEST(1),8)
      JSTAT = 1
      GO TO 38

   31 CALL UBLOW  (7HIDATQQ=,MWKX(47),7)
      CALL USET   (IQDATE,MWKX(41),15,20)
      CALL UBUNCH (MWKX(41),IQMSQ(L),20)
      CALL UBLOW  (8HDATEQQ  ,IQUEST(1),8)
      GO TO 38

   32 CALL UBLOW (8HQCARD1  ,IQUEST(1),8)
      GO TO 38

   33 CALL UBLOW (8HQEJECT  ,IQUEST(1),8)
      GO TO 38

   34 CALL UBLOW (8HQFTITLE ,IQUEST(1),8)
      GO TO 38

   35 CALL UBLOW (8HQFTITLCH,IQUEST(1),8)
   38 CALL UBUNCH (IQUEST(1),IQCC(L),8)
   39 CONTINUE


C----              READY PAM-STRUCTURE

      NWPAM(1) = NWPAM(1) + KDNWT
      MMPAM(4) = NWPAM(1) + NWPAM(2) + NWPAM(3) + NWPAM(4)
      CALL LIFTBK (LPAM,0,0,MMPAM,0)
      CALL VZERO (IQ(LPAM+1),MMPAM(4))
      LINBUF      = LPAM + NWPAM(1)
      IQ(LINBUF-1)= NWPAM(2)
      IQ(LINBUF-2)= NWPAM(2) + NWPAM(3)
      NVARR(1) = LUNAV(1)

C----              Ready ASM-structure

      CALL LIFTBK (LSASM,0,0,MMASMH,0)
      IQ(LSASM+1)= 0

      DO 49 JF=1,10
      CALL LIFTBK (LASM,LSASM,-JF,MMASM,0)
      CALL VZERO (IQ(LASM+1),MMASM(4))
      IQ(LASM+1)= 1
      IQ(LASM+2)= -7
      IQ(LASM+4)= NMASM(JF)
      IQ(LASM+5)= LUNAV(JF+1)

      IF (JF.NE.1)           GO TO 42
      CALL UCTOH1 (
     + '+-CDECK  ID>, +.-;DECK  ID>, +.--/*DECK ID>, +. */---'
     +, MWKX(1),60)
      LT = 2
      GO TO 44

   42 IF (JF.NE.6)           GO TO 44
      LT = 2

   44 LP = 0
   45 LT = LT + 1
      IF (MWKX(LT).EQ.MWKX(2)) GO TO 46
      LP = LP + 1
      MWK(LP) = MWKX(LT)
      GO TO 45

   46 IF (LP.EQ.0)           GO TO 49
      CALL LIFTRH (LP,LRHC,0)
      LQ(LASM-1) = LRHC
   49 CONTINUE

      JANSW = 3
      RETURN
      END
