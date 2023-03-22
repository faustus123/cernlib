*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:57  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          RMSUB(M,N,X,X12,X21,Y,Y12,Y21,Z,Z12,Z21)
          REAL                X(*), X12(*), X21(*), Y(*), Y12(*), Y21(*)
          REAL                Z(*), Z12(*), Z21(*), ADD,  A,      B
          ADD(A,B)  =  A-B
#include "rxij.inc"
#include "ryij.inc"
#include "rzij.inc"
#include "madd.inc"
