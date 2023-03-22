*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:38  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDXINI0
*     ------------------
*
      IMPLICIT NONE
*
#include "cdxdiv.inc"
*
#include "cdxfils.inc"
*
#include "dbrinf.inc"
*
*     -- local variables --
      INTEGER I
*
*     -- init /CDUSDIV/ --
      ICDXDIV=0
      LCDXDIV=0
*
*     -- init /CDXFILS/ --
      NCDXFIL=0
      KCDXFIL=0
      DO I=1,MCDXFIL
        ICXFSTA(I)=0
        CDXFPRF(I)=' '
        CDXFTOP(I)=' '
        CDXFNAM(I)=' '
      ENDDO
*
*     -- init /DBRINF/ --
*
      END
