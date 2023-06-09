*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:21:55  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.48  by  S.Giani
*-- Author :
      SUBROUTINE GRNDST(D,LD,KZ1,KZ2,A1,A2,Z1,Z2,ATAR,Q,MT)
C       THIS ROUTINE CALCULATES THE EXIT ENERGIES AND DIRECTIONAL
C       COSINES FOR THE CHARGED PARTICLE AND RECOIL NUCLEUS FOR
C       A GROUND STATE TWO-BODY REACTION USING CLASSICAL KINEMATICS
C       AND A MOMEMTUM BALANCE. IT ALSO SETS ALL EXIT PARAMETERS FOR
C       THE COLLISION PRODUCTS AND STORES THEM IN THE RECOIL BANK.
#include "geant321/minput.inc"
#include "geant321/mconst.inc"
#include "geant321/mnutrn.inc"
#include "geant321/mrecoi.inc"
#include "geant321/mapoll.inc"
#include "geant321/mmass.inc"
#include "geant321/mpstor.inc"
      DIMENSION D(*),LD(*)
      SAVE
      NPN = 1
      IF(MT.EQ.108) NPN = 2
      IF(MT.EQ.109) NPN = 3
      IF(MT.EQ.111) NPN = 2
C       CALCULATE THE CONSTANTS USED IN THE KINEMATIIC EQUATIONS
      ZATAR=ATAR*9.31075E+08
      PXO = 0.0
      PYO = 0.0
      PZO = 0.0
C loop over emmited particles
      DO 40  NP=1,NPN
C       ASSUME ISOTROPIC CHARGED PARTICLE EMISSION IN THE CENTER
C       OF MASS COORDINATE SYSTEM
         R=FLTRNF(0)
         FM=2.0*R-1.0
C       FOR A GROUND STATE REACTION THE RECOIL MASS IS KNOWN EXACTLY
         Z2=ZN+ZATAR-FLOAT(NP)*Z1-Q
         A2=Z2/9.31075E+08
         DENOM=(AN+ATAR)*(A1*FLOAT(NP)+A2)
         ERATIO=EOLD/(EOLD+Q)
         AC=((AN*A2)/DENOM)*ERATIO
         BC=((AN*A1)/DENOM)*ERATIO
         CC=((ATAR*A1)/DENOM)*(1.0+(AN*Q)/(ATAR*(EOLD+Q)))
         DC=((ATAR*A2)/DENOM)*(1.0+(AN*Q)/(ATAR*(EOLD+Q)))
C       CALCULATE THE CHARGED PARTICLE AND RECOIL NUCLEUS IN THE
C       LABORATORY COORDINATE SYSTEM
         E1=(EOLD+Q)*(BC+DC+(2.0*SQRT(AC*CC))*FM)
         E2=(EOLD+Q)*(AC+CC-(2.0*SQRT(AC*CC))*FM)
C       CALCULATE THE CHARGED PARTICLE ENERGY AND VELOCITY IN THE
C       CENTER OF MASS COORDINATE SYSTEM
         E1CM=(Z2/(Z1+Z2))*((ZATAR/(ZN+ZATAR))*EOLD+Q)
         V1CM=SQRT((2.0*E1CM)/Z1)
C       CALCULATE THE VELOCITY OF THE CENTER OF MASS
         VCM=SQRT(2.0*ZN*EOLD)/(ZN+ZATAR)
C       CONVERT THE COSINE OF THE SCATTERING ANGLE IN THE CENTER OF
C       MASS COORDINATE SYSTEM TO THE LABORATORY COORDINATE SYSTEM
         FM=(V1CM*FM+VCM)/(SQRT(((V1CM*FM+VCM)**2)+ ((V1CM*(1.0-FM**2))
     +   **2)))
C       CALCULATE THE CHARGED PARTICLE EXIT DIRECTIONAL COSINES
         SINPSI=SQRT(1.0-FM**2)
         CALL AZIRN(SINETA,COSETA)
         STHETA=1.0-UOLD**2
         IF(STHETA)20,20,10
   10    STHETA=SQRT(STHETA)
         COSPHI=VOLD/STHETA
         SINPHI=WOLD/STHETA
         GO TO 30
   20    COSPHI=1.0
         SINPHI=0.0
         STHETA=0.0
   30    U1=UOLD*FM-COSETA*SINPSI*STHETA
         V1=VOLD*FM+UOLD*COSPHI*COSETA*SINPSI-SINPHI*SINPSI*SINETA
         W1=WOLD*FM+UOLD*SINPHI*COSETA*SINPSI+COSPHI*SINPSI*SINETA
         S=1.0/SQRT(U1**2+V1**2+W1**2)
         U1=U1*S
         V1=V1*S
         W1=W1*S
         PPO = SQRT(2.0*Z1*E1)
         PXO = PXO + U1*PPO
         PYO = PYO + V1*PPO
         PZO = PZO + W1*PPO
C       CALCULATE AND SET THE CHARGED PARTICLE EXIT PARAMETERS
         XR=X
         YR=Y
         ZR=Z
         WATER=WTBC
         NZR=KZ1
         AGER=AGE
         NCOLR=NCOL
         MTNR=MT
         AR=A1
         ENIR=EOLD
         UNIR=UOLD
         VNIR=VOLD
         WNIR=WOLD
         ENOR=0.0
         UNOR=0.0
         VNOR=0.0
         WNOR=0.0
         WTNR=0.0
         QR=Q
         UR=U1
         VR=V1
         WR=W1
         ER=E1
C       STORE THE CHARGED PARTICLE IN THE RECOIL BANK
         EP = ER
         UP = UR
         VP = VR
         WP = WR
         AMP = AR
         ZMP = FLOAT(NZR)
         AGEP = AGE
         MTP = MT
         CALL STOPAR(IDHEVY,NHEVY)
   40 CONTINUE
C       CALCULATE THE TOTAL MOMENTUM BEFORE THE COLLISION
C       NEUTRON MOMENTUM BEFORE COLLISION (PI) EQUALS TOTAL MOMENTUM
      PI=SQRT(2.0*ZN*EOLD)
C       CALCULATE THE DIRECTIONAL MOMENTUM OF THE RECOIL NUCLEUS
      PRX=PI*UOLD-PXO
      PRY=PI*VOLD-PYO
      PRZ=PI*WOLD-PZO
C       CALCULATE THE TOTAL MOMENTUM OF THE RECOIL NUCLEUS
      PR=SQRT(PRX**2+PRY**2+PRZ**2)
C       CALCULATE THE RECOIL NUCLEUS DIRECTIONAL COSINES
      U2=PRX/PR
      V2=PRY/PR
      W2=PRZ/PR
C       CALCULATE THE RECOIL NUCLEUS EXIT ENERGY
      XM = A2 * 931.075E6
      E2 = SQRT(PR**2+XM**2) - XM
C       CALCULATE AND SET THE CHARGED PARTICLE EXIT PARAMETERS
      XR=X
      YR=Y
      ZR=Z
      WATER=WTBC
      NZR=KZ2
      AGER=AGE
      NCOLR=NCOL
      MTNR=MT
      AR=A2
      ENIR=EOLD
      UNIR=UOLD
      VNIR=VOLD
      WNIR=WOLD
      ENOR=0.0
      UNOR=0.0
      VNOR=0.0
      WNOR=0.0
      WTNR=0.0
      QR=Q
      UR=U2
      VR=V2
      WR=W2
      ER=E2
C       STORE THE RECOIL HEAVY ION IN THE RECOIL BANK
      EP = ER
      UP = UR
      VP = VR
      WP = WR
      AMP = AR
      ZMP = FLOAT(NZR)
      AGEP = AGE
      MTP = MT
      CALL STOPAR(IDHEVY,NHEVY)
      RETURN
      END
