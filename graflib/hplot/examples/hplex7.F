*
* $Id$
*
* $Log$
* Revision 1.1  1996/01/19 10:50:11  mclareni
* Initial revision
*
*
#include "hplot/pilot.h"
*CMZ :  5.13/00 01/07/92  16.13.04  by  O.Couet
*-- Author :
      SUBROUTINE HPLEX7
*.==========>
*.           Examples of HPLOT playing back HIGZ files
*..=========>
      CHARACTER*10 STR
      DATA ICYCLE/999/
*
      CALL RZLDIR(' ',' ')
      CALL IGSET('AURZ',0.)
      CALL IZIN('PICT1',ICYCLE)
      CALL IZPICT('PICT1','D')
      CALL IRQST(1,1,ISTAT,NCH,STR)
      CALL IZIN('PICT8',ICYCLE)
      CALL IZPICT('PICT8','D')
      CALL IRQST(1,1,ISTAT,NCH,STR)
      CALL IZIN('PICT9',ICYCLE)
      CALL IZPICT('PICT9','D')
      CALL IRQST(1,1,ISTAT,NCH,STR)
*
      END
