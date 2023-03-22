CDECK  ID>, CCPROC.
      SUBROUTINE CCPROC

C-    FINISH CONTROL-CARD PROCESSING OF CCKRAK FOR PATCHY

      COMMON /CCPARA/NCHCCD,NCHCCT,KARDCC(84),   JCCTYP,JCCPRE,JCCEND
     +,              MCCPAR(120),NCCPAR,MXCCIF,JCCIFV,JCCBAD,JCCWK(4)
     +,              JCCPP,JCCPD,JCCPZ,JCCPT,JCCPIF,JCCPC,JCCPN
     +,              NCCPP,NCCPD,NCCPZ,NCCPT,NCCPIF,NCCPC,NCCPN
      COMMON /CCTYPE/MCCQUI,MCCPAM,MCCTIT,MCCPAT,MCCDEC,MCCDEF,MCCEOD
     +,              MCCASM,MCCOPT,MCCUSE
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
     +,           (LCRP,NVUTY(3)),   (LCRH,NVUTY(4)),   (LCRD,NVUTY(5))
C--------------    END CDE                             -----------------  ------



C----              EVALUATE TRUTH-VALUE AND EXE-BITS FOR  IF-PARAMETERS

C--   EXE-BITS COMBINATION, E.G. FOR   IF=A,B, IF=C.
C-    FOR YES -    (A.AND.B)  .OR. C
C-    FOR NO  -    (A .OR.B) .AND. C

      IF (MOPTIO(25).NE.0)   RETURN
      MTY = 0
      MTN = 15
      MTU = 1
      L   = JCCPIF
      JSEP= MCCPAR(L)


C--                START NEW AND-GROUP

   21 MLY = 15
      MLN = 0
      MLU = 0

C--                NEXT PARAMETER

   22 IQ(LPAST-1) = LQUSER(7)
C     LCRP= LQFIND   (MCCPAR(L+1),2,KADRV(8),NVUTY(1))                   A8M
      LCRP= LQLONG (2,MCCPAR(L+1),2,KADRV(8),NVUTY(1))                  -A8M
      IF (LCRP.NE.0)         GO TO 24
      NVUTY(6) = -7
      CALL CREAPD (MCCPAR(L+1),1)

   24 CALL SBIT1 (IQ(LCRP+1),6)                                         -MSK
C  24 IQ(LCRP+1)= IQ(LCRP+1) .OR. 32                                     MSKC
      M   = IQ(LCRP)
      IF (JBIT (M,5).EQ.0)   JSEP=-JSEP                                 -MSK
C     IF ((M.AND.16).EQ.0)   JSEP=-JSEP                                  MSKC
      IF (JSEP.LT.0)         GO TO 26

      MLU = 1
   26 MLY = JBYTET (M,MLY,1,5)                                          -MSK
C  26 MLY = MLY .AND. M                                                  MSKC
      CALL SBYTOR (M,MLN,1,5)                                           -MSK
C     MLN = MLN .OR.  M                                                  MSKC
      L   = L+3
      JSEP= MCCPAR(L)
      IF (IABS(JSEP).EQ.1)   GO TO 22
      CALL SBYTOR (MLY,MTY,1,5)                                         -MSK
C     MTY = MTY .OR.  MLY                                                MSKC
      MTN = JBYTET (MLN,MTN,1,5)                                        -MSK
C     MTN = MTN .AND. MLN                                                MSKC
      MTU = MIN  (MTU,MLU)
      IF (JSEP.NE.0)         GO TO 21

C--                FINISHED

      IF (MTU.EQ.0)          GO TO 34
      MXCCIF = MTY
      RETURN

   34 MXCCIF = MTN
      JCCIFV = 7
      RETURN
      END
