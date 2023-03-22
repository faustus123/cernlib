*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/01 11:39:05  mclareni
* Initial revision
*
*
#include "paw/pilot.h"
*CMZ :  2.02/03 27/05/93  13.45.59  by  Fons Rademakers
*-- Author :    Fons Rademakers   03/05/93
      SUBROUTINE NTWINI
*
*  Interface routine to the ntwork_init routine
*
#include "paw/pcntwk.inc"
*
      CALL NTWORK_INIT(NPASS, IPASS, IMINEV, IMAXEV, MISBYT, NCHAIN,
     +                 CRHOST, LENOCC(CRHOST))
*
      END
