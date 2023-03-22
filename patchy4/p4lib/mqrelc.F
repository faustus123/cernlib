CDECK  ID>, MQRELC.
      SUBROUTINE MQRELC

C-    GARBAGE COLLECTOR - RELOCATOR

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
      EQUIVALENCE (LS,IQLS), (LSSV,QUEST(21))



      LSTOP = LQ(LQMTE+4)
      LFIX  = LQ(LQTE+3)
      IFLBR = LQ(LQTB-1)
      LKEEP = LQ(LQTB-2)
      NENTR = (LQTE-LQTB) / 3
      IF (LQ(LQMTB-3).NE.0)  GO TO 14
      LMTB = LQMTB
      IF (NENTR)             52,42,22

C--------------    TRIGGER STRUCTURAL LOW-END LINKS

   14 L1   = 0
      L2   = 0
      LN   = 0
      LDEAD= 0
      LS   = NQSYSS + 1
      GO TO 19

C--                TRIGGER REF + STRUCTURAL PERMANENT LINKS
   16 L1   = L1 - 1
      IF (L1.EQ.NQSYSL)      GO TO 17
      IF (NQSYSR.EQ.NQSYSL)  GO TO 17
      L2   = NQSYSR + 1
      LS   = NQSYSL + 1
      GO TO 19
C--                TRIGGER WORKING SPACE LINKS
   17 LS   = NQLINK + 1
      L2   = LS
      LMTB = LQMTB-3
      LN   = LQ(LMTB)
      LDEAD= LQ(LMTB+1)
   19 IF (NENTR)             54,44,24

C--------------    2 OR MORE RELOCATION INTERVALS       -------------

C------            NEXT BANK,  CHECK IF DEAD GROUP

   21 IF (LN.GE.LSTOP)  RETURN
      IF (LN.NE.LDEAD)  GO TO 23
      IF (LN.EQ.0)      GO TO 16
      LMTB = LMTB + 3
   22 LN   = LQ(LMTB)
      LDEAD= LQ(LMTB+1)
      GO TO 21

C--                NEXT BANK,  ALIVE

   23 CALL QBLOW (LN)
      L2 = LS - IQNS
      L1 = LN +        NQNAMD
      LN = LS + IQND + 1

C----              NEXT LINK

   24 L1 = L1 + 1
      IF (L1.EQ.LS)  GO TO 21
      LFIRST= LQ(L1)
   25 LINK  = LQ(L1)
      IF (LINK.GE.LFIX  ) GO TO 24
      IF (LINK.LT.LKEEP ) GO TO 24

      IF (LINK.LT.LQ(LQTB))  GO TO 31
      JLOW = 0
      JHI  = NENTR + 1

C--                BINARY SEARCH IN RELOCATOR TABLE

   27 JEX = (JHI+JLOW) / 2
      IF (JEX.EQ.JLOW)             GO TO 29
      IF (LINK.GE.LQ(LQTB+3*JEX))  GO TO 28
      JHI  = JEX
      GO TO 27

   28 JLOW = JEX
      GO TO 27

   29 JTB = LQTB + 3*JLOW
      IF (LINK.GE.LQ(JTB+1))     GO TO 31
      LQ(L1) = LINK + LQ(JTB+2)
      GO TO 24

C--                BRIDGING FOR DEAD, STRUCTURAL LINK
   31 IF (L1.LT.L2)       GO TO 38
      IF (IFLBR.EQ.0)     GO TO 38
      IF (JBYT(LQ(LINK),IQSTRU,NQSTRU).EQ.0)  GO TO 38
      LQ(L1)= LQ(LINK-1)
      IF (LQ(L1).NE.LFIRST) GO TO 25

   38 LQ(L1)= 0
      GO TO 24

C--------------    1 RELOCATION INTERVAL ONLY           -------------

C------            NEXT BANK,  CHECK IF DEAD GROUP

   41 IF (LN.GE.LSTOP)       RETURN
      IF (LN.NE.LDEAD)       GO TO 43
      IF (LN.EQ.0)           GO TO 16
      LMTB = LMTB + 3
   42 LN   = LQ(LMTB)
      LDEAD= LQ(LMTB+1)
      GO TO 41

C--                NEXT BANK,  ALIVE

   43 CALL QBLOW (LN)
      L2 = LS - IQNS
      L1 = LN +        NQNAMD
      LN = LS + IQND + 1

C----              NEXT LINK

   44 L1 = L1 + 1
      IF (L1.EQ.LS)          GO TO 41
      LFIRST= LQ(L1)
   45 LINK  = LQ(L1)
      IF (LINK.GE.LFIX  )    GO TO 44
      IF (LINK.LT.LKEEP )    GO TO 44

      IF (LINK.LT.LQ(LQTB))      GO TO 47
      IF (LINK.GE.LQ(LQTB+1))    GO TO 47
      LQ(L1) = LINK + LQ(LQTB+2)
      GO TO 44

C--                BRIDGING FOR DEAD, STRUCTURAL LINK
   47 IF (L1.LT.L2)          GO TO 48
      IF (IFLBR.EQ.0)        GO TO 48
      IF (JBYT(LQ(LINK),IQSTRU,NQSTRU).EQ.0)  GO TO 48
      LQ(L1)= LQ(LINK-1)
      IF (LQ(L1).NE.LFIRST)  GO TO 45

   48 LQ(L1)= 0
      GO TO 44

C--------------    NO RELOCATION INTERVAL               ----------------

C------            NEXT BANK,  CHECK IF DEAD GROUP

   51 IF (LN.GE.LSTOP)  RETURN
      IF (LN.NE.LDEAD)  GO TO 53
      IF (LN.EQ.0)      GO TO 16
      LMTB = LMTB + 3
   52 LN   = LQ(LMTB)
      LDEAD= LQ(LMTB+1)
      GO TO 51

C--                NEXT BANK,  ALIVE

   53 CALL QBLOW (LN)
      L2 = LS - IQNS
      L1 = LN +        NQNAMD
      LN = LS + IQND + 1

C----              NEXT LINK

   54 L1 = L1 + 1
      IF (L1.EQ.LS)  GO TO 51
   55 LINK= LQ(L1)
      IF (LINK.GE.LFIX)  GO TO 54
      IF (LINK.LT.LKEEP) GO TO 54
      IF (L1.LT.L2)      GO TO 58
      IF (IFLBR.EQ.0)    GO TO 58
      IF (JBYT(LQ(LINK),IQSTRU,NQSTRU).EQ.0)  GO TO 58

C--                BRIDGING FOR DEAD, STRUCTURAL LINK
      LFIRST= LINK
   57 LINK  = LQ(LINK-1)
      IF (LINK.GE.LFIX  ) GO TO 59
      IF (LINK.LT.LKEEP)  GO TO 59
      IF (LINK.NE.LFIRST) GO TO 57

   58 LQ(L1)= 0
      GO TO 54

   59 LQ(L1)= LINK
      GO TO 54

C----              FATAL EXIT
      END
