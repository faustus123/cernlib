      subroutine stdxrinit(filename,ntries,istream,lok)
c
c  initialize xdr reading
c
      implicit none
#include "mcfio.inc"
#include "stdlun.inc"
      integer istream,lok,ntries
      character*80 filename

      logical lfirst
      data lfirst/.TRUE./
      save lfirst
c
c      Initialization phase.
c
C...print version number if this is the first call
      if(lfirst)then
        call stdversn
        lfirst=.FALSE.
      endif
      lok = 0
      call mcfio_Init
      call stdxropen(filename,ntries,istream,lok)
      return
      end
