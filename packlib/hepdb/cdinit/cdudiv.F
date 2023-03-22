*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:14  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      SUBROUTINE CDUDIV(IXSTR,IUDIV,CHNAME,NWINI,NWMAX)
*     ------------------------=====--------------------
*
***************************************************************
*     Booking HEPDB divisions into an indicated store         *
*                                                             *
*     Called by CDPAW or from User's program                  *
*                                                             *
* Arguments:                                                  *
*            IXSTR   -any division index from the requested   *
*                     store    or ISHFT(nstore,26)            *
*            IUDIV   -returned index of the User Division     *
*            CHNAME  -name of the User Division               *
*            NWINI   -initial size of the User Division       *
*            NWMAX   -maximal size of the User Division       *
*                                                             *
*                                     Author: Boris Khomenko  *
***************************************************************
 
      CHARACTER*(*) CHNAME
*
      CALL MZDIV(IXSTR,IUDIV,CHNAME,NWINI,NWMAX,'LCM')
*
      CALL CDFRST(IUDIV)
*
      END
