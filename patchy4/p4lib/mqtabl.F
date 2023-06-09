CDECK  ID>, MQTABL.
      SUBROUTINE MQTABL

C-    GARBAGE COLLECTOR - RELOCATION TABLE BUILDING

      PARAMETER      (NQFNAE=2, NQFNAD=1, NQFNAU=3)
      PARAMETER      (IQFSTR=19, NQFSTR=6,  IQFSYS=25, NQFSYS=8)
      COMMON /MQCF/  NQNAME,NQNAMD,NQNAMU, IQSTRU,NQSTRU, IQSYSB,NQSYSB
      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /MQCT/  IQTBIT,IQTVAL,LQTA,LQTB,LQTE,LQMTB,LQMTE,LQMTH
     +,              IQPART,NQFREE
      COMMON /QCN/   IQLS,IQID,IQNL,IQNS,IQND,IQFOUL
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
C--------------    END CDE                             -----------------  ------
      DIMENSION    IVMQCM(10)
      EQUIVALENCE (IVMQCM(1),NQSYSR)
      EQUIVALENCE (LS,IQLS)



      LGO   = LQTB
      LHALT = LQTE
      LQTA  = LQWORK
      LQTB  = LQTA + 3
      NQFREE= 0
      IQPART= 0

C--                BUILD TABLE FOR LOW BANKS

      IF (LQWORG.EQ.LQWORK)  GO TO 12
      IF    (LGO.GE.LQWORK)  GO TO 12
      LQTE = LQTA
      LN   = LQWORG
      LSTOP= LQWORK
      MODE = IQTVAL
      LIMIT= LQSTA - 8
      GO TO 24

C--                BUILD TABLE FOR HIGH BANKS

   12 LQ(LQTA+1)= LQWORK
      LQTE = LQTB
   14 LQMTH= LQTE
      LN   = LQSTA
      LSTOP= LHALT
      MODE = 1-IQTVAL
      NEW  = MODE
      LIMIT= LQSTA - 5
      IF (LHALT.GE.LQSTA)    GO TO 24
      LQ(LQTE)= LQSTA
      LQTE = LQTE - 3
      GO TO 71

C------            NEXT BANK

   21 MODE= NEW
   22 LN  = LS + IQND + 1
   24 IF (LN.GE.LSTOP)  GO TO 39
      CALL QBLOW (LN)
      NEW = JBIT (IQ(LS),IQTBIT)
      IF (NEW.EQ.MODE)    GO TO 22
      IF (NEW.EQ.IQTVAL)  GO TO 36

C--                START OF A DEAD GROUP
      LQ(LQTE+1)= LN
      LQTE= LQTE + 3
      GO TO 21

C--                START OF A LIVE GROUP
   36 LQ(LQTE)= LN
      IF (LQTE.LT.LIMIT)  GO TO 21
      IQPART= 1

C------            END OF TABLE, LOW OR HIGH
C--                COMPUTE RELOCATION CONSTANTS, LOW BANKS

   39 IF (LSTOP.NE.LQWORK)  GO TO 61
      IF  (LQTE.EQ.LQTA)    GO TO 12
      IF   (NEW.NE.IQTVAL)  GO TO 42
      LQ(LQTE+1)= LQWORK
      LQTE = LQTE + 3
   42 LQ(LQTE)= LQWORK
      DO 44 JTB=LQTB,LQTE,3
      NQFREE= NQFREE + LQ(JTB) - LQ(JTB-2)
   44 LQ(JTB+2)= -NQFREE
      GO TO 14

C--                COMPUTE RELOCATION CONSTANTS, HIGH BANKS

   61 IF (NEW.NE.IQTVAL)  LQ(LQTE)=LSTOP
      LQTE= LQTE-3
      NF  = 0
      IF (LQTE.LT.LQMTH)  GO TO 65
      JTB= LQTE

      DO 64 J= LQMTH,LQTE,3
      NF = NF + LQ(JTB+3) - LQ(JTB+1)
      LQ(JTB+2)= NF
   64 JTB   = JTB - 3
   65 NQFREE= NQFREE + NF + LQ(LQMTH)-LQSTA

   71 LQ(LQTA)  = LQWORG
      LQ(LQTA+2)= 3
      LQ(LQTE+4)=  MAX (LQFIX,LSTOP)
      LQMTB= LQTB
      LQMTE= LQTE
      RETURN

C----              FATAL EXIT
      END
