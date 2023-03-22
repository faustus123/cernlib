
      subroutine STDWBGN(ilbl,lok)

C...Purpose: to write begin run information in a standard format
C
C        if ilbl = 100   write STDHEP begin run record
C          ilbl = 101        write PYTHIA and JETSET begin run records
C          ilbl = 102        write JETSET begin run record
C          ilbl = 103        write HERWIG begin run record
C          ilbl = 104        write ISAJET begin run record
C          ilbl = 105        write QQ begin run record
C
C        lok = 0 if no problems were encountered

#include "stdlun.inc"

      integer ilbl,lok,NBUF

      lok=0
      if(lnhwrt.LE.0)then
      elseif(ilbl.EQ.100)then
        call STDWSTBG(ilbl,lok)
      elseif(ilbl.EQ.101)then
        call STDWLUBG(102,lok)
        call STDWPYBG(ilbl,lok)
      elseif(ilbl.EQ.102)then
        call STDWLUBG(ilbl,lok)
      elseif(ilbl.EQ.103)then
        call STDWHWBG(ilbl,lok)
      elseif(ilbl.EQ.104)then
        call STDWISBG(ilbl,lok)
      elseif(ilbl.EQ.105)then
        call STDWQQBG(ilbl,lok)
      else
        write(lnhout,1001)
      endif
      if(lok.NE.0) write (lnhout,1005)
      return
 1001 format(/5X,'STDWBGN: begin run record not written')
 1005 format(/5X,'STDWBGN: write error')
      end
