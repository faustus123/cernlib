CDECK  ID>, MXACTN.
      SUBROUTINE MXACTN (INC)

C-    EVALUATE EXE-BITS FOR ACCEPTED CARD 'JCARD+INC' IF COVERED BY
C-    NIL-DELETE

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
     +, NVARRQ(6),NVARR(10),IDARRV(10),NVARRI(12),NVCCP(10)
     +, NVDEP(19),MDEPAR,NVDEPL(6),  MWK(80),MWKX(80)
                                 DIMENSION     IQMSQ(99),IQCC(99)
                                 EQUIVALENCE  (IQMSQ(1), IQCC(3), IQ(6))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LACNL,LADRV(10))


      JCD = JCARD + INC
      LA  = IQ(LACNL+2)
      LE  = IQ(LACNL+3)

C--                POSITION TO FIRST NIL-DELETE OF CARD 'JCD'

   12 LW = IQ(LA)
      IF (JCD.LT.IQCC(LW))   RETURN
      IF (JCD.LE.IQCC(LW+1)) GO TO 21
      LA = LA + 1
      IQ(LACNL+2)= LA
      IF (LA.NE.LE)          GO TO 12
   14 LACNL= 0
      RETURN

C--                LOGICAL .OR. OF ALL NIL-DELETES ON 'JCD'

   21 CALL SBYTOR (IQ(LW),NVIMAT(5),1,4)                                -MSK
C  21 NVIMAT(5)= NVIMAT(5) .OR. IQ(LW)                                   MSKC
   22 LA = LA + 1
      IF (LA.EQ.LE)          RETURN
      LW = IQ(LA)
      IF (JCD.LT.IQCC(LW))   RETURN
      IF (JCD.GT.IQCC(LW+1)) GO TO 22
      GO TO 21
      END
