*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:22:10  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
#if !defined(CERNLIB_INTER)
*CMZ :  3.21/02 29/03/94  15.41.35  by  S.Giani
*-- Author :
      PROGRAM GEXAM2
*
************************************************************************
*                                                                      *
*             Test program for the CDHS set-up                         *
*       Authors    R.Brun, F.Carminati  *********                      *
*                                                                      *
************************************************************************
*
      COMMON/PAWC/H(10000)
      COMMON/GCBANK/Q(80000)
*
*     ------------------------------------------------------------------
*
      CALL TIMEST(1E5)
*
      CALL GZEBRA(80000)
      CALL HLIMIT(-10000)
*
*             Geant initialization.
      CALL UGINIT
*
*             Start events processing.
      CALL GRUN
*
*             End of run.
      CALL UGLAST
      STOP
      END
#endif
