*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:22:14  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.36  by  S.Giani
*-- Author :
      SUBROUTINE UFILES
*
*            To open FFREAD and HBOOK files
*
      CHARACTER*(*) FILNAM, FSTAT
#if defined(CERNLIB_CRAY)||defined(CERNLIB_UNIX)||defined(CERNLIB_VAX)
      PARAMETER (FILNAM='gexam4.dat')
#endif
#if defined(CERNLIB_IBM)
      PARAMETER (FILNAM='/GEXAM4 DAT *')
#endif
*
#if defined(CERNLIB_CRAY)||defined(CERNLIB_UNIX)
      PARAMETER (FSTAT='OLD')
#endif
#if defined(CERNLIB_VAX)||defined(CERNLIB_IBM)
      PARAMETER (FSTAT='UNKNOWN')
#endif
*
      OPEN(UNIT=4,FILE=FILNAM,STATUS=FSTAT,
#if defined(CERNLIB_VAX)
     +     READONLY,
#endif
     +     FORM='FORMATTED')
*
*             Open a HBOOK direct access file
*
      CALL HROPEN(34,'HBOOK','gexam4.hist','N',1024,ISTAT)
      END
