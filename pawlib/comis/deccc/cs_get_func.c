/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/26 17:16:54  mclareni
 * Initial revision
 *
 */
#include "comis/pilot.h"
#if (defined(CERNLIB_HPUX))&&(defined(CERNLIB_SHL))
/*CMZ :  1.18/00 17/01/94  11.27.21  by  Vladimir Berezhnoi*/
/*-- Author :*/
#include <string.h>
#include <dl.h>
long cs_get_func_(sym,n)
   char *sym;
   int n;
{

   shl_t handle;
   short type;
   long  addr;
   char  func_name[80];

   strncpy(func_name, sym, n);
   func_name[n] = '\0';

   handle = NULL;

   if (shl_findsym(&handle, func_name, TYPE_PROCEDURE, &addr) == 0)
        return(addr);
  else
/*   printf(" CS: function not found: %s\n",func_name); */
   return (0L);
}
#endif
