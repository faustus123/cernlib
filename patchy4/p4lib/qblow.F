CDECK  ID>, QBLOW.
      SUBROUTINE QBLOW (L)

C-    3 ROUT. FOR BLOWING, PACKING, LOCATING THE BANK-NAME
C-    FORTRAN VERSION FOR MINIMAL PACKING,  WORD-SIZE 32 BITS OR MORE

      COMMON /QCN/   IQLS,IQID,IQNL,IQNS,IQND,IQFOUL
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------



      IQID = LQ(L)
      IQNL = JBYT (LQ(L+1),22,9)
      IQNS = JBYT (LQ(L+1),16,6)
      IQND = JBYT (LQ(L+1),1,15)
      IQLS = L + IQNL + 2
      RETURN
      END
