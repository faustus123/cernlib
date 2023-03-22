CDECK  ID>, QNAME.
      SUBROUTINE QNAME (LS,NAME)
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    NAME(4)



      L = LS
   12 L = L-1                                                           -B48M
      IF (LQ(L).GE.0)  GO TO 12                                         -B48M
C     L = L - JBYT(IQ(L),34,9) - 1                                       B48M
      NAME(1)= LQ(L-1)
      NAME(2)= JBYT (LQ(L),22,9)
      NAME(3)= JBYT (LQ(L),16,6)
      NAME(4)= JBYT (LQ(L),1,15)
      RETURN
      END
