*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/01 11:38:45  mclareni
* Initial revision
*
*
#include "paw/pilot.h"
*CMZ :  2.04/15 05/03/94  19.30.27  by  Fons Rademakers
*-- Author :    Marthe Brun
      LOGICAL FUNCTION PNUMCH(KCHAR)
*
#include "paw/pachar.inc"
      CHARACTER*1 KCHAR
*
      ICODE=ICHAR(KCHAR)
      IF((ICODE.GE.JZERO.AND.ICODE.LE.JNEUF).OR.
     +   (ICODE.GE.JAMAX.AND.ICODE.LE.JZMAX).OR.
     +   (ICODE.GE.JAMIN.AND.ICODE.LE.JZMIN).OR.
     +    ICODE.EQ.JDOLL.OR.ICODE.EQ.JSCOR)THEN
         PNUMCH=.TRUE.
      ELSE
         PNUMCH=.FALSE.
      ENDIF
      END
