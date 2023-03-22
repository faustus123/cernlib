CDECK  ID>, MXACTD.
      SUBROUTINE MXACTD (INC)

C-    EVALUATE EXE-BITS FOR DELETED CARD 'JCARD+INC'

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
      EQUIVALENCE                  (KACTEX,NVACT(4))
     +,                            (LACTEX,NVACT(5)), (LACDEL,NVACT(6))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LACMD,LADRV(9))



      JCD = JCARD + INC
      LA  = IQ(LACMD+2)
      LE  = IQ(LACMD+3)

C--                POSITION TO FIRST DELETE OF CARD 'JCD'

   12 LW = IQ(LA)
      IF (JCD.LE.IQCC(LW+1)) GO TO 21
      LA = LA + 1
C     IF (LA.EQ.LE)          CALL QFATAL                                DEBUG
      IQ(LACMD+2)= LA
      GO TO 12

C--                LOGICAL .AND. OF ALL DELETES TO 'JCD'

   21 MX    = IQ(LW)
      LACDEL= LW
   22 LA = LA + 1
      IF (LA.EQ.LE)          GO TO 29
      LW = IQ(LA)
      IF (JCD.LT.IQCC(LW))   GO TO 29
      IF (JCD.GT.IQCC(LW+1)) GO TO 22
      MX = JBYTET (IQ(LW),MX,1,4)                                       -MSK
C     MX = MX .AND. IQ(LW)                                               MSKC
      GO TO 22

   29 CALL SBYTOR (MX,NVIMAT(5),1,4)                                    -MSK
C  29 NVIMAT(5)= NVIMAT(5) .OR. MX                                       MSKC
      RETURN
      END
