*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:24  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.37.00  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE CSTPAR(N,BUF)
***--------------------------------
#include "comis/cswpar.inc"
        CHARACTER *(*) BUF
      CALL CSXPAR(N)
      BUF=' '
      IF(IREP.LE.0)RETURN
      J=MJSCHA(BUF)
      NCH=LEN(BUF)
      NN=MIN0(NCH,NCHP)
      IF(NN.GT.0)CALL CCOPYS(JCHP,J,NN)
      END
