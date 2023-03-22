CDECK  ID>, LQLONG.
      FUNCTION LQLONG (NTEXT,ITEXT,JWORD,KSTART,KFOUND)

C-    FIND BANK CONTANING ITEXT(1-NTEXT) IN WORDS JWORD,..,JWORD+NTEXT-1
C-    SEARCH LINEAR STRUCTURE ATTACHED AT LQ(KSTART)
C-    RETURN BANK-ADR AS VALUE, ITS K-ADR IN KFOUND

      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    ITEXT(9)

      N2= NTEXT  - 2
      L = KSTART + 1
    9 K = L-1
      L = LQ(K)
      IF (L.EQ.0)                   GO TO 29
      IF (IQ(L+JWORD).NE.ITEXT(1))  GO TO 9
      IF  (N2)     29,24,14

   14 LB = L + JWORD - 1
      DO 16 J=2,NTEXT
      IF (IQ(LB+J).NE.ITEXT(J))     GO TO 9
   16 CONTINUE
      GO TO 29

   24 IF (IQ(L+JWORD+1).NE.ITEXT(2))  GO TO 9
   29 KFOUND= K
      LQLONG= L
      RETURN
      END
