*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:18  mclareni
* Initial revision
*
*
          IDENT CBYT
*
* CERN PROGLIB# M421    CBYT            .VERSION KERNCDC  0.1   731018
*
*         SUBROUTINE CBYT(A,LA,X,LX,NBITS)
*
*         ROUTINE FOR FTN, CORRECTED 17-OCT-73       PC +JZ
*
          ENTRY CBYT
          VFD   24/4HCBYT,36/CBYT
 CBYT     DATA  0
          SB7   -1             B7= -1
          SA2   A1-B7          X2= ADR(LA)
          SA3   A2-B7          X3= ADR(X)
          SA4   A3-B7              X+= ADR(LX)
          SA5   A4-B7          X5= ADR(NBITS)
          SA2   X2             X2= LA
          SA4   X4             X4= LX
          MX0   1                  MASK STARTED
          SA5   X5             X5= NBITS
          IX2   X4-X2          X2= LX-LA = IDISP DISPLACEMENT A TO X
          SB6   X5+B7          B6= NBITS-1
          BX6   X2             X6= IDISPL
          SX7   60             X7= 60
          SB5   X4+B6          B5= NBITS+LX-1
          AX6   59             X6= 0 OR -0
          SA1   X1             X1= A
          SA3   X3             X3= X
          AX0   B6,X0              MASK ON LEFT
          BX7   X6*X7          X7= 0 OR 60 FOR IDISPL +VE OR -VE
          SB2   X2             B2= IDISPL
          LX0   B5,X0              SHIFT MASK TO LX
          SB2   B2             B2= IDISPL OR IDISPL+60
          BX3   -X0*X3             MASK OUT BYTE IN X
          LX1   B2,X1              SHIFT BYTE IN A TO LX
          BX1   X0*X1              MASK OUT NON BYTE IN A
          BX6   X1+X3              ADD BYTE TO X
          SA6   A3                 RESTORE RESULT
          EQ    CBYT
          END
#ifdef CERNLIB_TCGEN_CBYT
#undef CERNLIB_TCGEN_CBYT
#endif
