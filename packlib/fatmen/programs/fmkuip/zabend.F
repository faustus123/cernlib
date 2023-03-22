*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:43  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE ZABEND
#include "zebra/zstate.inc"
      PRINT *,'ZABEND routine for FATMEN reached - ZPOSTM cancelled'
      IF(NQPHAS.LE.0) CALL ABEND
      NQPHAS = - 2
      CALL ZEND
      END
 
