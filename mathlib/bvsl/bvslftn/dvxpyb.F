*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/21 17:19:54  mclareni
* Initial revision
*
*
#include "pilot.h"
*CMZ :          06/11/90  14.36.25  by  Michel Roethlisberger/IBM
*-- Author :
      SUBROUTINE DVXPYB (NW,LV,Y,X,V)
C
C  ************************************************************
C  *                                                          *
C  * Author: M.Roethlisberger/IBM                             *
C  *                                                          *
C  * Date:  6 Nov 1990,  V1.01,  Creation of the module       *
C  *                                                          *
C  ************************************************************
C
      LOGICAL    LV(*)
#include "defsp.inc"
     +           Y (*), X(*), V(*)
      DO 1 I = 1,NW
        IF (LV(I)) Y(I)=Y(I)+V(I)*X(I)
    1 CONTINUE
      RETURN
      END
