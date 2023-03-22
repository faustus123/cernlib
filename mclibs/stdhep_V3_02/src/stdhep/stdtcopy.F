      subroutine stdtcopy(idir,lok)

C...Purpose: to copy an event to/from the standard common block.
C

#include "stdhep.inc"
#include "stdtmp.inc"
#include "stdlun.inc"

      integer idir,lok,i,k

      lok=0
      if(idir.eq.1)then
c... copy from hepevt to stdtmp
        nhept = nhep
        nevhept = nevhep
        do i=1,nhep
          isthept(i) = isthep(i)
          idhept(i) = idhep(i)
          do k=1,2
            jmohept(k,i) = jmohep(k,i)
            jdahept(k,i) = jdahep(k,i)
          enddo
          do k=1,5
            phept(k,i) = phep(k,i)
          enddo
          do k=1,4
            vhept(k,i) = vhep(k,i)
          enddo
        enddo
      elseif(idir.eq.2)then
c... copy from stdtmp to hepevt
c... allow for multiple interactions
        if((nhep+nhept) .gt. NMXHEP) go to 900
        nevhep = nevhept
        do i=1,nhept
          isthep(i+nhep) = isthept(i)
          idhep(i+nhep) = idhept(i)
          do k=1,2
            jmohep(k,i+nhep) = jmohept(k,i)
            jdahep(k,i+nhep) = jdahept(k,i)
          enddo
          do k=1,5
            phep(k,i+nhep) = phept(k,i)
          enddo
          do k=1,4
            vhep(k,i+nhep) = vhept(k,i)
          enddo
        enddo
        nmulti = nmulti + 1
C... adjust pointers for "multiple interaction" events
        do i=1,nhept
          jmulti(nhep+i) = nmulti
          do k=1,2
            jmohep(k,i+nhep) = jmohep(k,i+nhep) + nhep
            jdahep(k,i+nhep) = jdahep(k,i+nhep) + nhep
          enddo
        enddo
        nhep = nhep + nhept
      else
        write (lnhout,801)
      endif
      return
  900 continue
      write (lnhout,901) nevhept
      lok = 5 
      return
  801 format(/5X,'STDTCOPY: improper calling flag')
  901 format(/5X,'STDTCOPY: event would overflow HEPEVT array size'/
     1        5X,'STDTCOPY: event ',i8,' has been lost')
      end
