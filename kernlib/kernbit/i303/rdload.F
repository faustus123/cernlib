*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:45  mclareni
* Initial revision
*
*
#include "kernbit/pilot.h"
      SUBROUTINE RDLOAD(STRING)
C READ STRING INTO INTERNAL BUFFER OF RDWORD
C********************************************************************
      CHARACTER*(*) STRING
#include "i303cd.inc"
      BUFFER=STRING
      IBPTR=0
      CALL RDNEXT
      RETURN
      END
