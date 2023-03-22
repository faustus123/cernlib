/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/08 15:44:27  mclareni
 * Initial revision
 *
 */
#include "cspack/pilot.h"
 
/*
 * Copyright (C) 1988 by Frederic Hemmer
 * All rights reserved
 */
 
/* setacct.c - Set account name     */
 
#include <stdio.h>
 
int
setacct(s)
char *s;
{
 int  rc;
 
 if (rc = ctl$s$t_account(s)) return(rc);
 if (rc = jib$setacct(s)) return(rc);
 return(0);
}
