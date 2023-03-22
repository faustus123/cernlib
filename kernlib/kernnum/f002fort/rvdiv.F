*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RVDIV(N,X,X2,Y,Y2,Z,Z2,IFAIL)
          REAL                X(*), X2(*), Y(*), Y2(*), Z(*), Z2(*), T
          REALF(T)  =  T
          IFAIL     =  0
          IF(N .LE. 0)  RETURN
#include "rxj.inc"
#include "ryj.inc"
#include "rzj.inc"
#include "vdiv.inc"
