/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:50:03  mclareni
 * Initial revision
 *
 */
#include "kerngen/pilot.h"
#if defined(CERNLIB_QF_F2C)
int iand_(ia,ib)
int *ia, *ib;
  { return *ia & *ib;}
int ior_(ia,ib)
int *ia, *ib;
  { return *ia | *ib;}
int ieor_(ia,ib)
int *ia, *ib;
  { return *ia ^ *ib;}
#endif
