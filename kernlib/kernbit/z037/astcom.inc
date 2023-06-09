*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:47:51  mclareni
* Initial revision
*
*
#ifndef CERNLIB_KERNBIT_ASTCOM_INC
#define CERNLIB_KERNBIT_ASTCOM_INC
*
*
* astcom.inc
*
*-----------------------------------------------------------------------
*   ASTCOM - Stores various quantities being used for control_C
*            interception on a Vax. (For information, contact
*            Carlo Mekenkamp, MEKENKAM@HLERUL5.)
*-----------------------------------------------------------------------
       IMPLICIT NONE
       COMMON /ASTCOM/ CHAN, ASTIP, ASTCS
       VOLATILE CHAN, ASTIP, ASTCS
       INTEGER*4 CHAN
       LOGICAL*4 ASTIP,ASTCS

#endif
