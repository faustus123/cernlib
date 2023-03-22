CDECK  ID>, ARBIN.
      SUBROUTINE ARBIN

C-    READ/SKIP NEXT RECORD OF COMPACT PAM

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /ARRCOM/LUNPAM,NCHKD,NWKD,NCARDP,NAREOF,NSKIPR,KDHOLD(20)
     +,              NTRUNC,IPROMU,IPROMI
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
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
     +, JASK,JCWAIT,JCWDEL,LARMAT,LAREND,NCARR
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(9),LARX,LARXE,LINBUF
     +, NVCCP(7),JARDO,JARWT,JARLEV
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LUNUSE,LUNPAM)



      LINBIN = LINBUF + IQ(LINBUF-1)
    9 IF  (JARDO)            11,17,21


C----              SKIP NEXT DECK

   11 CONTINUE
      J = 3
      CALL XINB (LUNUSE,IQ(LINBIN+1),J)
      IF   (J.EQ.0)          GO TO 81
      IF   (J.LT.0)          GO TO 80
      NSKIPR = NSKIPR + 1
      GO TO 31

C----              SKIP RECORD WITHOUT C-C

   17 CONTINUE
      J = 3
      CALL XINB (LUNUSE,IQ(LINBIN+1),J)
      IF   (J.EQ.0)          GO TO 81
      IF   (J.LT.0)          GO TO 80
      NSKIPR = NSKIPR + 1
      N = 2
      GO TO 31

C----              READ NEXT RECORD IN FULL

   21 CONTINUE
      J = 510
      CALL XINB (LUNUSE,IQ(LINBIN+1),J)
      IF   (J.EQ.0)          GO TO 81
      IF   (J.LT.0)          GO TO 80
      IQ(LINBIN) = J
C     JARDO = JBYT (IQ(LINBIN+2),10,9)                                   A8M
      JARDO = JBYT (IQ(LINBIN+3),10,9)                                  -A8M
      N = 2*JARDO + 3


C------            PROCESS THE STUFF READ

   31 NVARRI(5)= IQ(LINBIN+1)
      NVARRI(6)= IQ(LINBIN+2)                                           -A8M
      CALL UPKBYT (IQ(LINBIN+3),1,NVARRI(1),4,MPAK2(1))                 -A8M
C     CALL UPKBYT (IQ(LINBIN+2),1,NVARRI(1),4,MPAK2(1))                  A8M
      NCARDP= NCARDP + 1
      IF (NVARRI(1).EQ.0)    GO TO 34
      NDECKR = NDECKR + 1
      JCARD  = MAX  (0,NVARRI(1)-2)
   34 CONTINUE
      IF (JARDO.LT.0)        RETURN
      LEND = LINBIN + IQ(LINBIN) + 1

C--                UNPACK INDEX VECTOR, CONVERT TO C/C DIRECTORY

C     CALL UPKBYT (IQ(LINBIN+2),2,IQ(LINBUF+1),N,MPAK9(1))               A8M
      CALL UPKBYT (IQ(LINBIN+3),2,IQ(LINBUF+1),N,MPAK9(1))              -A8M
      LARX  = LINBUF + 3
      IF (NVOPER(3).NE.0)    GO TO 61
      IF (JARDO    .EQ.0)    GO TO 63

C----              RECORD WITH C/C

      LARXE = LINBUF + N + 1
      IQ(LARXE)  = IQ(LINBUF+2)
      IQ(LARXE+1)= -LEND

      DO 37   L=LARX,LARXE,2
      IQ(L)   = -(IQ(L) + LINBIN)
   37 IQ(L+1) =   IQ(L+1) + JCARD
      IQ(LARX)= -IQ(LARX)
      IF (IQ(LARX+1).EQ.JCARD)  LARX=LARX+2
      IF (MOPTIO(11)+MOPTIO(19).EQ.0)        RETURN


C--                REMOVE CARDS +SEQ, +KEEP FROM C/C DIRECTORY IF OPTION

      L = -IQ(LARX)
      IF (L.LT.0)               GO TO 42
      IF (JARTYP(IQ(L)).NE.0)   GO TO 42
      IQ(LARX) = L

   42 LP = LARX + 1
      LT = LARX - 1
   45 LT = LT + 2
      IF (LT.GE.LARXE)       GO TO 46
      L = -IQ(LT+1)
      IF (JARTYP(IQ(L)).EQ.0)   GO TO 45
      IQ(LP)   = IQ(LT)
      IQ(LP+1) = -L
      LP = LP + 2
      GO TO 45

   46 IQ(LP)   = IQ(LARXE)
      IQ(LP+1) = IQ(LARXE+1)
      LARXE = LP
      RETURN


C----              UPDATE MODE, BY-PASS C/C

   61 IQ(LARX) = IQ(LARX) + LINBIN
      IF (NVARRI(3) .EQ.0)   GO TO 62
      IF (MOPTIO(20).EQ.0)   GO TO 62
      IQ(LEND)  = KDEOD(1)
      IQ(LEND+1)= KDEOD(2)                                               A4
      LEND = LEND + 2                                                    A4
C     LEND = LEND + 1                                                   -A4
      IQ(LINBUF+2) = IQ(LINBUF+2) + 1

   62 NVARRI(2) = 0
      NVARRI(4) = 0
      IF (JARDO.NE.0)        GO TO 64

C--                RECORD WITHOUT C/C

   63 IQ(LARX) = NWSEN1 + LINBIN
   64 LARXE = LARX + 1
      IQ(LARXE)   = IQ(LINBUF+2) + JCARD
      IQ(LARXE+1) = -LEND
      RETURN

C------            EOF SEEN

   80 CALL PABERR (LUNUSE)
   81 NVARRI(1)= 4
      NVARRI(3)= 3
      JPROPD = 4
      RETURN

      END
