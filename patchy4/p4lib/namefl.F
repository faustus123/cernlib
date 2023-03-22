CDECK  ID>, NAMEFL.
      SUBROUTINE NAMEFL (IVECT,NAME)

C-    READ FILE-NAME FROM FIRST TITLE-CARD

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    IVECT(9),NAME(9)


      NAME(2) = IQBLAN                                                  -A8M
      CALL UBLOW (IVECT(1),IQUEST(1),16)
      CALL CCTOUP (IQUEST,16)
      L = 1

      IF (IQUEST(1).NE.IQLETT(3))  GO TO 14
      IF (IQUEST(2).NE.IQBLAN)     GO TO 18
   12 L = L + 1
      IF (L.GE.9)                  GO TO 18
   14 IF (IQUEST(L).EQ.IQBLAN)     GO TO 12

   18 N = IUFIND (IQBLAN,IQUEST(L),1,8) - 1
      CALL UBUNCH (IQUEST(L),NAME(1),N)
      RETURN
      END
