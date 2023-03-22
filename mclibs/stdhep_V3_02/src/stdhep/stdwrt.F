
      subroutine STDWRT(ilbl,lok)

C...Purpose: to write an event from the standard common block.
C
C        lok = 0 if no problems were encountered

#include "stdhep.inc"
#include "stdcnt.inc"
#include "stdlun.inc"

      integer I,K,ilbl,lok,NBUF

      lok=0
      if(lnhwrt.LE.0)then
      elseif(NHEP.LE.0)then
        write(lnhout,101) NEVHEP
      else
        NBUF = NHEP*15 + 1
        write(lnhwrt,ERR=900) ilbl,NBUF
        write(lnhwrt,ERR=910) NEVHEP,(ISTHEP(I),I=1,NHEP),
     1        (IDHEP(I),I=1,NHEP),((JMOHEP(K,I),K=1,2),I=1,NHEP),
     2        ((JDAHEP(K,I),K=1,2),I=1,NHEP),
     3        ((PHEP(K,I),K=1,5),I=1,NHEP),
     4        ((VHEP(K,I),K=1,4),I=1,NHEP)
        nstdwrt = nstdwrt + 1
      endif
      return
  900 write (lnhout,901) NEVHEP
      lok=1
      return
  910 write (lnhout,911) NEVHEP
      lok=1
      return
  101 format(/5X,'STDWRT: no particles to write in event',I8)
  901 format(/5X,'STDWRT: write error on event label',I8)
  911 format(/5X,'STDWRT: write error on event contents',I8)
      end
