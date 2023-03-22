*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:53  mclareni
* Initial revision
*
*
#ifndef CERNLIB_FATMEN_FATINIT_INC
#define CERNLIB_FATMEN_FATINIT_INC
*
*
* fatinit.inc
*
      IF(SERNAM(1:4).EQ.'INIT') THEN
         PRINT *,'Error - FATMEN has not been initialised'
         RETURN
      ENDIF

#endif
