      program stdrepair
C
C  repair output format for events in stdhep 2.x
C  IMPORTANT:  link with stdrd_old.F
C
#include "stdlun.inc"
      integer lok,ifl
      character*80 filin,lptfile,evtin,evtout

C initialize HEP logical units
      lnhwrt=24
      lnhrd=23
      lnhdcy=25
      lnhout=22
C...get file names from command file
      filin = 'stdrepair.cmd'
      open(unit=lnhdcy,file=filin,status='old')
      read(lnhdcy,9500) lptfile
      read(lnhdcy,9500) evtin
      read(lnhdcy,9500) evtout
      close(lnhdcy)

C...open lpt file
      open(unit=lnhout,file=lptfile,status='new')

C...now open the input and output files
      open(unit=lnhrd,file=evtin,status='old',err=100,
     1       form='unformatted')
      open(unit=lnhwrt,file=evtout,status='new',err=100,
     1       form='unformatted')

C... read a record
  10  call heprd(ifl,lok)
      if(lok.ne.0)then
        if(lok.ne.1) write(lnhout,9600) lok
        go to 100
      endif
c... real to double for HEPEVT common block
      if(ifl.eq.1) call stdoldcopy
C... write it out
      call hepwrt(ifl,lok)
      if(lok.ne.0)then
        write(lnhout,9700) lok
        go to 100
      endif
C... keep looping
      go to 10
 100  continue
      close(unit=lnhrd)
      close(lnhout)
c
9500  format(a80)
9600  format(' program exited with flag',i3)
9700  format(' problem writing - error is',i3)
      end

