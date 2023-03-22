
      subroutine STDWHWBG(ilbl,lok)

C  write begin run herwig information
C
C        lok = 0 if no problems were encountered

#include "herwig.inc"
#include "stdlun.inc"

      integer ilbl,lok,I,K,NB

C  2442 integers
C  2259 + 12*NMXSUD double precision

      NB = 6960 + NMXSUD*24
      write(lnhwrt,ERR=900) ilbl,NB
      write(lnhwrt,ERR=900) (RMASS(I),I=1,264),(BFRAC(I),I=1,460),
     1     (CMMOM(I),I=1,460),ETAMIX,(IDPDG(I),I=1,264),
     2     (ICHRG(I),I=1,264),(MADDR(I),I=1,264),(MODES(I),I=1,264),
     3     (MODEF(I),I=1,264),((IDPRO(I,K),I=1,3),K=1,460),NRES,
     4     NMXSUD,ACCUR,((QEV(I,K),I=1,NMXSUD),K=1,6),
     5     ((SUD(I,K),I=1,NMXSUD),K=1,6),INTER,NQEV,NSUD,SUdoRD,
     6     VECWT,TENWT,DECWT,(QWT(I),I=1,3),(PWT(I),I=1,12),
     7     (SWT(I),I=1,264),(SWTEF(I),I=1,264),(RESWT(I),I=1,264)
      return
900   lok = 1
      return
      end
