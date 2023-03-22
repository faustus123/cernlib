
      subroutine STDRHWBG(NB,lok)

C  read begin run herwig information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "herwig.inc"
#include "stdlun.inc"

      integer NB,lok,I,K
      integer NMXSD,NMXSUD2

C  2442 integers
C  2259 + 12*NMXSUD double precision

      NMXSD = (NB - 6960)/24
      READ(lnhrd,ERR=900) (RMASS(I),I=1,264),(BFRAC(I),I=1,460),
     1     (CMMOM(I),I=1,460),ETAMIX,(IDPDG(I),I=1,264),
     2     (ICHRG(I),I=1,264),(MADDR(I),I=1,264),(MODES(I),I=1,264),
     3     (MODEF(I),I=1,264),((IDPRO(I,K),I=1,3),K=1,460),NRES,
     4     NMXSUD2,ACCUR,((QEV(I,K),I=1,NMXSD),K=1,6),
     5     ((SUD(I,K),I=1,NMXSD),K=1,6),INTER,NQEV,NSUD,SUdoRD,
     6     VECWT,TENWT,DECWT,(QWT(I),I=1,3),(PWT(I),I=1,12),
     7     (SWT(I),I=1,264),(SWTEF(I),I=1,264),(RESWT(I),I=1,264)
      if(NMXSUD2.NE.NMXSD) lok = 3
      return
900   lok = 1
      return
      end
