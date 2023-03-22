*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:18:06  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMXYIO(IBUF,IOWAY)
      DIMENSION IBUF(8192)
#include "zebra/zmach.inc"
#include "zebra/quest.inc"
#include "fatmen/fatbug.inc"
      CHARACTER*6  CHWAY
 
      IRC  = 0
      PRINT *,'Dummy version of FMXYIO called'
      PRINT *, '     IQUEST(1-6) = ', (IQUEST(J),J=1,6)
      LUN  = IQUEST(1)
      NREC = IQUEST(4)
      IF(IOWAY.EQ.0) THEN
         PRINT *, 'FMXYIO: ignore request to read from unit', LUN
         PRINT *, 'FMXYIO: records requested: ', NREC
      ELSEIF(IOWAY.EQ.1) THEN
         PRINT *, 'FMXYIO: ignore request to write on unit', LUN
         PRINT *, 'FMXYIO: records requested: ', NREC
      ELSE
         WRITE(CHWAY,'(I6)') IOWAY
         CALL ZFATAM('Invalid value for IOWAY in FMXYIO - '//CHWAY)
      ENDIF
 
      IQUEST(1) = IRC
 
      END
