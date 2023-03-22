
      subroutine STDWISND(ilbl,lok)

C... write end run information for Isajet
C    contains cross sections and luminosity
C
C        lok = 0 if no problems were encountered

#include "final.inc"
#include "stdlun.inc"

      integer ilbl,lok,NBUF

      NBUF = 4
      write(lnhwrt,ERR=900) ilbl,NBUF
      write(lnhwrt,ERR=900) NKINF,SIGF,ALUM,ACCEPT

      return
900   lok = 1
      write (lnhout,1005)
      return
 1005 format(/5X,'STDWISND: write error')
      end
