/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:54:44  mclareni
 * Initial revision
 *
 */
#include "sys/CERNLIB_machine.h"
#include "pilot.h"
/*    SUBROUTINE KWNOCR(CHARST)       */
/*    CHARACTER*(*) CHARST            */
/* write characters to the terminal   */
/*   with no carriage return          */
/* note that with VS Fortran calling  */
/*   conventions the string length    */
/*   is in effect a second argument   */
#include <stdio.h>
void kwnocr_(char charst[],int *number)
{
setbuf(stdout,NULL) ;
fwrite(charst,1,*number,stdout) ;
}
