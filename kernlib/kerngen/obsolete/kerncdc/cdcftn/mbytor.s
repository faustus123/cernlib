*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:21  mclareni
* Initial revision
*
*
          IDENT MBYTOR
*
* CERN PROGLIB# M421    MBYTOR          .VERSION KERNCDC  2.15  850813
* ORIG.  JZ, 12/8/85
*
*         FUNCTION MBYTOR (A,X,LX,NBITS)
*
          ENTRY MBYTOR
          VFD   36/6HMBYTOR,24/MBYTOR
 MBYTOR   DATA  0
          SB7   -1             B7= -1
          SA2   A1-B7          X2= ADR(X)
          SA3   A2-B7          X2= ADR(LX)
          SA4   A3-B7          X4= ADR(NBITS)
          SA1   X1             X1= A
          SA2   X2             X2= X
          SA4   X4             X4= NBITS
          SA3   X3             X3= LX
          MX0   1                  MASK STARTED
          SB5   X4+B7          B5= NBITS-1
          SB4   X4             B4= NBITS
          AX0   B5,X0              MASK ON THE LEFT
          LX0   B4,X0              MASK ON THE RIGHT
          SB3   X3+B7          B3= LX-1
          BX1   X0*X1              CLEAR NON BYTE IN A
          LX1   B3,X1              SHIFT A TO LX
          BX6   X2+X1              ADD BYTE FROM A TO X
          EQ    MBYTOR
          END
#ifdef CERNLIB_TCGEN_MBYTOR
#undef CERNLIB_TCGEN_MBYTOR
#endif
