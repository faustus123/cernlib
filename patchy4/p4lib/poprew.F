CDECK  ID>, POPREW.
      SUBROUTINE POPREW

C-    CLOSE/REWIND CURRENT NEW

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +, KADRV(14),LADRV(11),LCCIX,LBUF,LLAST
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEX(20)
     +, NVINC(6),NVUTY(17),IDEOF(9),NVPROX(6),LOGLVG,LOGLEV,NVWARX(6)
     +, NVOLDQ(6), NVOLD(10), IDOLDV(10), NVARRI(12), NVCCP(10)
     +, NVNEW(7),NRTNEW,NRNEW,LLASTN, IDNEWV(8),JPDNEW,NDKNEW
     +, NVNEWL(3),NCDECK,JNEW,MODEPR,  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------


C--                CLOSE POPOFF BUFFER

      IF (IQ(LLAST+1).LT.0)  GO TO 31
      IQ(LBUF+3) = IDEOF(3)
      IQ(LBUF+4) = IDEOF(4)                                             -A8M
      IQ(LBUF+5) = 3
      IQ(LBUF+6) = 0

      IQ(LBUF+1) = -7
      CALL POPOFF

C--                FINAL REWIND

   31 IF (NRTNEW.LT.0)       RETURN
      CALL AUXFIL (512,NVNEW(1),0)
      RETURN
      END
