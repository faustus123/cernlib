*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:06  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDPDL(LUN,CST,N)
      CHARACTER*(*) CST
      CHARACTER*12 CTEMP
      WRITE(CTEMP,'(I12)')N
      IFC=INDEXC(CTEMP,' ')
      WRITE(LUN,'(A,A)')CST,CTEMP(IFC:)
      END
 
***********************************************************************
