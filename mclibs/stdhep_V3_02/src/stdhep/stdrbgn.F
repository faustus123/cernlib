
      subroutine STDRBGN(ilbl,NB,lok)

C...Purpose: to read begin run information in a standard format
C
C        if ilbl = 100   read STDHEP begin run record
C          ilbl = 101        read PYTHIA begin run record
C          ilbl = 102        read JETSET begin run record
C          ilbl = 103        read HERWIG begin run record
C          ilbl = 104        read ISAJET begin run record
C          ilbl = 105        read QQ begin run record
C
C       NB = buffer size
C
C        lok = 0 if no problems were encountered

#include "stdlun.inc"

      integer ilbl,lok,NB

      lok=0
      if(ilbl.EQ.100)then
        call STDRSTBG(NB,lok)
      elseif(ilbl.EQ.101)then
        call STDRPYBG(NB,lok)
      elseif(ilbl.EQ.102)then
        call STDRLUBG(NB,lok)
      elseif(ilbl.EQ.103)then
        call STDRHWBG(NB,lok)
      elseif(ilbl.EQ.104)then
        call STDRISBG(NB,lok)
      elseif(ilbl.EQ.105)then
        call STDRQQBG(NB,lok)
      else
        write(lnhout,1001)
      endif
      if(lok.NE.0) write (lnhout,1005)
      return
 1001 format(/5X,'STDRBGN: unrecognized begin run record')
 1005 format(/5X,'STDRBGN: read error')
      end
