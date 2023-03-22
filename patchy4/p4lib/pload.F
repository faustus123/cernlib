CDECK  ID>, PLOAD.
      SUBROUTINE PLOAD

C-    PRE-LOAD PATCHY COMMONS AT INITIALISATION

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QHEADP/IQHEAD(20),IQDATE,IQTIME,IQPAGE,NQPAGE(4)
      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /QSTATE/QVERSN,NQINIT,NQSTAG(2),NQPHAS,NQERR,QDEBUG,NQDCUT
     +,              NQNEWB,NQAFTB,NQM99,NQLOWB,NQWCUT,NQLOCK,QSTDUM
     +,              NQAUGM(2),NQZIP(8),AQMEM(12)
                         INTEGER QDEBUG
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
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
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      PARAMETER      (KDNWT=20, KDNWT1=19,KDNCHW=4, KDBITS=8)
      PARAMETER      (KDPOST=25,KDBLIN=32,KDMARK=0, KDSUB=63,JPOSIG=1)
      COMMON /KDPKCM/KDBLAN,KDEOD(2)
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------

      DIMENSION    MCCTXV(84), MCCTPV(10)
      DIMENSION    MPAKV(8), MPAKNB(8)
      EQUIVALENCE (MPAKV(1),MPAK2(1)), (MCCTPV(1),MCCQUI)
      EXTERNAL     QABEND, RQTELL, IOTYPE



      DATA  MCCTXV /   83,  28
     +,     4H+CDE,4H+SEQ,4H+SEL,4H+PAT,4H+DEC,4H+KEE,4H+DEF,4H+EOD
     +,     4H+DEL,4H+REP,4H+ADD,4H+ADB,4H+USE,4H+EXE,4H+LIS,4H+MIX
     +,     4H+DIV,4H+IMI,4H+PAM,4H+QUI,4H+OPT,4H+ASM,4H+ONL,4H+TIT
     +,     4H+FOR,4H+SUS,4H+PAR,4H+WAR
     +,  0,     -1,    -1,    -2,   -19,   -18,     1,   -17,   -16
     +,          2,     3,     5,     4,    -7,    -5,    -6,    -4
     +,         -3,   -10,   -21,   -22,   -11,   -15,   -13,   -20
     +,         -8,    -9,   -12,   -14
     +, 23,    0,  3,  0,  1,  2,  0,  0,  7,  2,  3,  4,  4
     +,        1,  4,  4,  1,  1,  1,  1,  1,  3,  3,  0,  3    /
C
C            -22 -21 -20 -19 -18 -17 -16 -15 -14 -13 -12 -11
C            -10  -9  -8  -7  -6  -5  -4  -3  -2  -1   0  +1

      DATA  MPAKNB /2,0,5,0,9,0,15,0/
      DATA  MMEOD  /4H+EOD/


C--          READY /ARRCOM/, /IOFCOM/
      CALL VZERO (LUNPAM,28)
      NTRUNC = 80
      CALL VZERO (IOTALL,20)

C--          READY /CCPARA/
      CALL VZERO  (NCHCCD,231)
      CALL VBLANK (KARDCC(1),84)
      MCCPAR(2)= IQBLAN
      MCCPAR(3)= IQBLAN
      MCCTOU = 0
      JCCLOW = 0

C--          READY /CCTEXT/
      CALL UCOPY (MCCTXV(2),NCCVEC,MCCTXV(1))
      MCCDF(2) = 6

C--          READY /CCTYPE/
      DO 24  J=1,8
   24 MCCTPV(J) = J-23
      MCCOPT = -11
      MCCUSE =  -7


C--          READY /CONST/
      DO 28 J=1,8,2
      MPAKV(J)  = MPAKNB(J)
   28 MPAKV(J+1)= NQBITW / MPAKNB(J)
C     NWNAME = 1                                                         A8M
C     NWSENM = 2                                                         A8M
C     NWSEN1 = 3                                                         A8M
      NWNAME = 2                                                        -A8M
      NWSENM = 3                                                        -A8M
      NWSEN1 = 4                                                        -A8M
      LARGE  = 99999
      CALL VBLANK (IQUEST(1),12)
      CALL USET (IQDATE,IQUEST(1),1,6)
      CALL USET (IQTIME,IQUEST(1),9,12)
      IQUEST(8) = IQUEST(9)
      IQUEST(9) = IQUEST(10)
      IQUEST(10)= IQDOT
      CALL UBUNCH (IQUEST(1),DAYTIM(1),12)

C--          READY /KDPKCM/
      KDBLAN = IQBLAN
      KDEOD(1) = MMEOD
      KDEOD(2) = IQBLAN                                                  A4
      CALL SBYT  (0,KDEOD(2),25,8)

      IF (KDNWT.NE.0)        RETURN
      CALL QFATAL (QABEND,RQTELL,IOTYPE)
      RETURN
      END
