
      subroutine STDRDBUF(lok)

C...Purpose: to read a buffer
C
C        lok = 0 if no problems were encountered

#include "obuf.inc"
#include "stdlun.inc"

      integer I,J,lok

      lok = 0
C... read the buffer
C...set everything to zero
      do J=1,NMXBUF
        IBUF(J)=0
      enddo
C...now read the rest of the event
      if(NBUF.LE.0)then
        write(lnhout,101)
      else
        READ(lnhrd,ERR=950) (IBUF(I),I=1,NBUF)
      endif
      return
  950 write (lnhout,951)
      lok=2
      return
  101 format(/5X,'STDRDBUF: no data to read for this buffer')
  951 format(/5X,'STDRDBUF: error reading buffer')
      end
