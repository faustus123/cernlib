
      subroutine STDWSTND(ilbl,lok)

C  write stdhep end run information
C
C        lok = 0 if no problems were encountered

#include "stdcm1.inc"
#include "stdlun.inc"

      integer ilbl,lok,NB

      NB = 9
      write(lnhwrt,ERR=900) ilbl,NB
      write(lnhwrt,ERR=900) STDECOM,STDXSEC,STDSEED1,STDSEED2,
     1              NEVTREQ,NEVTGEN,NEVTWRT
      return
900   lok = 1
      return
      end
