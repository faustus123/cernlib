*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:18  mclareni
* Initial revision
*
*
#include "cspack/pilot.h"
      SUBROUTINE ZFVERS
#include "cspack/quest.inc"
      CHARACTER    VIDQQ*(*)
      PARAMETER   (VIDQQ = '@(#)' //
     + 'CSPACK   1.35/09    Q124'
     + // '                              '
     + // '>')
      CALL CLEFT (VIDQQ,1,0)
      IDATQQ = 0
      ITIMQQ = 0
      PRINT *,
     + 'CSPACK   1.35/09    Q124'
     + // '                              '
      PRINT *,'         This version created on ',IDATQQ,
     +        ' at ',ITIMQQ
      END
 
