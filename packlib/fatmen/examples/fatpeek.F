*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:59  mclareni
* Initial revision
*
*
      PROGRAM FATPEEK
*
      CHARACTER*255 GENAME
#include "fatmen/fatpara.inc"
#include "fatmen/fmnkeys.inc"
      COMMON /USRLNK/LUSRK1,LUSRBK,LADDBK,LUSRLS
      DIMENSION KEYS(LKEYFA)
      DIMENSION NFAT(NWDSFA)
*
*     Initialise FATMEN & Zebra...
*
      CALL FMSTRT(1,2,'//CERN/CNDIV',IRC)
      CALL FMLOGL(0)
*
      GENAME  = '//CERN/CNDIV/JAMIE/ZFATAL/IN'
      DO 10 I = 1,3
      CALL FMPEEK(GENAME,NFAT,'N',IRC)
      PRINT *,'Return code from FMPEEK = ',IRC
*
*     Necessary with some compilers, otherwise loop is executed
*     only once!
*
      KEYS(1) = I
      CALL FMSHOW(GENAME,-1,KEYS,'A',IRC)
10    CONTINUE
*
      CALL FMEND(IRC)
      PRINT *,'Return code ',IRC,' from FMEND'
*
      END
