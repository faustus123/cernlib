*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:36  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE ZABEND
      PRINT *,'ZABEND routine for FATMEN reached - ZPOSTM cancelled'
#if defined(CERNLIB_VAXVMS)
      CALL SYS$EXIT(%VAL(1736938))
#endif
#if defined(CERNLIB_UNIX)
      CALL FAEXIT(16)
#endif
#if defined(CERNLIB_IBM)
      STOP 16
#endif
 
      END
 
