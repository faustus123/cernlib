      subroutine PDGPRTB(ITYP,LUN)
C
C   print mass and width table from appropriate common block
C   actions:
C        ITYP = 1        print table to LUN in STD format
C        ITYP = 2        print table to LUN in PDG format
C
#include "pdgtbl.inc"
#include "stdtbl.inc"
#include "stdlun.inc"
C
      integer LUN,ITYP,I
C
      if(ITYP.EQ.1)then
        write(LUN,104)
        do I=1,NMXLN
          if(IDT(I).NE.0) write(LUN,103) IDT(I),STNAME(I),STMASS(I),
     1     STMERR(1,I),STMERR(2,I),STWIDTH(I),STWERR(1,I),STWERR(2,I)
        enddo
      elseif(ITYP.EQ.2)then
        write(LUN,105)
        do I=1,NMXLN2
          if(IDPDG(I).NE.0) write(LUN,103) IDPDG(I),PDNAME(I),
     1       PDMASS(I),PDMERR(1,I),PDMERR(2,I),
     2       PDWIDTH(I),PDWERR(1,I),PDWERR(2,I)
        enddo
      else
        write(lnhout,*) ' PDGPRTB: Illegal table type, use 1 or 2 '
      endif
      return
 103  format(1X, I6, 1X, A21, 1X, E25.16, 1X, 2E9.1, 1X,
     1          E25.16, 1X, 2E9.1)
 104  format(//20X,'Table of particles from PDG in STDHEP format'//
     1     2X,'IDHEP',2X,'NAME',23X,'MASS',
     2     20X,'MASS ERROR',9X,'WIDTH',21X,'WIDTH ERROR')
 105  format(//20X,'Table of particles from PDG in PDG format'//
     1     2X,'IDPDG',2X,'NAME',9X,'CHARGES',7X,'MASS',
     2     20X,'MASS ERROR',9X,'WIDTH',21X,'WIDTH ERROR')
      end
