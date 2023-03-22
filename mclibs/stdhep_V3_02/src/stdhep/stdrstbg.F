
      subroutine STDRSTBG(NB,lok)

C  read begin run stdhep information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "stdcm1.inc"
#include "stdlun.inc"

      integer NB,lok

      READ(lnhrd,ERR=900) STDECOM,STDXSEC,STDSEED1,STDSEED2,
     1              NEVTREQ,NEVTGEN,NEVTWRT
      return
  900 lok = 1
      return
      end
