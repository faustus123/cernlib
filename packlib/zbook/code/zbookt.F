*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 12:01:10  mclareni
* Initial revision
*
*
#include "zbook/pilot.h"
      SUBROUTINE ZBOOKT ( LUN)
C.
C.
C.    ******************************************************************
C.    *                                                                *
C.    *                                                                *
C.    *                                                                *
C.    *                                                                *
C.    ******************************************************************
C.
      WRITE (LUN,1000)
      RETURN
 1000 FORMAT ('0PACKAGE COMPILED FROM PAM FILE= ',
     + 40H ZBOOK  2.28  940830  Q210                 
     +/)
      END
