*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:21:43  mclareni
* Initial revision
*
*
#include "pilot.h"
      SUBROUTINE ERREX(N)
C--- ALL ERROR EXITS
#include "testc.inc"
      PRINT 3001,N,NREC,IERR,NH,NPASS,ILWORD,ISPAN,IPAD,
     1 JREC,JWORD,ICALL
      STOP
#if !defined(CERNLIB_CDC)
3001  FORMAT(/,' + + + + + ERROR CONDITION + + + + +',//,
     1'          N      NREC      IERR        NH     NPASS',
     2'    ILWORD     ISPAN      IPAD      JREC     JWORD',/,
     3 1X,10I10,//,
     4'    ICALL',/,
     5 1X,10I10)
#endif
#if defined(CERNLIB_CDC)
3001  FORMAT(/," + + + + + ERROR CONDITION + + + + +",//,
     1"          N      NREC      IERR        NH     NPASS",
     2"    ILWORD     ISPAN      IPAD      JREC     JWORD",/,
     3 1X,10I10,//,
     4"    ICALL",/,
     5 1X,10I10)
#endif
      END
