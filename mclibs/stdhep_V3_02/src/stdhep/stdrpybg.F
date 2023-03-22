
      subroutine STDRPYBG(NB,lok)

C  read begin run pythia information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "pysubs.inc"
#include "pypars.inc"
#include "stdlun.inc"

      integer NB,lok,I,K

      if(NB.NE.1363)then
C... read the buffer
        call STDRDBUF(lok)
        lok = lok + 10
        return
      endif
      READ(lnhrd,ERR=900) MSEL,(MSUB(I),I=1,200),
     1      ((KFIN(I,K),I=1,2),K=-40,40),(CKIN(I),I=1,200),
     2      (MSTP(I),I=1,200),(PARP(I),I=1,200),(MSTI(I),I=1,200),
     3      (PARI(I),I=1,200)
      return
900   lok = 1
      return
      end
