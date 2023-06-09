*CMZ :          08/23/94  15.20.00  by  John Apostolakis CERN GP-MIMD 2
*-- Author :
      subroutine GPSUMHR( idh, file, chopt )
c
c     Saves histograms into a single RZ file, putting each
c     process' histogram into a subdirectory, as well as saving the
c     running total in the subdirectory 'totals'. At the end the
c     directory 'totals' will contain the sum total of all
c     contributions from all processes.
c
c       ( A 'replacement' for hrput for parallel Geant.)
c
c.    Implementation notes:
c.
c.          Currently chopt is ignored!
c.
c-------------------------------------------------------------------------
#if defined(CERNLIB_PARA)
      IMPLICIT NONE
      INTEGER       idh
      CHARACTER*(*) file, chopt

      INTEGER myid
      character*13  myname
#include "geant321/mpifinc.inc"
#include "geant321/multiprox.inc"
C
      INTEGER istat, icycle, lunhist
C
      integer       iquest(100), nrec, itag
      integer       npstat(MPI_STATUS_SIZE), ierr
      integer       idebgsvh, npnext, nfirst, indivout
      character*1   filemode
      common /quest/  iquest
      data    nrec / 1024 /
      data    itag / 1001 /
      data    idebgsvh / 1 /
      data    indivout / 1 /
      data    lunhist / 29 /
      parameter (nfirst=0)
c----------------------------------------------------------------------
c J. Apostolakis: Use a directory for each process and a
c                     a directory called 'totals' for totals,
c                 v0.1 February 9, 1994   using mvlock/mvunlock
c                 v0.2 August   4, 1994   using mpi_{send,recv}
c
c     Node 0 creates the file, others wait their turn (a message goes
c       around that each node receives, does its stuff and sends on)
c       [ Older idea was to use a barrier: call mpi_barrier( MPI_COMM_WORLD ) ]
c
c     Notes:
c     x     The current scheme is not robust, but has worked well.
c     x   The potential problem is if one node fails before getting to
c     x   this point or during its call to gpsumhr. The former could be
c     x   handled by replacing the current method with a robust scheme
c     x   capable of handling node failures, by using lockf/unlockf to
c     x   lock the file ...
c     x
c     x   For file creation, having all nodes try to create a new hbook
c     x   file will not work, since one will overwrite another ...
c        
      if( nprank .eq. nfirst )  then
          filemode= 'N'
          nrec= 1024
      else
          filemode= 'U'
          nrec= 0
c
c         Wait here until the previous node is finished !
c
          call mpi_recv( istat, 1, MPI_INTEGER,
     &                   nprank-1, itag, MPI_COMM_WORLD, npstat, ierr )
      endif

      CALL HROPEN ( LUNHIST, 'OUTPUT', file, filemode, nrec, istat)

      if(istat.ne.0) then
          print *, ' HROPEN of ', file, ' on node ', nprank,
     &             ' failed in gpsumhr. Istat = ', istat
      else
          print *, ' HROPEN of ', file, ' on node ', nprank,
     &             ' succeeded and gave nrec=', nrec
      endif

      myid = nprank
      if( myid.ge.10000 ) then
          print *, 'Warning in gpsumhr: The id (',myid,
     &            ')is too big to be used in gpsumhr.f'
          myid = mod(myid, 10000)
      endif
      write (myname, '(a7,i6)')  'process',myid+10000
      myname(8:8)='0'

      if( idebgsvh .eq. 1 ) then
          call hldir  ( '//PAWC', ' ' )
          call hldir  ( '//OUTPUT', 't' )
      endif

      call hcdir  ( '//OUTPUT', ' ' )

c     Could make 'indivout' an option: it creates subdirectories with
c     each node's output.
      if( indivout .eq. 1 ) then
          call hmdir  ( myname, ' ' )
          call hcdir  ( myname, ' ' )   !  if it has been created already ...
          CALL HROUT  ( idh, icycle,' ')
      endif

      if( nprank .eq. nfirst ) then
          call hmdir  ( '//OUTPUT/TOTALS','S')
      else
          call hcdir  ( '//OUTPUT/TOTALS',' ')
          CALL HRIN   ( idh, 888888, 99999)
      endif
c                                ! 99999 is an undocumented feature => it adds
c                                        the histograms to the ones in memory
c     ------------------------------------------------------------------
      call hrout  ( idh, icycle, 'T')

      CALL HREND  ('OUTPUT')
      close( LUNHIST )
c
c     Send a message to the next node, which is waiting until this one
c      is finished !
c
      npnext = nprank+1
      if ( npnext .ge. npsize ) npnext = npnext - npsize
      call mpi_send( istat, 1, MPI_INTEGER,
     &               npnext,   itag, MPI_COMM_WORLD, ierr  )

c
c     Finally have the first node receive the last node's message!
c
      if( nprank .eq. nfirst ) then
          call mpi_recv( istat, 1, MPI_INTEGER,
     &                   npsize-1, itag, MPI_COMM_WORLD, npstat, ierr  )
      endif
c-----------------------------------------------------------------------

      RETURN
#endif
      END
