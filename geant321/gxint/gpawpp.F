*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:21:48  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.33  by  S.Giani
*-- Author :
      SUBROUTINE GPAWPP(NWGEAN,NWPAW)
*
      EXTERNAL      PAEXIT,UGLAST
      CHARACTER*80  BATCHF,PAWLOGF
#include "geant321/gcflag.inc"
#include "geant321/gctime.inc"
#include "geant321/gcomis.inc"
#include "geant321/gcxlun.inc"
#include "geant321/gcunit.inc"
*
      CALL TIMEST(1.E6)
*
      PRINT *,' *************************************************** '
      PRINT *,' *                                                 * '
      PRINT *,' *               G E A N T   3 . 2 1               * '
      PRINT *,' *                                                 * '
      PRINT *,' *                    C E R N                      * '
      PRINT *,' *                                                 * '
      PRINT *,' *               15/3/94  Geneva  CH               * '
      PRINT *,' *                                                 * '
      PRINT *,' *************************************************** '
*
      CALL PAWINT1('GEANT',BATCHF,PAWLOGF)
*
      CALL GZEBRA(NWGEAN)
*
      CALL PAWINT2(-NWPAW,'+?',UGLAST,IWTYP)
*
      CALL GINTRI
*
      IF(IWTYP.EQ.999)THEN
         CALL PMINIT
         CALL GBROWS
         CALL KUINIM('Geant++')
      ENDIF
*
      CALL PAWINT3
*
      IF(IWTYP.EQ.999)THEN
         CALL KUEXEC('OPTION ZFL1')
#if defined(CERNLIB_IBMRT)
         CALL KUEXEC('HOST_EDITOR ''aixterm -e vi &''')
#endif
#if (!defined(CERNLIB_IBMRT))&&(!defined(CERNLIB_VAX))
         CALL KUEXEC('HOST_EDITOR ''xterm -e vi &''')
#endif
      ENDIF
#if defined(CERNLIB_COMIS)
*
* *** Initialise COMIS
      DO 10 J=1,6
         JPCOMS(J)=0
   10 CONTINUE
      CALL GXCS
#endif
*
#if defined(CERNLIB_MONITOR)
      CALL GEAMON(0,' ')
#endif
      CALL UGINIT
      CALL GDINIT
      IEVENT=0
      CALL TIMEL(TIMINT)
      CALL KUEXEC('ROOT /GEANT')
*
      IF(IWTYP.EQ.999)THEN
         CALL KUEXEC('SET/PROMPT ''geant++ >''')
      ELSE
         CALL KUEXEC('SET/PROMPT ''GEANT >''')
      ENDIF
*
      CALL PAWINT4(PAWLOGF)
*
      IF(IWTYP.EQ.999)THEN
         CALL KUWHAM('Geant++')
      ELSE
         CALL KUWHAG
      ENDIF
*
      CALL PAEXIT
*
#if defined(CERNLIB_MONITOR)
      CALL GEAMON(2,'GXINT')
#endif
      WRITE(CHMAIL,'('' Exiting from GEANT.'')')
      CALL GMAIL(0,0)
*
      END
 
 
