
      subroutine STDRISND(NBUF,lok)

C... read end run information for Isajet
C    contains cross sections and luminosity
C
C       NBUF = buffer size
C
C        lok = 0 if no problems were encountered

#include "final.inc"
#include "stdlun.inc"

      integer lok,NBUF

      READ(lnhrd,ERR=900) NKINF,SIGF,ALUM,ACCEPT

      return
900   lok = 1
      write (lnhout,1005)
      return
 1005 format(/5X,'STDRISND: read error')
      end
