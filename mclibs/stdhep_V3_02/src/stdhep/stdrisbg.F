
      subroutine STDRISBG(NBUF,lok)

C... read Isajet begin run information
C
C       NBUF = buffer size
C
C        lok = 0 if no problems were encountered

      IMPLICIT NONE

#include "idrun.inc"
#include "q1q2.inc"
#include "primar.inc"
#include "keys.inc"
#include "jetlim.inc"
#include "dylim.inc"
#include "frgpar.inc"
#include "qcdpar.inc"
#include "qlmass.inc"
#include "types.inc"
#include "xmssm.inc"
C
#include "stdlun.inc"

      integer lok
      integer I,K,NBUF,MXG,MXG1

C... isajet begin run record
C
C       mxgoq = 51
C
      MXG = (NBUF - 396)/3
      READ(lnhrd,ERR=900) IDVER,(IDG(I),I=1,2),IEVT,NJET,SCM,
     1      HALFE,ECM,(IDIN(I),I=1,2),NEVENT,NTRIES,NSIGMA,MXG1,
     2      ((GOQ(I,K),I=1,MXG),K=1,3),(GOALL(I),I=1,3),
     3      (GODY(I),I=1,4),STDDY,((GOWW(I,K),I=1,25),K=1,2),
     4      (ALLWW(I),I=1,2),IKEYS,KEYON,(KEYS(I),I=1,10),
     5      (PMIN(I),I=1,3),(PMAX(I),I=1,3),(PTMIN(I),I=1,3),
     6      (PTMAX(I),I=1,3),(YJMIN(I),I=1,3),(YJMAX(I),I=1,3),
     7      (PHIMIN(I),I=1,3),(PHIMAX(I),I=1,3),(XJMIN(I),I=1,3),
     8      (XJMAX(I),I=1,3),(THMIN(I),I=1,3),(THMAX(I),I=1,3),
     9      QMIN,QMAX,QTMIN,QTMAX,YWMIN,YWMAX,XWMIN,XWMAX,THWMIN,
     *      THWMAX,PHWMIN,PHWMAX,PUD,PBARY,SIGQT,Pend,(XGEN(I),I=1,8),
     1      (PSPIN1(I),I=1,8),((PMIX1(I,K),I=1,3),K=1,2),
     2      ((PMIX2(I,K),I=1,3),K=1,2),ALAM,ALAM2,CUTJET,ISTRUC,
     3      (AMLEP(I),I=1,100),NQLEP,NMES,NBARY,(LOC(I),I=1,100),
     4      GOMSSM,XGLSS,XQKSS,XTLSS,XTRSS,XTBSS,XHASS,XMUSS,XLLSS,
     5      XLRSS,XNLSS,XATSS,XBRSS,XABSS

      if(MXG.NE.MXGOQ) lok = 2
      if(MXG1.NE.MXG) lok = 3
      return

  900 lok = 1
      write (lnhout,1005)
 1005 format(/5X,'STDRISBG: read error')
      return
      end
