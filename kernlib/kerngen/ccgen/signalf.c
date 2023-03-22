/*
 * $Id$
 *
 * $Log$
 * Revision 1.3  1999/10/06 14:17:01  mclareni
 * On AIX 4.3 we have to use the Posix version of signalf to get it to compile
 *
 * Revision 1.2  1997/02/04 17:34:41  mclareni
 * Merge Winnt and 97a versions
 *
 * Revision 1.1.1.1.2.1  1997/01/21 11:29:41  mclareni
 * All mods for Winnt 96a on winnt branch
 *
 * Revision 1.1.1.1  1996/02/15 17:49:26  mclareni
 * Kernlib
 *
 */
#include "kerngen/pilot.h"
#include "kerngen/fortranc.h"

#if defined(CERNLIB_QMSGI)
#include "sgigs/signalf.c"
#elif defined(CERNLIB_QMOS9)
#include "os9gs/signalf.c"
#elif defined(CERNLIB_QSIGBSD)
#include "sigbsd.c"
#elif defined(CERNLIB_QSIGPOSIX)
#include "sigposix.c"
#elif defined(CERNLIB_QMIRT)||defined(CERNLIB_QMIRTD)
#include "irtgs/signalf.c"
#else
/*>    ROUTINE SIGNALF
  CERN PROGLIB#         SIGNALF         .VERSION KERNFOR  4.38  931108
  ORIG. 12/03/91, JZ
  FORTRAN interface routine to signal

      INTEGER FUNCTION SIGNALF (NUMSIG,PROC,IFLAG)

C-        NUMSIG :  signal number
C-          PROC :  external of the handler, if IFLAG = -1
C-         IFLAG :  < 0  instal PROC
C-                  = 0  default action
C-                  = 1  ignore signal
C-                  > 1  adr of handler as returned earlier
C-        function value = adr of previous handler
*/
#include <signal.h>
typedef void (*sighandler_t)(int);
#if defined(CERNLIB_QX_SC)
int type_of_call signalf_(signum,funct,flag)
#endif
#if defined(CERNLIB_QXNO_SC)
int type_of_call signalf(signum,funct,flag)
#endif
#if defined(CERNLIB_QXCAPT)
int type_of_call SIGNALF(signum,funct,flag)
#endif
      int  *signum, *flag;
      int  *funct;
{
      int  signo, istat;
      sighandler_t handler;
      void *oldhand;

      signo = *signum;

#if defined(CERNLIB_QCCINDAD)
      if (*flag < 0)          handler = *funct;
#endif
#if !defined(CERNLIB_QCCINDAD)
      if (*flag < 0)          handler = (sighandler_t)funct;
#endif
        else if (*flag == 0)  handler = (sighandler_t)SIG_DFL;
        else if (*flag == 1)  handler = (sighandler_t)SIG_IGN;
        else                  handler = (sighandler_t)(long)*flag;

      oldhand = signal(signo,handler);
      unsigned long myistat = (unsigned long)oldhand;
      istat   = (int)myistat;
#ifndef __GNUC__
      if (oldhand == SIG_ERR)  istat = -1;
#endif
      return istat;
}
/*> END <----------------------------------------------------------*/
#endif
