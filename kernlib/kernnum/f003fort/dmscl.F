*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:57  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          DMSCL(M,N,S,X,X12,X21,Z,Z12,Z21)
          DOUBLE PRECISION    S, X(*),X12(*),X21(*), Z(*),Z12(*),Z21(*)
          DOUBLE PRECISION    FUNCT, A
          FUNCT(A)  =  S*A
          IF(M .LE. 0  .OR. N .LE. 0)  RETURN
#include "dxij.inc"
#include "dzij.inc"
#include "mcpy.inc"
