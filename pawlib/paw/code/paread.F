*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/01 11:38:41  mclareni
* Initial revision
*
*
#include "paw/pilot.h"
*CMZ :  1.05/01 16/12/88  17.11.16  by  Rene Brun
*-- Author :    Rene Brun   03/01/89
      SUBROUTINE PAREAD(LUN,V,N,IERR)
*
*                To read from an unformatted file
*
      DIMENSION V(N)
*________________________________________________________
*
*
      READ(UNIT=LUN,END=10,ERR=20)V
      IERR=0
      RETURN
  10  IERR=1
      RETURN
  20  IERR=-1
      END
