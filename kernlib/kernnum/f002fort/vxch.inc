*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
*
* vxch.inc
*
          LXJ  =  1
          LYJ  =  1
          DO 10     J  =  1, N
             T       =  X(LXJ)
             X(LXJ)  =  Y(LYJ)
             Y(LYJ)  =  T
             LXJ     =  LXJ + JX
             LYJ     =  LYJ + JY
  10      CONTINUE
          RETURN
          END
