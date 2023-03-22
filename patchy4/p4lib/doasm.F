CDECK  ID>, DOASM.
      SUBROUTINE DOASM

C-    DIGEST CARD  +ASM, ...  GIVEN IN P=CRA*, D=.
C-    EXTRA CALL AT THE END OF P=CRA*, D=BLANK TO FINALISE ASM USE

      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
      COMMON /IOFCOM/IOTALL,IOTOFF,IOTON,IOSPEC,IOPARF(5),IOMODE(12)
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
      EQUIVALENCE(LPAST,LADRV(1)),  (LPCRA,LADRV(2)), (LDCRAB,LADRV(3))
     +,          (LSASM,LADRV(8)),  (LRBIG,LADRV(13)), (LRPAM,LADRV(14))
C--------------    END CDE                             -----------------  ------
      EQUIVALENCE (JFILE,JCCPC)



      IF (JCCTYP.NE.MCCASM)  GO TO 41
      IF (LEXD.NE.LDCRAB)    GO TO 91

C------            +ASM-CARD,  CHECK IF ROUTINE-HEADER CARD REQESTED

      LRHC = -7
      IF (JCCPD.EQ.0)        GO TO 21
      LRHC = 0
      NCH  = NCHCCT - NCHCCD
      IF (NCH.LE.0)          GO TO 21

C--                Analyse text of Routine Header card

      CALL UCOPY (KARDCC(NCHCCD+1),MWK(1),NCH)
      MWKX(1) = MCCPAR(JCCPD+1)
      CALL LIFTRH (NCH,LRHC,7)


C--                FILL CROSS-REFERENCES

   21 NF = 0
   22 IF (NCCPN.EQ.0)        GO TO 27
      NS = MCCPAR(JCCPN+1) - 20
      IF (NS.LE.0)           GO TO 91
      IF (NS.LT.6)           GO TO 24
      NS = NS-5
      IF (NS.LT.6)           GO TO 91
      IF (NS.GE.11)          GO TO 91
   24 IF (NF.EQ.0)  NF=NS
      LASM = IQ(LSASM-NS)
      IF (IQ(LASM+1).NE.1)   GO TO 91
      IQ(LASM+1) = NF
      IQ(LASM+12)= MCCPAR(JCCPT+1)
      IF (LRHC.GE.0)  IQ(LASM-1)=LRHC
      JCCPN= JCCPN + 3
      NCCPN= NCCPN - 1
      GO TO 22

C--                SET OPTIONS FOR MAIN STREAM

   27 NF  = MAX (NF,1)
      LASM= IQ(LSASM-NF)
      NS  = MCCPAR(JCCPT+1)
      IQ(LASM+7) = MCCPAR(JFILE+1)
      IQ(LASM+8) = MCCPAR(JFILE+2)                                      -A8M
      IQ(LASM+9) = IOTYPE (NS,0)
      IF (JBIT(NS,2).NE.0)   GO TO 36                                   -MSK
C     IF ((NS.AND.2).NE.0)   GO TO 36                                    MSKC

C--                CONNECT FILE IF T=ATTACH


      IF (JBIT(NS,1).EQ.0)   RETURN                                     -MSK
C     IF ((NS.AND.1).EQ.0)   RETURN                                      MSKC
   28 IF (IQ(LASM+7).EQ.0)  IQ(LASM+7)=IQ(LASM+5)
      CALL IOFILE (4+64+256+2048,IQ(LASM+5))
      IQ(LASM+2) = 0
      RETURN

C--                ASM BY-PASS

   36 IQ(LASM+5) = 0
      RETURN


C------            END OF  D=,P=CRA*,   READY ALL ASM-STREAMS

   41 DO 69 JF=1,10
      LASM = IQ(LSASM-JF)
      IF (IQ(LASM+5).EQ.0)   GO TO 69
      IF (IQ(LASM+1).NE.JF)  GO TO 63

C--                EACH MAIN STREAM: REAL LUN/FILE TO BE USED

      IQ(LASM+10) = IQ(LASM+5)
      IF (IQ(LASM+7).NE.0)  IQ(LASM+10)=IQ(LASM+7)
      JWR = 0
      GO TO 52

C--                CHECK SAME LUN/FILE USED ON A PREVIOUS MAIN STREAM

   51 LASMWR = IQ(LSASM-JWR)
      IF (IQ(LASMWR+10).EQ.IQ(LASM+10))  GO TO 61
   52 JWR = JWR + 1
      IF (JWR.LT.JF)         GO TO 51
C-    REAL INDEPENDENT MAIN STREAM FOUND
      GO TO 69


C----              APPARENT MAIN STREAM REALLY SECONDARY

   61 IQ(LASM+1) = JWR
      CALL SBYTOR (IQ(LASM+9),IQ(LASMWR+9),1,6)                         -MSK
C     IQ(LASMWR+9) = IQ(LASMWR+9) .OR. IQ(LASM+9)                        MSKC
      GO TO 64

C--                SECONDARY STREAM

   63 JWR   = IQ(LASM+1)
      LASMWR= IQ(LSASM-JWR)
      IF (IQ(LASMWR+5).EQ.0) GO TO 68
   64 IQ(LASM-2) = IQ(LASMWR-2)
      GO TO 69

   68 IQ(LASM+5) = 0
   69 CONTINUE
      RETURN

C--                FAULTY OR MIS-PLACED CARD

   91 MDEPAR = 2
      CALL DEPART
      RETURN
      END
