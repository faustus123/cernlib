/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:49:39  mclareni
 * Initial revision
 *
 */
/*>    ROUTINE CIOPEI
  CERN PROGLIB# Z311    CIOPEI          .VERSION KERNOS9  1.01  940801
  ORIG. 12/10/91, JZ
      CALL CIOPEN (LUNDES, MODE, TEXT, ISTAT)
      open a file :
      *LUNDES  file descriptor
       MODE    string selecting IO mode
               = 'r ', 'w ', 'a ', 'r+ ', ...
       TEXT    name of the file
      *ISTAT   status, =zero if success
*/
#include "kerngen/cf#open.h"
#include <modes.h>
#include <errno.h>
#include "kerngen/cf#xaft.h"
#include "kerngen/fortchar.h"
      int ciopen_perm = 0;

void ciopei_(lundes,mode,ftext,stat,lgtx)
      char *ftext;
      int  *lundes, *stat, *lgtx;
      int  *mode;
{
      char *pttext, *fchtak();
      int  flags;
      int  fildes;
      int  perm;

      *lundes = 0;
      *stat   = -1;

      perm = ciopen_perm;
      ciopen_perm = 0;

/*        construct flags :
            mode[0] =    0 r    1 w    2 a
            mode[1] =    1 +
*/
/*        flags for disk     */


      if (mode[0] == 0)
      {
          if (mode[1] == 0)
              flags = FAM_READ;
          else
              flags = FAM_READ | FAM_WRITE;

      } else if (mode[0] == 1) {

          if (mode[1] == 0)
              flags = FAM_WRITE;
          else
              flags = FAM_WRITE | FAM_READ;

      } else if (mode[0] == 2) {

          if (mode[1] == 0)
              flags = FAM_WRITE | FAM_APPEND;
          else
              flags = FAM_WRITE | FAM_READ | FAM_APPEND;
      }


/*        open the file      */

      pttext = fchtak(ftext,*lgtx);
      if (pttext == 0)             return;

      if (perm == 0)   perm = FAP_READ | FAP_WRITE | FAP_PREAD;

      if (mode[0] == 1) {
              if ( (fildes = create (pttext, flags, perm)) < 0 )
                  fildes = creat (pttext, flags);
      } else {
          fildes = open (pttext, flags);
          if ((mode[0] == 2) &
              (fildes < 0) ) fildes = create (pttext, flags, perm);
      }


      if (fildes < 0)              goto errm;
      *lundes = fildes;
      *stat   = 0;
      goto done;

errm: *stat = errno;
/*    perror (" error in CIOPEN");  */

done: free(pttext);
      return;
}
/*> END <----------------------------------------------------------*/
