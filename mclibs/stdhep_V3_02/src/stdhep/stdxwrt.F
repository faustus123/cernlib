      subroutine stdxwrt(ilbl,istream,lok)

C...Purpose: to write a buffer or an event from the standard common block.
C
C        if ilbl = 1        write HEPEVT common block
C           ilbl = 2        write HEPEVT common block and HEPEV2 common block
C          ilbl = 100   write STDHEP begin run record
C          ilbl = 200        write STDHEP end run record
C           otherwise,        don't do anything
C
C        lok = 0 if no problems were encountered

#include "stdcnt.inc"
#include "stdlun.inc"

      integer ilbl,lok,istream
      logical lfirst
      data lfirst/.TRUE./
      save lfirst

C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        nstdwrt = 0
        lfirst=.FALSE.
      endif

      lok=0
      if(ilbl.eq.1 .or. ilbl.eq.2)then
C... the stdhep common block and maybe the multiple interaction common
        call stdxwevt(ilbl,istream,lok)
      elseif(ilbl.eq.100)then
        call stdxwcm1(ilbl,istream,lok)
      elseif(ilbl.eq.200)then
        call stdxwcm1(ilbl,istream,lok)
      else
        write(lnhout,902) ilbl
      endif
      return
  900 write (lnhout,901)
      lok=1
      return
  101 format(/5X,'STDXWRT: the output buffer is empty')
  901 format(/5X,'STDXWRT: write error')
  902 format(/5X,'STDXWRT: do not know what to do with record type',i5)
      end
