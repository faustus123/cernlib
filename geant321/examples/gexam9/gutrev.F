*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:22:23  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.36  by  S.Giani
*-- Author :
      SUBROUTINE GUTREV
*
************************************************************************
*                                                                      *
*             GEANT3 user routine to control tracking of one event     *
*                                                                      *
*             Called by GRUN                                           *
*                                                                      *
************************************************************************
*
#include "geant321/gcflag.inc"
*
      CALL GTREVE
*
*             Debug and plot tracks.
      IF(IDEBUG.EQ.1) THEN
         IF(ISWIT(2).EQ.1) CALL GPRINT('JXYZ', 0)
      ENDIF
*
      END
