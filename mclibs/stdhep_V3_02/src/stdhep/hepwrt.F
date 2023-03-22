
      subroutine HEPWRT(ilbl,lok)

C...Purpose: to write a buffer or an event from the standard common block.
C
C        if ilbl = 1        write HEPEVT common block
C          ilbl = 100   write STDHEP begin run record
C          ilbl = 101        write PYTHIA begin run record
C          ilbl = 102        write JETSET begin run record
C          ilbl = 103        write HERWIG begin run record
C          ilbl = 104        write ISAJET begin run record
C          ilbl = 105        write QQ begin run record
C          ilbl = 200        write STDHEP end run record
C          ilbl = 201        write PYTHIA end run record
C          ilbl = 202        write JETSET end run record
C          ilbl = 203        write HERWIG end run record
C          ilbl = 204        write ISAJET end run record
C          ilbl = 205        write QQ end run record
C           otherwise,        write buffer
C
C        lok = 0 if no problems were encountered

#include "obuf.inc"
#include "stdcnt.inc"
#include "stdlun.inc"

      integer I,ilbl,lok
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
      if(ilbl.EQ.1)then
C... the stdhep common block has keyword 1
        call STDWRT(ilbl,lok)
      elseif(ilbl.GE.100 .AND. ilbl.LE.105)then
        call STDWBGN(ilbl,lok)
      elseif(ilbl.GE.200 .AND. ilbl.LE.205)then
        call stdwend(ilbl,lok)
      else
C... dump the buffer contents
        if(NBUF.LE.0)then
          write(lnhout,101)
        else
          write(lnhwrt,ERR=900) ilbl,NBUF
          write(lnhwrt,ERR=900) (IBUF(I),I=1,NBUF)
        endif
      endif
      return
  900 write (lnhout,901)
      lok=1
      return
  101 format(/5X,'HEPWRT: the output buffer is empty')
  901 format(/5X,'HEPWRT: write error')
      end
