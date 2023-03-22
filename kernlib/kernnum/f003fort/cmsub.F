*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:58  mclareni
* Initial revision
*
*
#include "kernnum/pilot.h"
          SUBROUTINE          CMSUB(M,N,X,X12,X21,Y,Y12,Y21,Z,Z12,Z21)
          COMPLEX             X(*), X12(*), X21(*), Y(*), Y12(*), Y21(*)
          COMPLEX             Z(*), Z12(*), Z21(*), ADD,  A,      B
          ADD(A,B)  =  A-B
#include "cxij.inc"
#include "cyij.inc"
#include "czij.inc"
#include "madd.inc"
