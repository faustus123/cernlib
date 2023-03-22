*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:10  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMMAKE(GENAME,CHLUN,LENTRY,IRC)
*
*     New FMMAKE - just interface to FMOPEN
*
#include "fatmen/fatbug.inc"
      CHARACTER*(*) GENAME,CHLUN
      CHARACTER*4   CHOPT
 
      IRC = 0
      LGN = LENOCC(GENAME)
 
      IF(IDEBFA.GE.2) PRINT *,'FMMAKE. enter for ',
     +   GENAME(1:LGN),' ',CHLUN,' LBANK = ',LENTRY
 
      CHOPT = 'WU'
 
      CALL FMOPEN(GENAME(1:LGN),CHLUN,LENTRY,CHOPT,IRC)
 
      END
