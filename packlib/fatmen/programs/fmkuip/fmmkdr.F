*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:42  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMMKDR
#include "fatmen/fmpath.inc"
      CHARACTER*255 PATH2
      CALL KUGETC(PATH,LPATH)
      IF(LPATH.EQ.0) RETURN
      CALL FMFIXF(PATH,PATH2)
      LPATH = LENOCC(PATH2)
      PATH  = PATH2
      CALL FMKDIR(PATH(1:LPATH),IRC)
      IF(IRC.NE.0) PRINT *,'FMMKDR. Return code ',IRC,' from FMKDIR'
      END
