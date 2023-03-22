CDECK  ID>, KQLAST.
      FUNCTION KQLAST (KGO)

C--   FIND THE END OF A LINEAR STRUCTURE ATTACHED TO  LQ(KGO)

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------


      L = KGO + 1
    9 K = L-1
      L = LQ(K)
      IF (L.NE.0)  GO TO 9
      KQLAST= K
      RETURN
      END
