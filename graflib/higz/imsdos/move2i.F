*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/14 13:11:02  mclareni
* Initial revision
*
*
#if defined(CERNLIB_MSDOS)
#include "higz/pilot.h"
*CMZ :  1.14/11 29/06/92  13.49.21  by  Unknown
*-- Author : V.Fine
      SUBROUTINE MOVE2I(IX,IY)
#include "higz/hikern.inc"
#include "higz/hiatt.inc"
#include "higz/himeta.inc"
*
      IF (ILOPWK(IWKNB) .EQ. IDMETA) THEN
         IF (IX .NE. IXSAVE(IWKNB) .OR. IY .NE. IYSAVE(IWKNB)) THEN
            IXSAVE(IWKNB) = IX
            IYSAVE(IWKNB) = IY
            IF (IWTYL(IWKNB).EQ. ISURF) THEN
               COOR(1) = IX
               COOR(2) = (YWKSIZ(IWKNB)-IY)
               CALL GOLWRI(MA,COOR,' ')
            END IF
         END IF
      ELSE
         IER = MOVE(IX,IY)
      END IF
      END
#endif
