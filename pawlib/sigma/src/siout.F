*
* $Id$
*
* $Log$
* Revision 1.1  1995/12/12 14:36:18  mclareni
* Initial revision
*
*
#include "sigma/pilot.h"
*CMZ :  1.09/04 26/10/93  09.49.19  by  Carlo E. Vandoni
*-- Author :
      SUBROUTINE SIOUT (N)
#include "sigma/sicph1.inc"
#include "sigma/sigcmp.inc"
      IOUTS(IOC) = N
      IOC = IOC + 1
      END
