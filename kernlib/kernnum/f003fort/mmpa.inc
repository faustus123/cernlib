*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:55  mclareni
* Initial revision
*
*
*
* mmpa.inc
*
          LXI1  =  1
          LZI   =  1
          DO 12     I  =  1, M
             LXIJ  =  LXI1
             LYJ   =  1
             SUM   =  SIGNF( Z(LZI) )
             DO 11  J  =  1, N
                SUM  =  F(X(LXIJ),Y(LYJ),SUM)
                LXIJ =  LXIJ + JX
                LYJ  =  LYJ + JY
  11            CONTINUE
             Z(LZI)  =  SUM
             LXI1    =  LXI1 + IX
             LZI     =  LZI + IZ
  12         CONTINUE
          RETURN
          END
