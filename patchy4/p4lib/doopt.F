CDECK  ID>, DOOPT.
      SUBROUTINE DOOPT

C-    ANALYSE  +XXX..., +ONLY, +PARAM, +OPTION

      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /CCTEXT/NCCVEC,MCCVEC(28),MCCSW(29),NCCDFI,MCCDF(24)
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
      DIMENSION    MMONLY(4)
      DATA  MMONLY /4HONLY,1,1,2H**/


      IF (NVARR(6).EQ.0)     GO TO 91
      JTYP = MCCPAR(JCCPT+1)
      JNNN = MCCPAR(JCCPN+1)
      CALL UPKBYT (JTYP,1,IQUEST(1),30,0)
      J = JCCTYP - MCCASM
      GO TO (21,31,61,71), J

C--                +XXX...

   21 CONTINUE
      RETURN

C----              +ONLY, (F=) FILES

   31 IF (NCCPZ.EQ.0)        GO TO 91
C     MMONLY(4)= NCCPZ + 1                                               A8M
      MMONLY(4)= NCCPZ+NCCPZ + 1                                        -A8M
C-                           LQUSER(1) SUPPORTS 'ONLY' - STRUCTURE
      CALL LIFTBK (L,1,0,MMONLY,7)
      IQ(L+1)= NCCPZ

      DO 33  J=1,NCCPZ
      IQ(L+2)= MCCPAR(JCCPZ+1)
      IQ(L+3)= MCCPAR(JCCPZ+2)                                          -A8M
      JCCPZ= JCCPZ + 3
C  33 L = L+1                                                            A8M
   33 L = L+2                                                           -A8M
      RETURN

C--                +PARAM, (T=)GAP,CLASH, N=N

   61 IF (JCCPN.EQ.0)        GO TO 91
      IF (IQUEST(7).NE.0)  NVGARB(3)=MAX (JNNN,500)
      IF (IQUEST(3).NE.0)  NVOPER(1)=MIN (JNNN,3)

C--                +PARAM, LINES, N=A,B,C

      IF (IQUEST(12).EQ.0)   RETURN
      IF (JNNN.LT.40)        RETURN
      NQLNOR = JNNN
      NQLMAX = JNNN
      NQLPTH = 0

      IF (NCCPN.LT.2)        RETURN
      JNNN = MCCPAR(JCCPN+4)
      IF (JNNN.LT.NQLNOR)    RETURN
      NQLMAX = JNNN

      IF (NCCPN.LT.3)        RETURN
      JNNN = MCCPAR(JCCPN+7)
      IF (JNNN.LT.0)         RETURN
      IF (JNNN.GE.13)        RETURN
      NQLNOR = NQLNOR + JNNN
      NQLMAX = NQLMAX + JNNN
      NQLPTH = JNNN
      RETURN

C----              +OPTION, (T=)

   71 CALL SETOPT
      NVOPER(2) = 3*(1-MOPTIO(12))
      MCCSW(2)  = 0
      MCCSW(7)  = 0
      IF (MOPTIO(11).EQ.0)  MCCSW(7)= 1
      IF (MOPTIO(19).EQ.0)  MCCSW(2)=-1
      MCCSW(3)  = MCCSW(2)
      RETURN

C-----             FAULTY CARD

   91 MDEPAR = 2
      CALL DEPART
      RETURN
      END
