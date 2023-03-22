*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:17  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZABEND
#include "cspack/zstate.inc"
      PRINT *,'ZABEND routine for ZFTP reached - ZPOSTM cancelled'
      IF(NQPHAS.LE.0) CALL ABEND
      NQPHAS = - 2
      CALL ZEND
      END
 
