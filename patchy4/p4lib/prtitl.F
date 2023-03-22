CDECK  ID>, PRTITL.
      SUBROUTINE PRTITL

C-    HANDLE OLD OR NEW TITLE FOR PRINTING

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /MODTT/ NMODTT,JMODTT(6),TEXTTT(10)
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
     +, NVNEW(7),NRTNEW,NRNEW,LLASTN, IDNEWV(8),JPDNEW,NDKNEW
     +, NVNEWL(3),NCDECK,JNEW,MODEPR,  MWK(80),MWKX(80)
C--------------    END CDE                             -----------------  ------


      IQ(LBUF+3)= IDEOF(3)
      IQ(LBUF+4)= IDEOF(4)                                              -A8M
      LA = IQ(LBUF-2) + IQ(LBUF+13)
      CALL UBLOW (IQ(LA),MWKX(1),80)
      IF (MODEPR.EQ.IQMINS)  GO TO 44

      CALL UCOPY (IDEOF(1),IDNEWV(1),8)
      CALL NAMEFL (IQ(LA),IDNEWV(5))
      NDKNEW = 100 * ( (NDKNEW+99)/100 )
      CALL UBLOW (IQ(LA),MWK(1),80)

      IF (MODEPR.EQ.IQPLUS)  GO TO 41
      IF (MOPTIO(1).EQ.0)    GO TO 41

C-----             UPDATE VERSION NUMBER

      JS = IUCOMP (IQSLAS,MWK(1),60)
      IF (JS.NE.0)           GO TO 24
      JS = IUCOMP (IQDOT,MWK(1),60)
      IF (JS.EQ.0)           GO TO 41


C--                READ OLD VERSION NUMBER

   24 J  = JS
      N  = 0
   25 J  = J + 1
      JV = IUCOMP (MWK(J),IQNUM(1),10) - 1
      IF (JV.LT.0)           GO TO 26
      N = N + 1
      IQUEST(N+10)= JV
      GO TO 25

   26 IF (N.EQ.0)            GO TO 29
      JT = 11
      J  = N
   27 IQUEST(J+10)= IQUEST(J+10) + 1
      IF (IQUEST(J+10).LT.10)  GO TO 31
      IQUEST(J+10)= 0
      J = J - 1
      IF (J.NE.0)            GO TO 27
   29 IQUEST(10)= 1
      N  = N + 1
      JT = 10

C--                WRITE NEW VERSION NUMBER/DATE/TIME

   31 JP = JS + 1
   33 J  = IQUEST(JT)
      MWK(JP)= IQNUM(J+1)
      JT = JT + 1
      JP = JP + 1
      N  = N  - 1
      IF (N.NE.0)  GO TO 33

      MWK(JP)  = IQBLAN
      MWK(JP+1)= IQBLAN
      CALL UBLOW (DAYTIM(1),MWK(JP+2),12)
      IF (NMODTT.EQ.0)       GO TO 39


C--                MODIFY TITLE CARD ACCORDING TO
C--                +OPTION, MODIF, C=C1-C2,...,C5-C6.TEXT

C  36 CALL UBLOW (TEXTTT(1),MWKX(1),80)                                  A8M
   36 CALL UBLOW (TEXTTT(1),MWKX(1),40)                                 -A8M
      JS = 0
      JT = 1

   37 JS = JS + 1
      JP = JMODTT(JS)
      N  = JMODTT(JS+3)
      CALL UCOPY (MWKX(JT),MWK(JP),N)
      JT = JT + N
      IF (JS.NE.NMODTT)      GO TO 37
      CALL UBLOW (IQ(LA),MWKX(1),80)

C--                PRINT TITLE(S)

   39 CALL UBUNCH (MWK(1),IQ(LA),80)
      WRITE (IQPRNT,9041) NDKNEW,IQPLUS,MWK
      MUSE = IQBLAN
      GO TO 45

   41 IF (NMODTT.NE.0)       GO TO 36
      WRITE (IQPRNT,9041) NDKNEW,MODEPR,MWKX
      GO TO 49
   44 MUSE = IQNUM(1)
   45 WRITE (IQPRNT,9044) MUSE,MWKX
   49 WRITE (IQPRNT,9049)
      RETURN

 9041 FORMAT (1X/14H     P=*TITLE*,I6,1X,A2,4H--- ,80A1)
 9044 FORMAT (A1,6X,7H*TITLE*,7X,1H-,5X,80A1)
 9049 FORMAT (1X)
      END
