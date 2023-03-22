*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:42  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_kernbit/pilot.h"
#if !defined(CERNLIB_IBM)
      SUBROUTINE WHICH(ISIT,IVAL)
C         CERN PACKAGE Z034   MACHINE/SYSTEM IDENTIFICATION
#endif
      DATA IMAC / 4H    /
      ISIT = 0
      IVAL = IMAC
      END
