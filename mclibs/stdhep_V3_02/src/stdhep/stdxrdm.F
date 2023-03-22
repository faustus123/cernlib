      subroutine stdxrdm(ilbl,istream,lok)

C...Purpose: to read a buffer or an event from the standard common block.
C...         handle multiple input streams
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

#include "stdcnt.inc"
#include "stdlun.inc"
#include "mcfio.inc"

      integer ilbl,lok,istream
      integer i,numblocks, blkids(50)
      integer xdr_stdhep, xdr_stdhep_multi
      external xdr_stdhep, xdr_stdhep_multi

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
c...fill stdhep common 
          if(mcfio_block(istream,MCFIO_STDHEP,xdr_stdhep) .eq. -1)
     1          go to 700
          ilbl = 1
          call stdtcopy(2,lok)
          if(lok.eq.0) nstdrd = nstdrd + 1
        elseif(blkids(i).eq.MCFIO_STDHEPM)then
          write (lnhout,702) 
c...zero stdhep common 
          call stdzero
c...fill stdhep common 
          if(mcfio_block(istream,MCFIO_STDHEPM,xdr_stdhep_multi)
     1         .eq. -1) go to 700
          ilbl = 2
          nstdrd = nstdrd + 1
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
  701 format(/5X,'STDXRDM: unable to read stdhep event')
  702 format(/5X,'STDXRDM: multiple interaction event',
     1            ' - HEPEVT is zeroed')
  801 format(/5X,'STDXRDM: end of file found')
  901 format(/5X,'STDXRDM: unrecognized status - stop')
      end
