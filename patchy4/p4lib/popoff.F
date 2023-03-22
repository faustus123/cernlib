CDECK  ID>, POPOFF.
      SUBROUTINE POPOFF

C-    DRIVE NEXT COMPACT BINARY RECORD TO 'NEW', WITH DOUBLE BUFFERING
C-    FOR LOOK-AHEAD INFORMATION

      COMMON /QBCD/  IQNUM2(11),IQLETT(26),IQNUM(10),IQPLUS
     +,              IQMINS,IQSTAR,IQSLAS,IQOPEN,IQCLOS,IQDOLL,IQEQU
     +,              IQBLAN,IQCOMA,IQDOT,IQAPO,  IQCROS
      COMMON /QUNIT/ IQREAD,IQPRNT,IQPR2,IQLOG,IQPNCH,IQTTIN,IQTYPE
     +,              IQDLUN,IQFLUN,IQHLUN,IQCLUN,  NQUSED
      COMMON /CONST/ MPAK2(2),MPAK5(2),MPAK9(2),MPAK15(2),DAYTIM(3)
     +,              NWNAME,NWSENM,NWSEN1,LARGE
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
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
      DIMENSION      IDD(2),             IDP(2),             IDF(2)
      EQUIVALENCE
     +       (IDD(1),IDNEWV(1)), (IDP(1),IDNEWV(3)), (IDF(1),IDNEWV(5))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (LUNEW,NVNEW(1))

C9043 FORMAT (5X,2HP=,A8,   I5,1X,A2,2HD=)                               A8M
C9043 FORMAT (5X,2HP=,A6,A2,I5,1X,A2,2HD=)                               A6
C9043 FORMAT (5X,2HP=,A5,A3,I5,1X,A2,2HD=)                               A5
 9043 FORMAT (5X,2HP=,2A4,  I5,1X,A2,2HD=)                               A4
C9044 FORMAT (15X,I5,1X,A2,2HD=,A8)                                      A8M
C9044 FORMAT (15X,I5,1X,A2,2HD=,2A6)                                     A6
C9044 FORMAT (15X,I5,1X,A2,2HD=,2A5)                                     A5
 9044 FORMAT (15X,I5,1X,A2,2HD=,2A4)                                     A4


      IF (IQ(LLAST+1))       41,21,24

C----              COMPLETE PENDING RECORD AT  LLAST

   21 IQ(LLAST+7) = IQ(LBUF+5)
      IQ(LLAST+8) = IQ(LBUF+6)
      LA = IQ(LLAST-2)
      IQ(LA+1) = IQ(LBUF+3)
      IQ(LA+2) = IQ(LBUF+4)                                             -A8M
      CALL PKBYT (IQ(LLAST+5),IQ(LA+3),1,4,MPAK2(1))                    -A8M
C     CALL PKBYT (IQ(LLAST+5),IQ(LA+2),1,4,MPAK2(1))                     A8M


C--                TRANSMIT COMPLETED RECORD

   24 LDO = LLAST
   25 LA  = IQ(LDO-2)
      LE  = LA + IQ(LA)
      CALL XOUTB (LUNEW,IQ(LA+1),IQ(LA))
      NRNEW = NRNEW + 1
      IQ(LDO+1)= -7
      IQ(LDO+3)= 0
      IQ(LDO+4)= 0                                                      -A8M

C-------           HANDLE NEW RECORD

   41 IF (IQ(LBUF+1).LT.0)   RETURN
      LDO = LBUF
      NEW = IQ(LBUF+5)
      IF (NRNEW.EQ.0)        GO TO 51
      IF   (NEW.EQ.0)        GO TO 46
      IF   (NEW-2)           44,43,61

   43 IDNEWV(1)= IQBLAN
      IDNEWV(2)= IQBLAN                                                 -A8M
      IDNEWV(3)= IQ(LBUF+3)
      IDNEWV(4)= IQ(LBUF+4)                                             -A8M
      IF (LOGLEV.LT.1)       GO TO 45
      WRITE (IQPRNT,9043) IDP,NDKNEW,MODEPR
      GO TO 45

   44 IDNEWV(1)= IQ(LBUF+3)
      IDNEWV(2)= IQ(LBUF+4)                                             -A8M
      IF (LOGLEV.GE.3)   WRITE (IQPRNT,9044) NDKNEW,MODEPR,IDD
   45 NDKNEW= NDKNEW + 1
   46 IF (IQ(LBUF+1).NE.0)   GO TO 25
      LBUF = LLAST
      LLAST= LDO
      RETURN


C-------           'NEW' IS AT BOF, INITIAL REWIND IF BIG-FILE STARTS
C-    1 ATT, 2 RES, 4 CARD, 8 DET, 16 EOF, 32 HOLD, 64 OUT, 256 I, 512 F

   51 IF (NRTNEW.GE.0)       GO TO 53
      CALL AUXFIL (320,NVNEW(1),0)
   53 IF   (NEW.EQ.3)        GO TO 63

C--                INSERT MISSING TITLE

      ISAVE = MODEPR
      MODEPR= IQDOT
      LBUF  = LLAST

      IF (IQ(LBUF+1).NE.-1)  CALL NOTITL
      CALL PRTITL
      IQ(LBUF+1)= 0

      LBUF  = LDO
      MODEPR= ISAVE
      GO TO 66

C-------           OUTPUT  EOF/TITLE

   61 CALL AUXFIL (0,NVNEW(1),0)
   63 CALL PRTITL

C----              WRITE FILE-NAME RECORD

   66 CALL VZERO (MWK(6),12)
      MWK(5) = 3
      MWK(7) = 3

      MWK(11) = 3
      MWK(12) = IDNEWV(5)
      MWK(13) = IDNEWV(6)                                               -A8M
      CALL PKBYT (MWK(5),MWK(14),1,4,MPAK2(1))                          -A8M
C     CALL PKBYT (MWK(5),MWK(13),1,4,MPAK2(1))                           A8M
      CALL XOUTB (LUNEW,MWK(12),MWK(11))
      NRNEW = 1
      NDKNEW= NDKNEW + 1
      IF (IQ(LLAST+1).EQ.0)  GO TO 21
      GO TO 46
      END
