/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/08 15:33:07  mclareni
 * Initial revision
 *
 */
/*CMZ :  2.05/09 19/05/94  17.38.52  by  N.Cremel*/
/*-- Author :    N.Cremel   27/10/92*/

#include "kuip/kuip.h"
#include "kuip/mkutfu.h"


/***********************************************************************
 *                                                                     *
 *   This routine is called by the Kuip Browser for Macros.            *
 *                                                                     *
 ***********************************************************************/
char **kmbmac( brobj_name, brcls_name, bpath, n )
     char *brobj_name;
     char *brcls_name;
     char *bpath;
     int n;
{
  char       **fdesc;
  static char *expath;
  static int init = 0;

  if (!init) {
      km_file_type( ".kumac", "MacFile", "(Kuip Macro)", 1 );
      init = 1;
  }

  if (n == 0)
     expath = fexpand(bpath, NULL);

  if (!(fdesc = km_scan_dir( expath, "*.kumac", n, 1 )))
     free(expath);

  return fdesc;
}


