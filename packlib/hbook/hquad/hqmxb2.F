*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:08:03  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.17/01 22/11/92  12.11.50  by  John Allison
*-- Author :
      SUBROUTINE HQMXB2 (M, U, F, X)
      INTEGER M
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION U (M), F (M), X (*)
#endif
#if !defined(CERNLIB_DOUBLE)
      REAL U (M), F (M), X (*)
#endif
* Used by MaXimum likelihood routines for Gaussian integration in 1-D
*   with routines D110 (CERN library).
* B) Integrand is e^s phi_k.
 
#include "hbook/hcqcom.inc"
 
      INTEGER I
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION DGMLT1
#endif
#if !defined(CERNLIB_DOUBLE)
      REAL RGMLT1
#endif
      EXTERNAL HQMXB1
 
      DO 10    I = 1, M
         X (2) = U (I)
#if defined(CERNLIB_DOUBLE)
         F (I) = DGMLT1 (HQMXB1, DBLE (XMI), DBLE (XMA),
     +   NINTVS, NQUADS, X)
#endif
#if !defined(CERNLIB_DOUBLE)
         F (I) = RGMLT1 (HQMXB1, XMI, XMA, NINTVS, NQUADS, X)
#endif
   10 CONTINUE
 
      END
