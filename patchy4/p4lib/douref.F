CDECK  ID>, DOUREF.
      SUBROUTINE DOUREF (MODEP)

C-    PRINT UREF'S, UNSATISFIED REFERENCES FROM THE CRADLE TO :
C-    MODE = 0   TRAILING ACTIONS INTO DECK JUST PROCESSED
C-         = 7   ACTIONS + SEQ INTO TRAILING DECKS OF PATCH JUST PROC.

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
      EQUIVALENCE                  (KACTEX,NVACT(4))
     +,                            (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
C--------------    END CDE                             -----------------  ------
      DIMENSION    MODEP(9)



      MODE = MODEP(1)
      IF (MODE.NE.0)         GO TO 31

C----              TRAILING ACTIONS INTO CURRENT DECK

   24 IF (JCWAIT.NE.JCARD)   GO TO 27
      IF (NVACT(1).LT.4)     GO TO 27
      CALL ACEXQ (-7)
      IF (LACTEX.NE.0)       GO TO 24
      RETURN

   27 LDPACT = KACTEX + 1
      JLS    = 1
      GO TO 63

C----              TRAILING DECKS OF CURRENT PATCH

   31 IF (LEXH.EQ.0)                   RETURN
      IF (JBIT(IQ(LEXP+1),5)  .NE.0)   RETURN                           -MSK
C     IF ((IQ(LEXP+1).AND.16) .NE.0)   RETURN                            MSKC
      LEXD = LEXH - 1

   34 LEXD = IQ(LEXD-1)
      IF (LEXD.EQ.0)         RETURN
      JLS = 3

C--                PRINT ONE BY ONE

   61 JLS    = JLS - 1
   62 LDPACT = LEXD - JLS
   63 LDPACT = IQ(LDPACT-1)
      IF (LDPACT.EQ.0)       GO TO 69
      IF (MOPTIO(21).NE.0)   GO TO 66
      IF (JBIT(IQ(LDPACT),18)     .EQ.0)   GO TO 63                     -MSK
C     IF ((IQ(LDPACT).AND.131072) .EQ.0)   GO TO 63                      MSKC
   66 MDEPAR = 6
      CALL DEPART
      GO TO 63

   69 IF (JLS.NE.1)          GO TO 61
      IF (MODE.NE.0)         GO TO 34
      RETURN
      END
