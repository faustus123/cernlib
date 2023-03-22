
      subroutine STDRD(NSZ,lok)

C...Purpose: to read an event from the standard common block.
C
C       NSZ = buffer size  (NHEP*16+1)
C        lok = 0 if no problems were encountered
C
#include "stdhep.inc"
#include "stdcnt.inc"
#include "stdlun.inc"

      integer I,J,K,lok,NSZ,NPRT

      lok = 0
      if(lnhrd.LE.0)then
      else
        NPRT = (NSZ - 1)/15
C...now read the rest of the event
        if(NPRT.LE.0)then
          write(lnhout,101)
        elseif((NHEP+NPRT).GT.NMXHEP)then
C... if the event would overflow the arrays, read it into the buffer
          write(lnhout,201)
          call STDRDBUF(lok)
        else
          READ(lnhrd,ERR=900) NEVHEP,(ISTHEP(I+NHEP),I=1,NPRT),
     1        (IDHEP(I+NHEP),I=1,NPRT),
     2        ((JMOHEP(K,I+NHEP),K=1,2),I=1,NPRT),
     3        ((JDAHEP(K,I+NHEP),K=1,2),I=1,NPRT),
     4        ((PHEP(K,I+NHEP),K=1,5),I=1,NPRT),
     5        ((VHEP(K,I+NHEP),K=1,4),I=1,NPRT)
          nmulti = nmulti + 1
C... adjust pointers for "multiple interaction" events
          do J=1,NPRT
            jmulti(NHEP+J) = nmulti
            do K=1,2
              JMOHEP(K,J+NHEP) = JMOHEP(K,J+NHEP) + NHEP
              JDAHEP(K,J+NHEP) = JDAHEP(K,J+NHEP) + NHEP
            enddo
          enddo
          NHEP = NHEP + NPRT
          nstdrd = nstdrd + 1
        endif
      endif
      return
  900 write (lnhout,901) NEVHEP
      lok=1
      return
  101 format(/5X,'STDRD: no particles to read in this event')
  201 format(/5X,'STDRD: event will overflow HEPEVT array size'/
     1       12X,'this event will NOT be put into the HEPEVT common')
  901 format(/5X,'STDRD: read error on event',I8)
      end
