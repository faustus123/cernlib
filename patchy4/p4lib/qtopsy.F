CDECK  ID>, QTOPSY.
      SUBROUTINE QTOPSY (KGO)

C-    INVERT ORDER OF BANKS IN A LINEAR STUCTURE

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------

      LN = LQ(KGO)
      L  = 0
   11 IF (LN.EQ.0)           GO TO 21
      LL = L
      L  = LN
      LN = LQ(L-1)
      LQ(L-1)= LL
      GO TO 11

   21 LQ(KGO)= L
      RETURN
      END
