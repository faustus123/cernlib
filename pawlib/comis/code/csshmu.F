*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:15  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.36.32  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE CSSHMU
      COMMON/MDIND/MSTCK,MHEAP
      CALL CSINFH(MHEAP,NSIZE,NPIECE,NUSED,NFREE,NPERC,
     +            NBLOCK,AVERBS,DISBS,NASKED,AVSTEP)
        PRINT *,'  memory usage:'
        PRINT *,'  total size  ',NSIZE
        PRINT *,'  used        ',NUSED
        PRINT *,'  free        ',NFREE,REAL(NFREE)/REAL(NSIZE)*100,'%'
        PRINT *,'  no_pieces   ',NPIECE
       END
