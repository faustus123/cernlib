CDECK  ID>, CCKRAK.
      SUBROUTINE CCKRAK (KARD)

C-    ANALYSE CONTROL-CARD INTO PARAMETER-LIST & INDEX

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCPARU/MCCTOU,JCCLOW,JCCTPX
      COMMON /CCTEXT/NCCVEC,MCCVEC(28),MCCSW(29),NCCDFI,MCCDF(24)
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
C-    THE ONLY WSP-VARIABLE USED IS  NVMAT(1), AT ST.NO. 91
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
      DIMENSION    KARD(20)
      DIMENSION    M(80), NAME(8)
      DIMENSION    JVECT(7), NVECT(7), MSEPS(7), MSEPS2(7)
      EQUIVALENCE (JVECT(1),JCCPP), (NVECT(1),NCCPP),  (M(1),KARDCC(1))
      EQUIVALENCE (LSEP,JCCWK(1)),(JSEPI,JCCWK(2)),(NEGNUM,JCCWK(3))
     +,                                            (IFSEEN,JCCWK(4))


      DATA  MSEPS  /1HP,1HD,1HZ,1HT,1HI,1HC,1HN/
      DATA  MSEPS2 /1HS,1HR,1HF,1HX,1HY,1HL,1HN/
      DATA  NSEPS  /7/


C--                BLOW CARD AND FIND USEFUL LENGTH

      CALL UBLOW (KARD(1),M(1),NCHKD+1)
      NCHCCT = MIN  (NCHKD,72) + 1
   11 NCHCCT = NCHCCT - 1
      IF (M(NCHCCT).EQ.IQBLAN) GO TO 11

   12 NCH = IUFIND(IQDOT,M(1),1,NCHCCT)
      IF (NCHCCT-NCH)          14,15,13
   13 IF (M(NCH+1).NE.IQCOMA)  GO TO 15
      M(NCH)   = IQCOMA
      M(NCH+1) = IQBLAN
      JCCLOW = NCH + 1
      GO TO 12

   14 CONTINUE
   15 NCHCCD = NCH
      IF (MCCTOU.EQ.0)       GO TO 16
      CALL CCTOUP (M(1),NCH-1)
      IF (JCCLOW.EQ.0)       GO TO 16
      IF (MCCTOU.LT.0)       GO TO 16
      N = IQCHAW * ( (JCCLOW-1)/IQCHAW + 1)
      IF (N.GE.NCHKD-IQCHAW+2)  N = MIN  (NCHKD+1,80)
      CALL UBUNCH (M(1),KARD(1),N)
   16 M(NCH) = IQDOT
   18 NCH = NCH-1
      IF (M(NCH).EQ.IQBLAN)  GO TO 18
      CALL VZERO (NCCPAR,22)
      L = IUFIND (IQCOMA,M(1),4,NCH)
      IF (L.GE.NCH)          RETURN
      NBUNCH= 8
      LOC   = 4

C-----------       READ NEXT PARAMETER

   31 MCCPAR(LOC) = 1
   32 JPARA = 0
      GO TO 34

   33 JPARA = 7
   34 CALL VBLANK (NAME,8)
      N  = 0
   35 IF (L.EQ.NCH)          GO TO 38
      LA = L + 1

      DO 37 L=LA,NCH
      MC = M(L)
      IF  (MC.EQ.IQBLAN)     GO TO 37
      IF  (MC.EQ.IQEQU)      GO TO 41
      IF  (MC.EQ.IQCOMA)     GO TO 61
      IF  (MC.EQ.IQMINS)     GO TO 46
      IF (N.GE.8)            GO TO 37
      N = N+1
      NAME(N) = MC
   37 CONTINUE
   38 L = NCH + 1
      GO TO 61

C----              NAMED SEPARATOR READ

   41 IF (JPARA.NE.0)        GO TO 96
      JSEP  =              IUCOMP(NAME(1),MSEPS(1), NSEPS)
      IF (JSEP.EQ.0)  JSEP=IUCOMP(NAME(1),MSEPS2(1),NSEPS)
      IF (JSEP.EQ.0)         GO TO 96
      IF (JVECT(JSEP).NE.0)  GO TO 43
      IF (IFSEEN.NE.0)       GO TO 96
      JVECT(JSEP) = LOC
      LSEP  = JSEP
      NEGNUM= 0
      NBUNCH= 8
      IF (JSEP.EQ.4)  NBUNCH=1
      IF (JSEP.EQ.5)  IFSEEN=7
   42 MCCPAR(LOC) = JSEP + 1
      GO TO 33

C--                SAME SEPARATOR AGAIN

   43 IF (JSEP.NE.LSEP)      GO TO 96
      IF (JSEP.NE.5)         GO TO 33
      GO TO 42

C--                ACT ON '-'

   46 IF (N.NE.0)            GO TO 60
      IF (LSEP.LT.5)         GO TO 96
      MCCPAR(LOC) = -MCCPAR(LOC)
      IF (MCCPAR(LOC).LT.0)  GO TO 35
      GO TO 96

C-----------       DIGEST PARAMETER JUST READ

   60 L = L - 1
   61 IF (LSEP.NE.0)         GO TO 71
      JSEPI = JSEPI + 1
      IF (N.EQ.0)            GO TO 86
      IF (JCCTYP.GE.2)       GO TO 64

C--                FIRST PARAMETER WITHOUT PARAMETER-KEY

      JSEP = MCCDF(NCCDFI+JCCTYP)
      IF (JSEP.EQ.0)         GO TO 96
      IF (JSEP.NE.4)         GO TO 66
      NBUNCH = 1
      GO TO 66

C--                ACTION CARD WITH IMPLICITE PARAMETER-KEY

   64 JSEP = JSEPI
      IF (JSEP.LT.3)         GO TO 67
      JSEP = 6
   66 LSEP = JSEP
   67 JVECT(JSEP) = LOC
      MCCPAR(LOC) = JSEP + 1
      GO TO 73

C-----             NORMAL PARAMETER PROCESSING

   71 JSEP  = LSEP
   73 IF (JSEP.LT.6)         GO TO 81

C--                STORE NUMERIC PARAMETER VALUE

      NUM = 0
      J   = 0
   77 J = J + 1
      I = IUCOMP (NAME(J),IQNUM,10)
      IF (I.EQ.0)            GO TO 96
      NUM = 10*NUM + (I-1)
      IF (J.LT.N)            GO TO 77
      IF (MCCPAR(LOC).LT.0)  GO TO 79
      MCCPAR(LOC+1) = NUM
      MCCPAR(LOC+2) = NUM
      NEGNUM= 7
      GO TO 84

   79 IF (NEGNUM.EQ.0)       GO TO 96
      MCCPAR(LOC-1) = NUM
      NEGNUM= 0
      IF (NUM.GE.MCCPAR(LOC-2)) GO TO 86
      IF  (JCCTYP.LT.2)         GO TO 86
      GO TO 96

C--                STORE ALPHAMERIC PARAMETER VALUE

   81 CALL UBUNCH (NAME(1),MCCPAR(LOC+1),NBUNCH)
   84 NCCPAR= NCCPAR + 1
      NVECT(JSEP) = NVECT(JSEP) + 1
      LOC = LOC + 3
   86 IF (L.LT.NCH)          GO TO 31

C------            ANALYSIS FINISHED, RESOLVE  +DEF, P/D/Z=

      IF (JCCTYP.EQ.MCCDEF)  GO TO 96

C--                CLEAR P/D-NAME CARRY, UNLESS ACTION-CARD OR SEQ

   91 IF (JCCTYP.LT.-1)  NVIMAT(1)=0
      MCCPAR(LOC) = 0
      JCCEND = LOC

C--                COMPRESS VALUES FOR  TYPE=...

      IF (NCCPT.EQ.0)        RETURN
      L = JCCPT
      N = NCCPT
      MM= 0
   92 J = IUCOMP (MCCPAR(L+1),IQLETT(1),30)
      IF (J.EQ.0)            GO TO 93
      CALL SBIT1 (MM,J)
   93 L = L + 3
      N = N - 1
      IF (N.NE.0)            GO TO 92
      MCCPAR(JCCPT+1)= MM
      RETURN

C--                FAULT

   96 JCCBAD= 7
      IF (JCCTYP.GT.MCCEOD)  RETURN
      JCCTYP = -2
      RETURN
      END
