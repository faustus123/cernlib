      subroutine stdoldcopy

C...Purpose: to copy an event to the new standard common block.
C            real => double precision
C

#include "stdhep.inc"
#include "stdhep_old.inc"

      integer i,k

c... copy from stdhep_old to hepevt
c... allow for multiple interactions
      nevhep = nevhepo
      nhep = nhepo
      nmulti = nmultio
      do i=1,nhep
        isthep(i) = isthepo(i)
        idhep(i) = idhepo(i)
        jmulti(i) = jmultio(i)
        do k=1,2
          jmohep(k,i) = jmohepo(k,i)
          jdahep(k,i) = jdahepo(k,i)
        enddo
        do k=1,5
          phep(k,i) = phepo(k,i)
        enddo
        do k=1,4
          vhep(k,i) = vhepo(k,i)
        enddo
      enddo
      return
      end
