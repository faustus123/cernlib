
      subroutine STDWPYBG(ilbl,lok)

C  write begin run pythia information
C
C        lok = 0 if no problems were encountered

#include "pysubs.inc"
#include "pypars.inc"
#include "stdlun.inc"

      integer ilbl,lok,I,K,NB

      NB = 1363
      write(lnhwrt,ERR=900) ilbl,NB
      write(lnhwrt,ERR=900) MSEL,(MSUB(I),I=1,200),
     1      ((KFIN(I,K),I=1,2),K=-40,40),(CKIN(I),I=1,200),
     2      (MSTP(I),I=1,200),(PARP(I),I=1,200),(MSTI(I),I=1,200),
     3      (PARI(I),I=1,200)
      return
900   lok = 1
      return
      end
