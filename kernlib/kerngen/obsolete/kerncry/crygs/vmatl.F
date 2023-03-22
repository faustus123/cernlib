*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:52:39  mclareni
* Initial revision
*
*
#include "kerncry/pilot.h"
      SUBROUTINE VMATL (H,A,X,K,N)
C
C CERN PROGLIB# F121    VMATL           .VERSION KERNCRY  1.11  890627
C ORIG. 30/05/89  FCA
C
      DIMENSION A(*),X(*),H(N,K)
C
      CALL SGEMV ('T',N,K,1.,H,N,A,1,0.,X,1)
      END
#ifdef CERNLIB_TCGEN_VMATL
#undef CERNLIB_TCGEN_VMATL
#endif
