*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:48:55  mclareni
* Initial revision
*
*
*
* mbil.inc
*
          LXI  =  1
          LYI  =  1
          DO 12     I  =  1, N
             SYZ   =  ZERO
             LYIJ  =  LYI
             LZJ   =  1
             DO 11  J  =  1, N
                SYZ   =  F(Y(LYIJ),Z(LZJ),SYZ)
                LYIJ  =  LYIJ + JY
                LZJ   =  LZJ + JZ
  11            CONTINUE
             SXYZ  =  G(SYZ,X(LXI),SXYZ)
             LXI   =  LXI + IX
             LYI   =  LYI + IY
  12         CONTINUE
