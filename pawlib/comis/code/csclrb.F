*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:22  mclareni
* Initial revision
*
*
#include "comis/pilot.h"
*CMZ :  1.11/01 24/01/91  11.36.57  by  Rene Brun
*-- Author : V.Berezhnoi
      SUBROUTINE CSCLRB(PR)
        CHARACTER *(*) PR
#include "comis/csrec.inc"
         COMMON/CSCHBP/NP,NF
      NP=LEN(PR)+1
      NF=NP
      REC1=PR
      END
