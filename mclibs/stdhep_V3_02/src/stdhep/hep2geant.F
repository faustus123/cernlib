
      subroutine HEP2GEANT
************************************************************************
*     
*     Put all undecayed STDHEP particles in GEANT KINE stack.
*
*     The first user word in the KINE structure is
*     the STDHEP record number for the particle.
*     This permits a GEANT/HEP cross reference.
*
*     Remember STDHEP vertices are in mm's
*     and GEANT vertices are in cm's.
*
*     Particles unknown to GEANT are entered as geantino's.
*     A warning message is also printed.
*
*     Doug Wright, LLNL   Nov 1993
*     wright20@llnl.gov
*
*     July 94  D.Wright, NWHINE added, GEANTINO fixed
*     Oct. 95  L.Garren, move particle id translation to gtran
*
************************************************************************

      implicit none


#include "stdhep.inc"
#include "stdlun.inc"

      real    xyz(3)
      integer i,j,IDGEANT,Nvertex, Ntrack, IHEP
      integer gtran

      do i=1, NHEP
         if( ISTHEP(I) .eq. 1 ) then ! particle hasn't decayed
            IHEP = IDHEP(I)
            IDGEANT = gtran(IHEP,2)
            do j=1,3
               xyz(J)=VHEP(J,I)/10.
            enddo
            call GSVERT(xyz,0,0,0,0,Nvertex)
            call GSKINE(PHEP(1,I),IDGEANT,Nvertex,float(i),1,Ntrack)
         endif
      enddo
      return
      end
