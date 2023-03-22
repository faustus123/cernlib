*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:05  mclareni
* Initial revision
*
*
#include "kerngen/pilot.h"
@PROCESS AUTODBL(NONE)
      SUBROUTINE ADWRTK(LUN,IA,ND,ISW)
      INTEGER IA(2*ND)
      INTEGER ISW
*
      WRITE(LUN,IOSTAT=ISW) (IA(J),J=1,2*ND)
      END
