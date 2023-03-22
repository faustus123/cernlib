*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:59  mclareni
* Initial revision
*
*
*
* dotxjyj.inc
*
                DO 11 J  =  1, N
                   SUM   =  DOTF(X(LXIJ),Y(LYJL),SUM)
                   LXIJ  =  LXIJ + JX
                   LYJL  =  LYJL + JY
  11               CONTINUE
