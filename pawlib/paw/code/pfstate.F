*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/01 11:38:45  mclareni
* Initial revision
*
*
#include "paw/pilot.h"
*CMZ :  2.04/07 29/11/93  16.01.15  by  Fons Rademakers
*-- Author :    Fons Rademakers   29/11/93
      SUBROUTINE PFSTATE
************************************************************************
*                                                                      *
* Send the PAW state to the just started PIAF server.                  *
* Currently the state includes:                                        *
*      - the HCOPT words                                               *
*                                                                      *
* Later it should also contain the currently defined cuts, etc.        *
*                                                                      *
************************************************************************
*
      CALL HOPTPF
*
      END
