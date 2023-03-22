*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:50  mclareni
* Initial revision
*
*
*
* vset.inc
*
          LZJ  =  1
          DO 10     J  =  1, N
             Z(LZJ)  =  S
             LZJ     =  LZJ + JZ
  10         CONTINUE
          RETURN
          END
