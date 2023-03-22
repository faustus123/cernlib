*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:45  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
#if defined(CERNLIB_IBMRT)
           FUNCTION CABS(Z)
C 20 APRIL 90
C IBM CABS FAILS FOR CABS((0.,0.))
           COMPLEX Z
           REAL CABS,X,Y
 
           X=REAL(Z)
           Y=AIMAG(Z)
           CABS=SQRT(X**2 + Y**2)
           IF(X.EQ.0.AND.Y.EQ.0) CABS=0
           RETURN
           END
#endif
