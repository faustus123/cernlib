*
* $Id$
*
* $Log$
* Revision 1.2  1999/06/18 13:31:20  couet
* - qcardl.inc was empty: It is now removed and not used.
*   Comment END CDE removed.
*
* Revision 1.1.1.1  1996/03/06 10:47:14  mclareni
* Zebra
*
*
#include "zebra/pilot.h"
#if (defined(CERNLIB_Z32))&&(defined(CERNLIB_EQUHOLCH))
#include "qutyz32/izchav.F"
#elif (defined(CERNLIB_CONVEX))&&(defined(CERNLIB_SINGLE))
#include "not_cern/qutycvx/izchav.F"
#elif defined(CERNLIB_CRAY)
#include "not_cern/qutycry/izchav.F"
#elif defined(CERNLIB_CDC)
#include "not_cern/qutycdc/izchav.F"
#else
      SUBROUTINE IZCHAV (NP)

#include "zebra/zceta.inc"
#include "zebra/zkrakcc.inc"
*
      DIMENSION    NP(9)

      N = NP(1)

      DO 29  JCE=1,N
      JV = ICHAR (CQHOLK(JCE:JCE))
   29 IQCETK(JCE) = IQCETA(JV+1)
      RETURN
      END
#endif
