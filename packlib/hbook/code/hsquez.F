*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:07:47  mclareni
* Initial revision
*
*
#include "hbook/pilot.h"
*CMZ :  4.13/00 01/05/91  17.37.01  by  Rene Brun
*-- Author :
      SUBROUTINE HSQUEZ(KORDRE)
*.==========>
*.           SUPPRESS (RESTORE) PAGE EJECT AT PRINTING
*..=========> ( R.Brun )
#include "hbook/hcprin.inc"
      CHARACTER*(*)  KORDRE
*.___________________________________________
      KSQUEZ=0
      CALL UCTOH(KORDRE,IOP,4,4)
      IF(IOP.NE.INO)KSQUEZ=1
      END
