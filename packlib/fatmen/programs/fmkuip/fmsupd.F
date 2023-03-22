*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:43  mclareni
* Initial revision
*
*
#include "fatmen/pilot.h"
      SUBROUTINE FMSUPD
#include "fatmen/fatupd.inc"
 
      PRINT 9001,NUPDT,MAXUPD
      IF(NGROUP.GT.1) PRINT 9002,NGROUP
9001  FORMAT(' FMSUPD. You have made ',I10,' updates out of ',
     +       I10,' maximum.')
9002  FORMAT('         Updates are grouped in bunches of ',I10)
 
      END
