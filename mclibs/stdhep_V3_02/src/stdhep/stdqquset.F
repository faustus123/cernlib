
      subroutine STDQQUSET

C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
C    Initialize QQ stuff
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      IMPLICIT NONE

#include "stdlun.inc"
#include "qqinfo.inc"
#include "qqluns.inc"

      logical LERROR
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

C     Initialize variables 
      call QBINIT

C     Initialize unit numbers
      LTTOQQ = lnhout
      LTTIQQ = 5
      LOUTQQ = lnhout
      call QQGLUN(LTMPQQ)
      call QQGLUN(LTINQQ)
      call QQGLUN(LTOUQQ)

C     Date and time from Driver
#ifdef UNIX
      call DATIMH(DATEQQ, TIMEQQ)
#endif
#ifdef VMS
      call DATE(DATEQQ)
      call TIME(TIMEQQ)
#endif
      write(LTTOQQ,1001) DATEQQ,TIMEQQ
#ifdef UNIX
1001  format(//' QQ date and time: ',A8,2x,A8)
#endif
#ifdef VMS
1001  format(//' QQ date and time: ',A10,2x,A8)
#endif

C     Initialize QQ
      call QQINIT(LERROR)
      if(LERROR) STOP

      return
      end
