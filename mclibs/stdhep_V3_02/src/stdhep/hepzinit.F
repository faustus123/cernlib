
      subroutine HEPZINIT
C
C   Initialize HEPZEB (event data Zebra common)
C
      IMPLICIT NONE
#include "stdlun.inc"
#include "hepzbr.inc"

      integer NREF,NDIV
      PARAMETER (NDIV=40000)
      PARAMETER (NREF=9)
C
      integer LISTIN(4)
      logical lfirst

      data  LISTIN / 3, 1,-1, 0 /
C  LISTIN(1) = 3 elements in list
C  LISTIN(2) = default log level 
C  LISTIN(3) = lun for log printing (-1 => IQLOG=IQTYPE)
C  LISTIN(4) = lun for output printing (0 => IQPRNT=IQLOG; -1 => IQPRNT=IQTYPE)
C
      data lfirst/.TRUE./
      save lfirst

C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        lfirst=.FALSE.
      endif
      LISTIN(3)=lnhout
      call MZEBRA(LISTIN)
      call MZVERS
C... Initialize store in /HEPZEB/ common
      call MZSTOR (HPXSTR,'/HEPZEB/',' ',FENCE,LQ(1),LQ(NREF),
     1          LQ(2*NREF),LQ(NDIV),IQ(NNQ))

#if defined(HEPDBG)
      call MZLOGL (HPXSTR,3)
#endif
      call VZERO  (LZSTOR,150)
C... Make divisions
      call MZDIV (HPXSTR,HPXDCY,'DECAY',5000,50000,' ')
      call MZDIV (HPXSTR,HPXEVT, 'EVENT',5000,80000,' ')
C...define links
      call MZLINK(HPXSTR,'/HEPLNK/',LDCY,LE5,LDCY)
      return
      end
