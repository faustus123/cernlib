
      subroutine STDSTDSCLST(IP,NDAU,LSIZE,LDTR)

C...Search the HEPEVT common block for all the stable descendants of IP
C
C     IP = index to HEPEVT common block
C     NDAU = number of stable descendants found
C     LDTR(LSIZE) = list of stable descendants of IP

#include "stdhep.inc"
#include "stdlun.inc"

      integer IP,NDAU,LSIZE,LS2,ND2,NL,I
      integer LDTR(LSIZE)
      PARAMETER (LS2 = 2000)
      integer LD2(LS2)

      NDAU = 0
C... first find all the descendants
      call STDDSCNDLST(IP,ND2,LS2,LD2)
      if(ND2.GT.0)then
c... now decide if they are stable
        NL = MIN(LS2,ND2)
        do I=1,NL
          if(ISTHEP(LD2(I)).EQ.1)then
            NDAU = NDAU + 1
            if(NDAU.LE.LSIZE) LDTR(NDAU) = LD2(I)
          endif
        enddo
      endif
      if(NDAU.GT.LSIZE) write(lnhout,1001) NDAU,LSIZE
      return
1001  format(' STDSTDSCLST: found ',I4,
     1        ' descendants, but the list only allows ',I4)
      end
