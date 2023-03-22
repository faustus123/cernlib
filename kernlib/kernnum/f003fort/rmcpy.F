*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:55  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RMCPY(M,N,X,X12,X21,Z,Z12,Z21)
          REAL                X(*),X12(*),X21(*),Z(*),Z12(*),Z21(*)
          REAL                FUNCT, A
          FUNCT(A)  =  A
          IF(M .LE. 0  .OR.  N .LE. 0)  RETURN
#include "rxij.inc"
#include "rzij.inc"
#include "mcpy.inc"
