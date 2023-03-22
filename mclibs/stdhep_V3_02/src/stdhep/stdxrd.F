      subroutine stdxrd(ilbl,istream,lok)

C...Purpose: to read a buffer or an event from the standard common block.
C
C       returns ilbl & lok
C
C                ilbl = 1   - standard HEPEVT common block
C                ilbl = 2   - standard HEPEVT common block and HEPEV2
C                ilbl = 100 - STDHEP begin run record
C                ilbl = 200 - STDHEP end run record
C
C                lok = 0 if no problems were encountered
C

#include "stdcnt.inc"
#include "stdlun.inc"
#include "mcfio.inc"

      integer ilbl,lok,istream
      integer i,numblocks, blkids(50)
      integer xdr_stdhep, xdr_stdhep_multi, xdr_stdhep_cm1
      external xdr_stdhep, xdr_stdhep_multi, xdr_stdhep_cm1

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
c...get the next xdr event
      if(mcfio_NextEvent(istream) .ne. MCFIO_RUNNING)then
        call mcfio_InfoStreamInt(istream,MCFIO_STATUS,istat)
        if(istat .eq. MCFIO_EOF) go to 800
        go to 900
      endif
c...what blocks are in this event?
      call mcfio_InfoEventInt(istream,MCFIO_NUMBLOCKS,numblocks)
      call mcfio_InfoEventInt(istream,MCFIO_BLOCKIDS,blkids)
      do i=1,numblocks
        if(blkids(i).eq.MCFIO_STDHEP)then
c...zero stdhep common 
          call stdzero
c...fill stdhep common 
          if(mcfio_block(istream,MCFIO_STDHEP,xdr_stdhep) .eq. -1)
     1          go to 700
          ilbl = 1
          call stdtcopy(2,lok)
          if(lok.eq.0) nstdrd = nstdrd + 1
        elseif(blkids(i).eq.MCFIO_STDHEPM)then
c...zero stdhep common 
          call stdzero
c...fill stdhep common 
          if(mcfio_block(istream,MCFIO_STDHEPM,xdr_stdhep_multi)
     1         .eq. -1) go to 700
          ilbl = 2
          nstdrd = nstdrd + 1
        elseif(blkids(i).eq.MCFIO_STDHEPBEG)then
c...begin run event - fill stdcm1 common
          if(mcfio_block(istream,MCFIO_STDHEPBEG,xdr_stdhep_cm1)
     1         .eq. -1) go to 700
          ilbl = 100
        elseif(blkids(i).eq.MCFIO_STDHEPEND)then
c...end run event - fill stdcm1 common
          if(mcfio_block(istream,MCFIO_STDHEPEND,xdr_stdhep_cm1)
     1         .eq. -1) go to 700
          ilbl = 200
        endif
      enddo
      return
      
  700 write (lnhout,701)
      lok=1
      return
  800 write (lnhout,801)
      lok=1
      return
  900 write (lnhout,901)
      lok=2
      stop
  701 format(/5X,'STDXRD: unable to read xdr block')
  801 format(/5X,'STDXRD: end of file found')
  901 format(/5X,'STDXRD: unrecognized status - stop')
      end

