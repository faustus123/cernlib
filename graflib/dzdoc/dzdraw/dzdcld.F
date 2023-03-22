*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/04 16:13:18  mclareni
* Initial revision
*
*
#include "dzdoc/pilot.h"
      SUBROUTINE DZDCLD
*     close RZ doc file
#include "dzdzbrinc.inc"
      CHARACTER*80 CDSAVE
      IF(LUDOCB.LE.0)THEN
*         WRITE(*,*)' No Doc-file open'
      ELSE
         CALL RZCDIR(CDSAVE,'R')
         CALL RZCDIR(CTDDOC,' ')
         CALL RZFREE('RZFILE')
         CALL RZEND(CTDDOC(3:))
         CALL RZCDIR(CDSAVE,' ')
*         WRITE(*,'(A,A)')' Closing bank doc'
         CLOSE(UNIT=LUDOCB)
         LUDOCB=0
      ENDIF
      END
