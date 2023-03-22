*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:30  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE XZLOGL(ILOG)
#include "cspack/czunit.inc"
      IDEBXZ = ILOG
      IF(IDEBXZ.GE.-2) PRINT *,'XZLOGL. Setting log level to ',IDEBXZ
      END
