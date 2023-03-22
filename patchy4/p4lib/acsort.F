CDECK  ID>, ACSORT.
      SUBROUTINE ACSORT

C-    READY ACTION BANKS FOR CURRENT DECK
C-    CALLED FROM DODECK WHEN PROCESSING OF A NEW DECK IS STARTED

      COMMON /MQCMOV/NQSYSS
      COMMON /MQCM/         NQSYSR,NQSYSL,NQLINK,LQWORG,LQWORK,LQTOL
     +,              LQSTA,LQEND,LQFIX,NQMAX, NQRESV,NQMEM,LQADR,LQADR2
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      PARAMETER      (IQBDRO=25, IQBMAR=26, IQBCRI=27, IQBSYS=31)
      COMMON /QBITS/ IQDROP,IQMARK,IQCRIT,IQZIM,IQZIP,IQSYS
                         DIMENSION    IQUEST(30)
                         DIMENSION                 LQ(99), IQ(99), Q(99)
                         EQUIVALENCE (QUEST,IQUEST),    (LQUSER,LQ,IQ,Q)
      COMMON //      QUEST(30),LQUSER(7),LQMAIN,LQSYS(24),LQPRIV(7)
     +,              LQ1,LQ2,LQ3,LQ4,LQ5,LQ6,LQ7,LQSV,LQAN,LQDW,LQUP
     +, KADRV(9), LEXD,LEXH,LEXP,LPAM,LDECO, LADRV(14)
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEB(14),MEXDEC(6)
     +, NVINC(6),NVUTY(16),NVIMAT(6),NVACT(6),NVGARB(6),NVWARN(6)
     +, JASK,JCWAIT,JCWDEL,LARMAT,LAREND,NCARR
     +, NVARR(10), IDARRV(8),JPROPD,MODPAM, NVARRI(11),LINBUF,NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
      EQUIVALENCE                  (KACTEX,NVACT(4))
     +,                            (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
C--------------    END CDE                             -----------------  ------
      DIMENSION    LACVH(2), LACV(2), NV(2), JRV(2)
      EQUIVALENCE (LADRV(9),LACV(1)), (LADRV(11),LACVH(1))
      EQUIVALENCE (NDEL,NV(1)), (NNIL,NV(2))
      EQUIVALENCE (JRDEL,JRV(1)), (JRNIL,JRV(2))

      DIMENSION    JACTTR(5), BIAS(3), MMV(4,2)


      DATA  JACTTR /1,2,2,1,3/,   BIAS /-.25, 0., .375/
      DATA  MMV    /4HACMD,0,0,2H**,4HACNL,0,0,2H**/


C---------         CONSTRUCT SUMMARY LIST, REMEMBER TIME-SEQUENCE
C--                LIST ENTRY     L+2  L OF ACTION BANK
C--                               L+1  J-ACTION = 1 ADB, 2 REP, 3 ADD
C--                                                   ( +4 IF NIL )
C--                               L+0  ACTION CARD NUMBER + FRACTION
C--                               L-1  L OF NEXT

      NVUSEB(12) = 0

      JCWDEL = 0
      IF (LEXD.EQ.0)         GO TO 88
      KACTEX = LEXD-2
      LACTEX = IQ(KACTEX)
      IF (LACTEX.EQ.0)       GO TO 81
      LIMIT  = LQWORK+20
      KST    = LQSTA-1
      L      = KST
      IQ(L-5)= 0

   12 IF (L.LT.LIMIT)        GO TO 97
      L    = L - 4
      JACT = JBYT (IQ(LACTEX),7,3)
      JACT = JACTTR(JACT)
      Q(L) = FLOAT(IQCC(LACTEX)) + BIAS(JACT)
      IF (JBIT(IQ(LACTEX),10).EQ.0)  GO TO 14
      JACT = JACT + 4
      Q(L) = Q(L) + .125
   14 IQ(L+1)= JACT
      IQ(L+2)= LACTEX
      IQ(L-5)= L
      LACTEX = IQ(LACTEX-1)
      IF (LACTEX.NE.0)       GO TO 12
      IQ(KST)= L
      LIMIT = L-4

C--                SORT THE LIST FOR ACTION-CARD NO.

      CALL QSORT (0,KST)

C---------         SCAN FOR CLASH

      KDONE = KST
      NDEL  = 0
      NNIL  = 0
      CNDEL = -1.


C--                NEXT BANK IN SCAN

   24 L = IQ(KDONE)
      IF (L.EQ.0)            GO TO 61
      CN  =  Q(L)
      JM  = IQ(L+1)
      LW  = IQ(L+2)
      LEV = 1
      IF (CN.LT.CNDEL)       GO TO 41

C--                IF +DEL OR +REPL,  SET TOTAL DELETE RANGE

      IF (JM.GE.4)           GO TO 34
      IF (JM.NE.2)           GO TO 36
      NDEL = NDEL + 1
      LDEL = L
      LACT = LW
      CNDA = FLOAT(IQCC(LACT+1)) + .25
      CNDEL= CNDA
      CNDT = CNDEL
      LN   = L

   32 LN = IQ(LN-1)
      IF (LN.EQ.0)           GO TO 39
      IF (Q(LN).GE.CNDT)     GO TO 39
      IF (IQ(LN+1).NE.2)     GO TO 32
      LA   = IQ(LN+2)
      CNDT =  MAX  (CNDT,FLOAT(IQCC(LA+1))+.25)
      GO TO 32

C--                COUNT NIL DELETE-BANKS

   34 IF (JM.NE.6)           GO TO 39
      NNIL = NNIL + 1
      GO TO 39
C--                CHECK NEXT ACTION ON SAME CARD

   36 IF (NVOPER(1).GE.2)    GO TO 39
      LN = IQ(L-1)
      IF (LN.EQ.0)           GO TO 39
      IF (Q(LN)-CN .GE. 0.1) GO TO 39
      LACT = IQ(LN+2)
      GO TO 38

C--                CURRENT BANK DONE

   37 IF (LEV.LT.NVOPER(1))  GO TO 39
   38 J = LEV + 12
      CALL SBIT1 (IQ(LACT),J)
      CALL SBIT1 (IQ(LW),  J)
   39 KDONE= L - 1
      GO TO 24


C-----             ACTION ON DELETED CARD

C--                FIND CORRECT DEL-BANK

   41 IF (JM.GE.4)           GO TO 56
      CALL SBIT1 (IQ(LW),11)
   42 IF (CN.LT.CNDA)        GO TO 45
   44 LDEL = IQ(LDEL-1)
      IF (IQ(LDEL+1).NE.2)   GO TO 44
      LACT = IQ(LDEL+2)
      CNDA = FLOAT(IQCC(LACT+1)) + .25
      GO TO 42

C--                SERIOUS:  DELETED EARLIER THAN DELETED

   45 IF (L.LT.LDEL)         LEV=3
      IF (JM.EQ.2)           GO TO 46
      IF (LEV.LT.NVOPER(1))  GO TO 59
      CALL SBYT (0,IQ(LW),1,4)
      GO TO 38

C--                PARTIALLY OVERLAPPING DELETE-RANGE

   46 NDEL = NDEL + 1
      CE   = IQCC(LW+1)
      IF (CE.LT.CNDEL)       GO TO 47
      CNDEL = CE + .25
      LEV   = MAX  (LEV,2)
      GO TO 37

C--                FULLY OVERLAPPING DELETE-RANGE

   47 CE   = CE -.25
      LN   = LDEL
   48 IF (IQ(LN+1).NE.2)     GO TO 49
      LA   = IQ(LN+2)
      IF (CE.GE.FLOAT(IQCC(LA+1)))  GO TO  49
      MX   = JBYTET (IQ(LW),IQ(LA),1,4)                                 -MSK
C     MX   = IQ(LW) .AND. IQ(LA)                                         MSKC
      CALL SBYT (MX,IQ(LW),1,4)
   49 LN = IQ(LN-1)
      IF (LN.NE.L)           GO TO 48
      GO TO 37


C--                DELETED NIL ACTION

   56 IF (JM.NE.6)           GO TO 59
      IF (FLOAT(IQCC(LW+1)).LT.CNDT)  GO TO 59
      IQCC(LW)= CNDT + 1.
      Q(L)= FLOAT (IQCC(LW)) + .125
      CALL QSORT (0,KDONE)
      GO TO 24

C--                DE-LINK FULLY DELETED, NON-WARNING BANK

   59 IQ(LW-1)  = LQUSER(5)
      LQUSER(5) = LW
      IQ(KDONE) = IQ(L-1)
      GO TO 24

C---------         READY  ACMD & ACNL  BANKS

   61 JV  = 0
   62 JV  = JV+1
      L   = 0
      N   = NV(JV)
      IF (N.EQ.0)            GO TO 65
      N = N + 3
      L = LACVH(JV)
      IF (L.EQ.0)            GO TO 63
      IF (IQ(L+1).GE.N)      GO TO 64
      CALL SBIT1 (IQ(L),IQDROP)
   63 NN = MAX  (N,43)
      MMV(4,JV)= NN
      CALL LIFTBK (L,0,0,MMV(1,JV),0)
      IF (LQWORK.GE.LIMIT)   GO TO 97
      IQ(L+1) = NN
      LACVH(JV)= L
   64 JRV(JV)= L+3
      IQ(L+2)= L+4
      IQ(L+3)= L+N +1
   65 LACV(JV)= L
      IF (JV.EQ.1)           GO TO 62
      NVGARB(2) = MAX  (NVGARB(2),NVGARB(1)-(LIMIT-LQWORK))

C---------         RE-LINK BANKS IN EXECUTION ORDER

C--                BUMP CARD-COUNT FOR  +ADD
C--                CONSTRUCT MULTI-DELETE INDEX BANK  ACMD
C--                CONSTRUCT   NIL-DELETE INDEX BANK  ACNL

      KACT  = KACTEX
      L     = IQ(KST)

   72 JM    = IQ(L+1)
      LACT  = IQ(L+2)
      IQ(KACT)= LACT
      IF (JM-3)              75,73,74

C--                +ADD

   73 IQCC(LACT)= IQCC(LACT) + 1
      GO TO 79

C--                NIL  +REP, +DEL

   74 IF (JM.NE.6)           GO TO 79
      JRNIL= JRNIL + 1
      IQ(JRNIL)= LACT
      GO TO 79

C--                +REPL, +DEL

   75 IF (JM.NE.2)           GO TO 79
      JRDEL = JRDEL + 1
      IQ(JRDEL)= LACT

   79 KACT = LACT - 1
      L    = IQ(L-1)
      IF (L.NE.0)            GO TO 72
      IQ(KACT)= 0


C-----             CONSTRUCT EXE-BITS FOR SELF-MATERIAL

      LGO = IQ(LEXD-2)
      GO TO 82
   81 LGO = IQ(LEXD-3)
   82 L   = LGO
      IF (L.EQ.0)            GO TO 84

   83 IF (JBIT(IQ(L),5) .NE.0)  CALL ACXREF (L,NVUSEB(12))              -MSK
C  83 IF ((IQ(L).AND.16).NE.0)  CALL ACXREF (L,NVUSEB(12))               MSKC

      CALL SBYTOR (IQ(L),NVUSEB(12),1,4)                                -MSK
C     NVUSEB(12)= NVUSEB(12) .OR. IQ(L)                                  MSKC
      L = IQ(L-1)
      IF (L.NE.0)            GO TO 83

   84 IF (LGO.NE.IQ(LEXD-3)) GO TO 81

      CALL SBYTOR (NVUSEB(12),NVUSEB(10),1,4)                           -MSK
C     NVUSEB(10)= NVUSEB(10) .OR. NVUSEB(12)                             MSKC

      LACTEX= IQ(KACTEX)
      IF (LACTEX.EQ.0)       GO TO 88
      NVACT(3)= JBYT (IQ(LACTEX),7,12)
      NVACT(2)= JBYT (NVACT(3),1,4)                                     -MSK
C     NVACT(2)= NVACT(3) .AND. 15                                        MSKC
      NVACT(1)= JBYT (NVACT(3),1,3)                                     -MSK
C     NVACT(1)= NVACT(3) .AND. 7                                         MSKC
      JCWAIT= IQCC(LACTEX)
      RETURN

C--                DECK WITH NO ACTIONS

   88 JCWAIT= LARGE
      LACTEX= 7
      RETURN

C-----             NOT ENOUGH SPACE FOR THE TABLE

   97 CONTINUE
      CALL NOMEM
      RETURN
      END
