 
C*********************************************************************
 
C...PYRGHM
C...Auxiliary to PYPOLE.
 
      SUBROUTINE PYRGHM(MCHI,MA,TANB,MQ,MUR,MD,MTOP,AU,AD,MU,
     *    MHP,HMP,MCH,SA,CA,SAB,CAB,TANBA,MGLU,DELTAMT,DELTAMB)
      IMPLICIT DOUBLE PRECISION(A-H,L,M,O-Z)
      DIMENSION VH(2,2),M2(2,2),M2P(2,2)
C...Parameters.
      INTEGER MSTU,MSTJ
      COMMON/PYDAT1/MSTU(200),PARU(200),MSTJ(200),PARJ(200)
      SAVE /PYDAT1/
 
      MZ = 91.18D0
      PI = PARU(1)
      V  = 174.1D0
      ALPHA1 = 0.0101D0
      ALPHA2 = 0.0337D0
      ALPHA3Z = 0.12D0
      TANBA = TANB
      TANBT = TANB
C     MBOTTOM(MTOP) = 3. GEV
      MB = PYMRUN(5,MTOP**2)
      ALPHA3 = ALPHA3Z/(1D0 +(11D0 - 10D0/3D0)/4D0/PI*ALPHA3Z*
     *LOG(MTOP**2/MZ**2))
C     RMTOP= RUNNING TOP QUARK MASS
      RMTOP = MTOP/(1D0+4D0*ALPHA3/3D0/PI)
      TQ = LOG((MQ**2+MTOP**2)/MTOP**2)
      TU = LOG((MUR**2 + MTOP**2)/MTOP**2)
      TD = LOG((MD**2 + MTOP**2)/MTOP**2)
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C    NEW DEFINITION, TGLU.
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      TGLU = LOG(MGLU**2/MTOP**2)
      SINB = TANB/DSQRT(1D0 + TANB**2)
      COSB = SINB/TANB
      IF(MA.GT.MTOP)
     *TANBA = TANB*(1D0-3D0/32D0/PI**2*
     *(RMTOP**2/V**2/SINB**2-MB**2/V**2/COSB**2)*
     *LOG(MA**2/MTOP**2))
      IF(MA.LT.MTOP.OR.MA.EQ.MTOP) TANBT = TANBA
      SINB = TANBT/SQRT(1D0 + TANBT**2)
      COSB = 1D0/DSQRT(1D0 + TANBT**2)
      G1 = SQRT(ALPHA1*4D0*PI)
      G2 = SQRT(ALPHA2*4D0*PI)
      G3 = SQRT(ALPHA3*4D0*PI)
      HU = RMTOP/V/SINB
      HD =  MB/V/COSB
      CALL PYGFXX(MA,TANBA,MQ,MUR,MD,MTOP,AU,AD,MU,MGLU,VH,STOP1,STOP2,
     *SBOT1,SBOT2,DELTAMT,DELTAMB)
      IF(MQ.GT.MUR) TP = TQ - TU
      IF(MQ.LT.MUR.OR.MQ.EQ.MUR) TP = TU - TQ
      IF(MQ.GT.MUR) TDP = TU
      IF(MQ.LT.MUR.OR.MQ.EQ.MUR) TDP = TQ
      IF(MQ.GT.MD) TPD = TQ - TD
      IF(MQ.LT.MD.OR.MQ.EQ.MD) TPD = TD - TQ
      IF(MQ.GT.MD) TDPD = TD
      IF(MQ.LT.MD.OR.MQ.EQ.MD) TDPD = TQ
 
      IF(MQ.GT.MD) DLAMBDA1 = 6D0/96D0/PI**2*G1**2*HD**2*TPD
      IF(MQ.LT.MD.OR.MQ.EQ.MD) DLAMBDA1 = 3D0/32D0/PI**2*
     * HD**2*(G1**2/3D0+G2**2)*TPD
 
      IF(MQ.GT.MUR) DLAMBDA2 =12D0/96D0/PI**2*G1**2*HU**2*TP
      IF(MQ.LT.MUR.OR.MQ.EQ.MUR) DLAMBDA2 = 3D0/32D0/PI**2*
     * HU**2*(-G1**2/3D0+G2**2)*TP
 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C  DLAMBDAP1 AND DLAMBDAP2 ARE THE NEW LOG CORRECTIONS DUE TO
C  THE PRESENCE OF THE GLUINO MASS. THEY ARE IN GENERAL VERY SMALL,
C  AND ONLY PRESENT IF THERE IS A HIERARCHY OF MASSES BETWEEN THE
C  TWO STOPS.
C
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 
      IF(MGLU.LT.MUR.OR.MGLU.LT.MQ) THEN
       IF(MQ.GT.MUR.AND.MGLU.GT.MUR) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TQ**2-TGLU**2)
       ENDIF
 
       IF(MQ.GT.MUR.AND.MGLU.LT.MUR) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TQ**2-TU**2)
       ENDIF
 
       IF(MQ.GT.MUR.AND.MGLU.EQ.MUR) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TQ**2-TU**2)
       ENDIF
 
       IF(MUR.GT.MQ.AND.MGLU.GT.MQ) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TU**2-TGLU**2)
       ENDIF
 
       IF(MUR.GT.MQ.AND.MGLU.LT.MQ) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TU**2-TQ**2)
       ENDIF
 
       IF(MUR.GT.MQ.AND.MGLU.EQ.MQ) THEN
        DLAMBDAP2 = -4D0/(16D0*PI**2)**2*HU**4*(TU**2-TQ**2)
       ENDIF
      ENDIF
      DLAMBDA3 = 0D0
      DLAMBDA4 = 0D0
      IF(MQ.GT.MD) DLAMBDA3 = -1D0/32D0/PI**2*G1**2*HD**2*TPD
      IF(MQ.LT.MD.OR.MQ.EQ.MD) DLAMBDA3 = 3D0/64D0/PI**2*HD**2*
     *(G2**2-G1**2/3D0)*TPD
      IF(MQ.GT.MUR) DLAMBDA3 = DLAMBDA3 -
     *1D0/16D0/PI**2*G1**2*HU**2*TP
      IF(MQ.LT.MUR.OR.MQ.EQ.MUR) DLAMBDA3 = DLAMBDA3 +
     * 3D0/64D0/PI**2*HU**2*(G2**2+G1**2/3D0)*TP
      IF(MQ.LT.MUR) DLAMBDA4 = -3D0/32D0/PI**2*G2**2*HU**2*TP
      IF(MQ.LT.MD) DLAMBDA4 = DLAMBDA4 - 3D0/32D0/PI**2*G2**2*
     *HD**2*TPD
      LAMBDA1 = ((G1**2 + G2**2)/4D0)*
     * (1D0-3D0*HD**2*(TPD + TDPD)/8D0/PI**2)
     *+(3D0*HD**4D0/16D0/PI**2) *TPD*(1D0
     *+ (3D0*HD**2/2D0 + HU**2/2D0
     *- 8D0*G3**2) * (TPD + 2D0*TDPD)/16D0/PI**2)
     *+(3D0*HD**4D0/8D0/PI**2) *TDPD*(1D0  + (3D0*HD**2/2D0 + HU**2/2D0
     *- 8D0*G3**2) * TDPD/16D0/PI**2) + DLAMBDA1
      LAMBDA2 = ((G1**2 + G2**2)/4D0)*(1D0-3D0*HU**2*
     *(TP + TDP)/8D0/PI**2)
     *+(3D0*HU**4D0/16D0/PI**2) *TP*(1D0
     *+ (3D0*HU**2/2D0 + HD**2/2D0
     *- 8D0*G3**2) * (TP + 2D0*TDP)/16D0/PI**2)
     *+(3D0*HU**4D0/8D0/PI**2) *TDP*(1D0 + (3D0*HU**2/2D0 + HD**2/2D0
     *- 8D0*G3**2) * TDP/16D0/PI**2) + DLAMBDA2 + DLAMBDAP2
      LAMBDA3 = ((G2**2 - G1**2)/4D0)*(1D0-3D0*
     *(HU**2)*(TP + TDP)/16D0/PI**2 -3D0*
     *(HD**2)*(TPD + TDPD)/16D0/PI**2) +DLAMBDA3
      LAMBDA4 = (- G2**2/2D0)*(1D0
     *-3D0*(HU**2)*(TP + TDP)/16D0/PI**2
     *-3D0*(HD**2)*(TPD + TDPD)/16D0/PI**2) +DLAMBDA4
 
      LAMBDA5 = 0D0
      LAMBDA6 = 0D0
      LAMBDA7 = 0D0
 
      M2(1,1) = 2D0*V**2*(LAMBDA1*COSB**2+2D0*LAMBDA6*
     *COSB*SINB + LAMBDA5*SINB**2) + MA**2*SINB**2
 
      M2(2,2) = 2D0*V**2*(LAMBDA5*COSB**2+2D0*LAMBDA7*
     *COSB*SINB + LAMBDA2*SINB**2) + MA**2*COSB**2
      M2(1,2) = 2D0*V**2*(LAMBDA6*COSB**2+(LAMBDA3+LAMBDA4)*
     *COSB*SINB + LAMBDA7*SINB**2) - MA**2*SINB*COSB
 
      M2(2,1) = M2(1,2)
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
CCC  THIS IS THE CONTRIBUTION FROM LIGHT CHARGINOS/NEUTRALINOS
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 
      MSSUSY=DSQRT(.5D0*(MQ**2+MUR**2)+MTOP**2)
 
      IF(MCHI.GT.MSSUSY) GOTO 100
      IF(MCHI.LT.MTOP) MCHI=MTOP
 
      TCHAR=LOG(MSSUSY**2/MCHI**2)
 
      DELTAL12=(9D0/64D0/PI**2*G2**4+5D0/192D0/PI**2*G1**4)*TCHAR
      DELTAL3P4=(3D0/64D0/PI**2*G2**4+7D0/192D0/PI**2*G1**4
     *+4D0/32D0/PI**2*G1**2*G2**2)*TCHAR
 
      DELTAM112=2D0*DELTAL12*V**2*COSB**2
      DELTAM222=2D0*DELTAL12*V**2*SINB**2
      DELTAM122=2D0*DELTAL3P4*V**2*SINB*COSB
 
      M2(1,1)=M2(1,1)+DELTAM112
      M2(2,2)=M2(2,2)+DELTAM222
      M2(1,2)=M2(1,2)+DELTAM122
      M2(2,1)=M2(2,1)+DELTAM122
 
  100 CONTINUE
 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
CCC  END OF CHARGINOS/NEUTRALINOS
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
 
      DO 120 I = 1,2
        DO 110 J = 1,2
          M2P(I,J) = M2(I,J) + VH(I,J)
  110   CONTINUE
  120 CONTINUE
      TRM2P = M2P(1,1) + M2P(2,2)
      DETM2P = M2P(1,1)*M2P(2,2) - M2P(1,2)*M2P(2,1)
      MH2P = (TRM2P - DSQRT(TRM2P**2 - 4D0* DETM2P))/2D0
      HM2P = (TRM2P + DSQRT(TRM2P**2 - 4D0* DETM2P))/2D0
      HMP = DSQRT(HM2P)
      MCH2=MA**2+(LAMBDA5-LAMBDA4)*V**2
      MCH=DSQRT(MCH2)
      IF(MH2P.LT.0.) GOTO 130
      MHP = SQRT(MH2P)
      SIN2ALPHA = 2D0*M2P(1,2)/SQRT(TRM2P**2-4D0*DETM2P)
      COS2ALPHA = (M2P(1,1)-M2P(2,2))/SQRT(TRM2P**2-4D0*DETM2P)
      IF(COS2ALPHA.GT.0.) ALPHA = ASIN(SIN2ALPHA)/2D0
      IF(COS2ALPHA.LT.0.) ALPHA = -PI/2D0-ASIN(SIN2ALPHA)/2D0
      SA = SIN(ALPHA)
      CA = COS(ALPHA)
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C        HERE THE VALUES OF SAB AND CAB ARE DEFINED, IN ORDER
C        TO DEFINE THE NEW COUPLINGS OF THE LIGHTEST AND
C        HEAVY CP-EVEN HIGGS TO THE BOTTOM QUARK.
C
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      SAB = SA*(1D0-DELTAMB/(1D0+DELTAMB)*(1D0+CA/SA/TANB))
      CAB = CA*(1D0-DELTAMB/(1D0+DELTAMB)*(1D0-SA/CA/TANB))
  130 CONTINUE
      RETURN
      END
