      subroutine HEPRD(ilbl,lok)

C...Purpose: to read a buffer or an event from the standard common block.
C
C       returns ilbl & lok
C
C                ilbl = 1   - standard HEPEVT common block
C                ilbl = 100 - STDHEP begin run record
C                ilbl = 101 - PYTHIA begin run record
C                ilbl = 102 - JETSET begin run record
C                ilbl = 103 - HERWIG begin run record
C                ilbl = 104 - ISAJET begin run record
C                ilbl = 105 - QQ begin run record
C                ilbl = 200 - STDHEP end run record
C                ilbl = 201 - PYTHIA end run record
C                ilbl = 202 - JETSET end run record
C                ilbl = 203 - HERWIG end run record
C                ilbl = 204 - ISAJET end run record
C                ilbl = 205 - QQ end run record
C
C                lok = 0 if no problems were encountered
C

#include "obuf.inc"
#include "stdcnt.inc"
#include "stdlun.inc"

      integer ilbl,lok
      logical lfirst
      data lfirst/.TRUE./
      save lfirst

C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        nstdrd = 0
        lfirst=.FALSE.
      endif

      lok = 0
C...read the keyword and size
      READ(lnhrd,ERR=900,end=900) ilbl,NBUF
      if(ilbl.EQ.1)then
C... the stdhep common block has keyword 1
        call STDZERO
        call STDRD(NBUF,lok)
      elseif(ilbl.GE.100 .AND. ilbl.LE.105)then
        call STDRBGN(ilbl,NBUF,lok)
      elseif(ilbl.GE.200 .AND. ilbl.LE.205)then
        call stdrend(ilbl,NBUF,lok)
      else
C... read the buffer
        call STDRDBUF(lok)
      endif
      return
  900 write (lnhout,901)
      lok=1
      return
  901 format(/5X,'HEPRD: next record not found')
      end
