CDECK  ID>, QSORTI.
      SUBROUTINE QSORTI (JWORD,KGO)

C-    SORT BANKS AT KGO FOR WORDS IQ(L+JWORD) TO BE IN INCREASING ORDER

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------

      LL = LQ(KGO)
      IF (LL.EQ.0)           RETURN
      JW = JWORD

   11 LN = LQ(LL-1)
      IF (LN.EQ.0)           RETURN
      IF (IQ(LN+JW).LT.IQ(LL+JW))  GO TO 21
      LL = LN
      GO TO 11

C--                BANK  LN  OUT OF SEQUENCE

   21 LQ(LL-1)= LQ(LN-1)
      K = KGO

   24 L = LQ(K)
      IF (IQ(LN+JW).LT.IQ(L+JW))  GO TO 29
      K = L-1
      GO TO 24

C--                PLACE FOR BANK  LN  FOUND

   29 LQ(LN-1)= L
      LQ(K)   = LN
      GO TO 11
      END
