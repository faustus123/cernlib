*
* $Id$
*
* $Log$
* Revision 1.1  1995/12/12 14:36:20  mclareni
* Initial revision
*
*
#include "sigma/pilot.h"
*CMZ :  1.06/00 14/08/89  15.16.01  by  Carlo E. Vandoni
*-- Author :
         SUBROUTINE SIWAIT
         PRINT *, ' TYPE RETURN TO CONTINUE'
         READ (*,1)
 1       FORMAT(1X)
 999  END
