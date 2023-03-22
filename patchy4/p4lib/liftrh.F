CDECK  ID>, LIFTRH.
      SUBROUTINE LIFTRH (NCH,LRHCP,JHIGH)

C-    Create Routine Header bank for the NCH characters long text
C-    given in MWK(1->NCH); the name-escape character is in MWKX(1).
C-    Create the bank low if JHIGH = 0, high if JHIGH > 0

      PARAMETER      (IQBITW=32, IQBITC=8, IQCHAW=4)
      COMMON /QMACH/ NQBITW,NQCHAW,NQLNOR,NQLMAX,NQLPTH,NQRMAX,QLPCT
     +,              NQOCT(3),NQHEX(3),NQOCTD(3)
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
C--------------    END CDE                             --------------
      DIMENSION    LRHCP(9), MMRHC(4)

      DATA  MMRHC  /4HRHC ,0,0,2H**/


      NCH1 = IUFIND (MWKX(1),MWK(1),1,NCH) - 1
      NCH2 = NCH - NCH1 - 1
      LOC  = 0
      MMRHC(4)= 3
      IF (NCH1.NE.0)  MMRHC(4)=MMRHC(4) + (NCH1-1)/IQCHAW + 1
      IF (NCH2.LE.0)         GO TO 16
      LOC = MMRHC(4) + 1
      MMRHC(4) = LOC + (NCH2-1)/IQCHAW

   16 CALL LIFTBK (LRHC,0,0,MMRHC(1),JHIGH)
      IQ(LRHC+1) = NCH1
      IQ(LRHC+2) = NCH2
      IQ(LRHC+3) = LOC
      IF (NCH1.NE.0)  CALL UBUNCH (MWK(1),     IQ(LRHC+4),  NCH1)
      IF (NCH2.GT.0)  CALL UBUNCH (MWK(NCH1+2),IQ(LRHC+LOC),NCH2)
      LRHCP(1) = LRHC
      RETURN
      END
