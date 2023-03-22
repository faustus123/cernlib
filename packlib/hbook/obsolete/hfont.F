*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/16 17:08:11  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_hbook/pilot.h"
*CMZ :  4.21/08 17/01/94  13.15.11  by  Rene Brun
*-- Author :
      SUBROUTINE HFONT(ID,KTYP)
*.==========>
*.           To fill an ONT from the /HCBONT/ data structure
*..=========> ( R. Brun )
*
#include "hcbont.inc"
*___________________________________________________________________
*
      KONTYP = KTYP
      CALL HFNT1(ID, '*')
*
      KONTYP = 0
      NCHONT = 0
      NONT  = 0
*
      END
