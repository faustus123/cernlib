      subroutine STDRD(NSZ,lok)
C******************************************************************************
C
C  this is the old version for use only with event files written by stdhep 2.x
C
C******************************************************************************

C...Purpose: to read an event from the standard common block.
C
C       NSZ = buffer size  (NHEPO*16+1)
C        lok = 0 if no problems were encountered
C
#include "stdhep.inc"
#include "stdhep_old.inc"
#include "stdcnt.inc"
#include "stdlun.inc"

      integer I,J,K,lok,NSZ,NPRT

      lok = 0
      if(lnhrd.LE.0)then
      else
        NPRT = (NSZ - 1)/16
C...now read the rest of the event
        if(NPRT.LE.0)then
          write(lnhout,101)
        elseif((NHEPO+NPRT).GT.NMXHEP)then
C... if the event would overflow the arrays, read it into the buffer
          write(lnhout,201)
          call STDRDBUF(lok)
        else
          READ(lnhrd,ERR=900) NEVHEPO,(ISTHEPO(I+NHEPO),I=1,NPRT),
     1        (IDHEPO(I+NHEPO),I=1,NPRT),
     2        ((JMOHEPO(K,I+NHEPO),K=1,2),I=1,NPRT),
     3        ((JDAHEPO(K,I+NHEPO),K=1,2),I=1,NPRT),
     4        ((PHEPO(K,I+NHEPO),K=1,5),I=1,NPRT),
     5        ((VHEPO(K,I+NHEPO),K=1,5),I=1,NPRT)
          nmultio = nmultio + 1
C... adjust pointers for "multiople interaction" events
          do J=1,NPRT
            jmultio(NHEPO+J) = nmultio
            do K=1,2
              JMOHEPO(K,J+NHEPO) = JMOHEPO(K,J+NHEPO) + NHEPO
              JDAHEPO(K,J+NHEPO) = JDAHEPO(K,J+NHEPO) + NHEPO
            enddo
          enddo
          NHEPO = NHEPO + NPRT
          nstdrd = nstdrd + 1
        endif
      endif
      return
  900 write (lnhout,901) NEVHEPO
      lok=1
      return
  101 format(/5X,'STDRD: no particles to read in this event')
  201 format(/5X,'STDRD: event will overflow HEPEVT array size'/
     1       12X,'this event will NOT be put into the HEPEVT common')
  901 format(/5X,'STDRD: read error on event',I8)
      end
