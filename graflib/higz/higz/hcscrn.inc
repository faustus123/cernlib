*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:10:15  mclareni
* Initial revision
*
*
#ifndef CERNLIB_HIGZ_HCSCRN_INC
#define CERNLIB_HIGZ_HCSCRN_INC
*
*
* hcscrn.inc
*
      PARAMETER         (NSLIC=1000, NTMAX=100)
      COMMON /HCSCRN/   TN(4,3),TB(4,3),
     &                  NT,X0,DX,U(2,NSLIC),D(2,NSLIC),T(2,NTMAX)

#endif
