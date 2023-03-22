*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:23:38  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDXINIZ
*     ------------------
*     CDEX Z initialization after CDPAW call
*                             Author :    Boris Khomenko
      IMPLICIT NONE
*
#include "cdxdiv.inc"
*
#include "dbrinf.inc"
*
*     - declare LINK areas
      CALL MZLINK(ICDXDIV,'/CDULNK/',LCDXDIV,LCDXDIV,LCDXDIV)
      IDBRDIV=ICDXDIV
      CALL MZLINK(IDBRDIV,'/DBRLNK/',LDBRKY, LDBRDA, LDBRKY)
*
      END
