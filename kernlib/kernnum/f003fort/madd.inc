*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:55  mclareni
* Initial revision
*
*
*
* madd.inc
*
          MM  =  M
          NN  =  N
          IF(MM .GT. NN) THEN
             MN  =  NN
             NN  =  MM
             MM  =  MN
             IJ  =  JX
             JX  =  IX
             IX  =  IJ
             IJ  =  JY
             JY  =  IY
             IY  =  IJ
             IJ  =  JZ
             JZ  =  IZ
             IZ  =  IJ
          ENDIF
          LXI1  =  1
          LYI1  =  1
          LZI1  =  1
          DO 12     I  =  1, MM
             LXIJ  =  LXI1
             LYIJ  =  LYI1
             LZIJ  =  LZI1
             DO 11  J  =  1, NN
                Z(LZIJ)  =  ADD( X(LXIJ),Y(LYIJ) )
                LXIJ     =  LXIJ + JX
                LYIJ     =  LYIJ + JY
                LZIJ     =  LZIJ + JZ
  11            CONTINUE
             LXI1  =  LXI1 + IX
             LYI1  =  LYI1 + IY
             LZI1  =  LZI1 + IZ
  12         CONTINUE
          RETURN
          END
