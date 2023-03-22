*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:58  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE DBKXIN (ITIME, IUDIV, LU, LSUP, JBIAS, NWKEY, KEY,
     +                   IPREC)
#include "hepdb/cdcblk.inc"
      DIMENSION       ITIME(9), KEY(9), LSUP(9), LU(9)
*
      CALL CDKXIN (ITIME, IUDIV, LU, LSUP, JBIAS, NWKEY, KEY, IPREC,IRC)
      IQUEST(1) = IRC
*
      END
