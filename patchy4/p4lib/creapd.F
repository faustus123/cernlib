CDECK  ID>, CREAPD.
      SUBROUTINE CREAPD (IDXPP,IDXPD)

C-    LOCATE OR CREATE FOR (IDXP,IDXD)   BANKS 'PAT', 'HDEC', 'DECK'
C-                                       AT     LCRP,  LCRH,   LCRD
C-                 IF  IDXP=0  USE EXISTING LCRP
C-                 IF  IDXD=0  NO 'DECK' PLEASE, RETURN LCRD=0
C-                 IF  IDXD=1  NO 'HDECK', NO 'DECK',  RETURN LCRD=0

C-    Linkage control :
C-           NVUTY(6)  -ve  create without search
C-                       0  normal search and creation
C-                     +ve  result linked at LEXP

      COMMON /NAMES/ NAMEP(4),NAMEH(4),NAMED(4),NAMEOR(4),NAMACT(4)
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
      DIMENSION    IDXPP(9), IDXPD(9)
C     DIMENSION     IDXP(1),  IDXD(1)                                    A8M
      DIMENSION     IDXP(2),  IDXD(2)                                   -A8M


      IDXP(1) = IDXPP(1)
      IDXP(2) = IDXPP(2)                                                -A8M
      IDXD(1) = IDXPD(1)
      IDXD(2) = IDXPD(2)                                                -A8M


C------            FIND OR CREATE PAT-BANK

      IF (IDXP(1).EQ.0)      GO TO 41
      L = 0
      K = LEXP-1
      IF (NVUTY(6))          32,21,16
   16 K = KADRV(8)

C--                FIND 'FUTURE PAT'-BANK PRE-EXISTING

   21 IQ(LPAST-1) = 0
C     LCRP = LQFIND   (IDXP(1),2,KADRV(8),NVUTY(1))                      A8M
      LCRP = LQLONG (2,IDXP(1),2,KADRV(8),NVUTY(1))                     -A8M
      IF (LCRP.EQ.0)         GO TO 31
      IF (NVUTY(6).EQ.0)     GO TO 41
      CALL QSHUNT (NVUTY(1),0,K,0)
      GO TO 38

C--                FIND PRE-EXISTING  'PAST PAT'-BANK

C-                           LQUSER(7) SUPPORTS 'PAST PAT'-STRUCTURE
C  31 L = LQFIND   (IDXP(1),2,7,NVUTY(1))                                A8M
   31 L = LQLONG (2,IDXP(1),2,7,NVUTY(1))                               -A8M

C--                CREATE NEW PAT-BANK

   32 NVUTY(7) = L
      CALL LIFTBK (LCRP,K,0,NAMEP(1),7)
      CALL  SBYT  (NVUSEB(2),IQ(LCRP),1,18)
      IQ(LCRP+1) = 0
      IQ(LCRP+2) = IDXP(1)
      IQ(LCRP+3) = IDXP(2)                                              -A8M
      IF (L.EQ.0)            GO TO 38
      CALL MXJOIN (IQ(L),IQ(LCRP))
      IQ(LCRP+1)= IQ(L+1)
      IQ(LCRP-2)= IQ(L-2)
      IQ(LCRP-3)= IQ(L-3)
      IQ(L-2)   = 0
      CALL SBIT0 (IQ(LCRP+1),1)

   38 NVUTY(1) = K
      NVUTY(6) = 0


C----              ENSURE ROLLED-IN HDEC-BANK, UNLESS  IDD=1

   41 IF (IDXD(1).EQ.1)      GO TO 57
      LCRH= IQ(LCRP-2)
      IF (LCRH.EQ.0)         GO TO 44
      IF (IQ(LCRH+1).GE.0)   GO TO 51
   44 CALL LIFTBK (LCRH,LCRP,-2,NAMEH(1),0)
      IQ(LCRH+1) = 0

C----              LOCATE DEC-BANK, UNLESS  IDD=0 (OR 1)

   51 IF (IDXD(1).EQ.0)      GO TO 57
C     LCRD = LQFIND   (IDXD(1),1,LCRH-2,NVUTY(2))                        A8M
      LCRD = LQLONG (2,IDXD(1),1,LCRH-2,NVUTY(2))                       -A8M
      IF (LCRD.NE.0)         RETURN

      CALL LIFTBK (LCRD,NVUTY(2),0,NAMED(1),0)
      CALL SBYT (IQ(LCRP),IQ(LCRD),1,18)
      IQ(LCRD+1) = IDXD(1)
      IQ(LCRD+2) = IDXD(2)                                              -A8M
      RETURN

   57 LCRD = 0
      RETURN
      END
