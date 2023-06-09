*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:51  mclareni
* Initial revision
*
*
#include "epio/pilot.h"
#if defined(CERNLIB_CDC)||defined(CERNLIB_UNIVAC)
      SUBROUTINE CFRIBM(ARRAY,NW,MODE)
C.+++++++ CDC AND UNIVAC VERSION ++++++++++
C. CONVERTS THE FIRST NW WORDS OF ARRAY FROM IBM TO MACHINE FORMAT.
C. THE NUMBERS MUST BE RIGHT ADJ., ZERO FILLED.
C. MODE = 1 : CONVERT 16 BIT INTEGERS
C.      = 2 : CONVERT 32 BIT INTEGERS
C.      = 3 : CONVERT 32 BIT FLOATING
      DIMENSION ARRAY( 1)
C
      IF(NW.LE.0)    RETURN
C
      IF(MODE.EQ.1)  CALL I16ITC(ARRAY,NW)
      IF(MODE.EQ.2)  CALL CVT360(ARRAY(1),ARRAY(NW),1)
      IF(MODE.EQ.3)  CALL CVT360(ARRAY(1),ARRAY(NW),0)
      RETURN
      END
#endif
