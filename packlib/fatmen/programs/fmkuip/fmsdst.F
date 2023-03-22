*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:42  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMSDST
 
#include "fatmen/fatsys.inc"
#include "fatmen/fatsat.inc"
#include "fatmen/fatinit.inc"
 
      IF(LDSTST.EQ.0) THEN
         PRINT *,'FMSDST. destination site has not been set'
      ELSE
         PRINT *,'FMSDST. destination site is ',CHDEST(1:LDSTST)
      ENDIF
 
      END
