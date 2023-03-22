
      subroutine STDRSTND(NB,lok)

C  read stdhep end run information
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "stdcm1.inc"
#include "stdlun.inc"

      integer lok,NB

      READ(lnhrd,ERR=900) STDECOM,STDXSEC,STDSEED1,STDSEED2,
     1              NEVTREQ,NEVTGEN,NEVTWRT
      return

  900 lok = 1
      write (lnhout,1005)
 1005 format(/5X,'STDRSTND: read error')
      return
      end
