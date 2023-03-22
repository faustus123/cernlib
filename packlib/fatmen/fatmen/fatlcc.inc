*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:54  mclareni
* Initial revision
*
*
#ifndef CERNLIB_FATMEN_FATLCC_INC
#define CERNLIB_FATMEN_FATLCC_INC
*
*
* fatlcc.inc
*
*
*     Location code definitions (from FATMEN.LOCCODES)
*
      PARAMETER (MXLCFA=99)
      CHARACTER*255 CHLOCF
      COMMON/FATLCC/NKLCFA,NLCCFA(MXLCFA),CHLOCF(MXLCFA)

#endif
