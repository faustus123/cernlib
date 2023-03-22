CDECK  ID>, LQFIND.
      FUNCTION LQFIND (ITEXT,JWORD,KSTART,KFOUND)

C-    FIND BANK CONTAINING ITEXT IN WORD JWORD
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


      L = KSTART + 1
    9 K = L-1
      L = LQ(K)
      IF (L.EQ.0)                GO TO 29
      IF (IQ(L+JWORD).NE.ITEXT)  GO TO 9
   29 KFOUND= K
      LQFIND= L
      RETURN
      END
