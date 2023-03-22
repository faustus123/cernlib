      subroutine stdversn
C
C...print STDHEP version number
C
#include "stdver.inc"
#include "stdlun.inc"
      logical lfirst
      data lfirst/.TRUE./
      save lfirst

      if(lfirst)then
        lfirst = .FALSE.
        stdhep_ver  = '3.01'
        stdhep_date = 'October 9, 1995'
        write(lnhout,1001) stdhep_ver,stdhep_date
      endif
1001  format(//
     1 10X,'********************************************************'/
     2 10X,'*       STDHEP version ',a5,' -  ',a20,'   *'/
     3 10X,'********************************************************'//)
      return
      end
