*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:32:54  mclareni
* Initial revision
*
*
#include "kuip/pilot.h"
#if defined(CERNLIB_IBMALL)
*CMZ :  2.02/05 18/05/93  15.20.33  by  Alfred Nathaniel
*-- Author :    Alfred Nathaniel   18/05/93
      SUBROUTINE KUSERID(CHUSER)
      CHARACTER*(*) CHUSER
*
* return the user account name
*
#if defined(CERNLIB_IBMVM)
      CHARACTER USERID*8
      CHUSER=USERID()
#endif
#if !defined(CERNLIB_IBMVM)
      CHUSER='unknown'
#endif
      END
#endif
