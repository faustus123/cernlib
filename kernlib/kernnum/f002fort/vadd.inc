*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:49  mclareni
* Initial revision
*
*
*
* vadd.inc
*
          LXJ  =  1
          LYJ  =  1
          LZJ  =  1
          DO 10     J  =  1, N
             Z(LZJ)  =  ADD( X(LXJ),Y(LYJ) )
             LXJ     =  LXJ + JX
             LYJ     =  LYJ + JY
             LZJ     =  LZJ + JZ
  10      CONTINUE
          RETURN
          END
