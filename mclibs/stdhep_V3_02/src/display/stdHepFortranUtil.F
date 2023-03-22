c
c        stdHepFortranUtil.F : 
c                Bunch of small utility functions to communicate with the 
c                Fortran StdHep library.
c                The assumption is that only 1 file is open at a time.
c
        subroutine opennatstdhep(file, ierr)
        character *(*) file
#include "stdlun.inc" 
#include "stdheputil.inc"
        file_type = 0        
        lnhrd = 23 
        open(unit=lnhrd, file = file, status = 'old',
     &        form = 'unformatted', err = 100)
        ierr = 0
        return
 100    continue
c
c        Got to do somthing better here.. 
c
        ierr = 1
         return
         end           

        subroutine openzebstdhep(file, lrec, ierr)
        character *(*) file
#include "stdlun.inc" 
#include "stdheputil.inc"
        COMMON /QUEST/ IQUEST(100)
        
        file_type = 1
        lnhrd = 23 
        ierr = 0
        if (init_zebra .ne. 43) call hepzinit
        init_zebra = 43
        if (zeb_file_pointer .eq. 0) then
              call cfopen(iquest(1), 0, lrec, 'r', 0, file, istat)
              zeb_file_pointer = iquest(1)
              call fzfile(LNHRD,lrec,'XLI')
        else 
             iquest(1) = zeb_file_pointer
        end if 
        return
 100         continue
        ierr = 1
         return
         end 

        subroutine closestdhep
#include "stdlun.inc" 
#include "stdheputil.inc"
        COMMON /QUEST/ IQUEST(100)
        if (file_type .eq. 1) then
          call fzendi(LNHRD,'I')
        elseif (file_type .eq. 2) then
          write(lnhout,*) ' ERROR - should not be in calling stdxend '
        else
           close(lnhrd)
         end if
         return
         end 
c
c        These are dummy routine to avoid linking the entire GEANT package.
c
c
        subroutine gsvert(vert, ntbeam, ntt, ub, nu, nv)
        dimension vert(*)
        return
        end
        subroutine gskine(vert, ntbeam, ntt, ub, nu, nv)
        dimension vert(*)
        return
        end
        
        
