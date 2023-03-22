CDECK  ID>, SETID.
      SUBROUTINE SETID (IDV)

C-    SET PATCH/DECK IDENTIFIERS INTO IDV
C-    FROM  IDV    IF IDV(1) .EQ. ZERO
C-    FROM  NVARRI IF IDV(1) .NE. ZERO

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
     +, KADRV(14),LADRV(11),LCCIX,LBUF,LLAST
     +, NVOPER(6),MOPTIO(31),JANSW,JCARD,NDECKR,NVUSEX(20)
     +, NVINC(6),NVUTY(17),IDEOF(9),NVPROX(6),LOGLVG,LOGLEV,NVWARX(6)
     +, NVOLDQ(6), NVOLD(10), IDOLDV(10), NVARRI(12), NVCCP(10)
     +, NVNEW(10), IDNEWV(10), NVNEWL(6),  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------
      DIMENSION    IDV(9)


      IF (IDV(1).EQ.0)       GO TO 14
      IDV(9) = NVARRI(3)
      IDV(7) = NVARRI(5)
      IDV(8) = NVARRI(6)                                                -A8M

C--                DECK

   14 IF (IDV(9).NE.1)       GO TO 18
      IDV(1) = IDV(7)
      IDV(2) = IDV(8)                                                   -A8M
      RETURN

C--                PATCH

   18 IDV(1) = IQBLAN
      IDV(2) = IQBLAN                                                   -A8M
      IDV(3) = IDV(7)
      IDV(4) = IDV(8)                                                   -A8M
      RETURN
      END
