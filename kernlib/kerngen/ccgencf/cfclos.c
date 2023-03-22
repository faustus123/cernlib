/*
 * $Id$
 *
 * $Log$
 * Revision 1.3  1999/05/11 16:02:10  mclareni
 * Modifications for RFIO on Windows NT, behind cpp flags for NT and SHIFT.
 * Other platforms should not be affected. They should probably have gone into
 * the shift software.
 *
 * Revision 1.2  1997/02/04 17:35:10  mclareni
 * Merge Winnt and 97a versions
 *
 * Revision 1.1.1.1.2.1  1997/01/21 11:30:09  mclareni
 * All mods for Winnt 96a on winnt branch
 *
 * Revision 1.1.1.1  1996/02/15 17:49:35  mclareni
 * Kernlib
 *
 */
#include "kerngen/pilot.h"
#include "kerngen/fortranc.h"

/*>    ROUTINE CFCLOS
  CERN PROGLIB# Z310    CFCLOS          .VERSION KERNFOR  4.29  910718
  ORIG. 12/01/91, JZ
      CALL CFCLOS (LUNDES,MEDIUM)
      close the file :
       LUNDES  file descriptor
       MEDIUM  = 0,1,2,3 : primary disk/tape, secondary disk/tape
*/
#include "kerngen/cf_clos.h"
#include "kerngen/cf_xaft.h"

#if defined(CERNLIB_PROJSHIFT) && defined(_WIN32)
#include <winsock2.h>
      extern int no_of_opens;
#endif

#if defined(CERNLIB_QX_SC)
void type_of_call cfclos_(lundes, medium)
#endif
#if defined(CERNLIB_QXNO_SC)
void type_of_call cfclos(lundes, medium)
#endif
#if defined(CERNLIB_QXCAPT)
void type_of_call CFCLOS(lundes, medium)
#endif
      int  *lundes, *medium;
{
      int  fildes;

      fildes = *lundes;
      close (fildes);
#if defined(CERNLIB_PROJSHIFT) && defined(_WIN32)
/*    extern int no_of_opens;  */
        if (no_of_opens-- == 0 )WSACleanup();
#endif
      return;
}
/*> END <----------------------------------------------------------*/
#ifdef CERNLIB_TCGEN_CFCLOS
#undef CERNLIB_TCGEN_CFCLOS
#endif
