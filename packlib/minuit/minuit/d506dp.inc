*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 14:31:31  mclareni
* Initial revision
*
*
#ifndef CERNLIB_MINUIT_D506DP_INC
#define CERNLIB_MINUIT_D506DP_INC
*
*
* d506dp.inc
*
#if defined(CERNLIB_DOUBLE)
C ************ DOUBLE PRECISION VERSION *************
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
#endif
#if !defined(CERNLIB_DOUBLE)
C ************ SINGLE PRECISION VERSION *************
#endif

#endif
