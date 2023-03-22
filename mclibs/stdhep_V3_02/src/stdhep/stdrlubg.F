
      subroutine STDRLUBG(NB,lok)

C  read begin run lund information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "ludat1.inc"
#include "ludat2.inc"
#include "ludat3.inc"
#include "stdlun.inc"

      integer NB,lok,I,K

      if(NB.NE.23816)then
C... read the buffer
        call STDRDBUF(lok)
        lok = lok + 10
        return
      endif
      READ(lnhrd,ERR=900) (MSTU(I),I=1,200),(PARU(I),I=1,200),
     1     (MSTJ(I),I=1,200),(PARJ(I),I=1,200),
     2     ((KCHG(I,K),I=1,500),K=1,3),((PMAS(I,K),I=1,500),K=1,4),
     3     (PARF(I),I=1,2000),((VCKM(I,K),I=1,4),K=1,4),
     4     ((MDCY(I,K),I=1,500),K=1,3),((MDME(I,K),I=1,2000),K=1,2),
     5     (BRAT(I),I=1,2000),((KFDP(I,K),I=1,2000),K=1,5)
      return
900   lok = 1
      return
      end
