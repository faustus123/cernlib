*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:16  mclareni
* Initial revision
*
*
#ifndef CERNLIB_CSPACK_CZFOLD_INC
#define CERNLIB_CSPACK_CZFOLD_INC
*
*
* czfold.inc
*
      IF(INDEX(CHOPT,'C').EQ.0) THEN
         CALL CLTOU(LOCAL)
         CALL CLTOU(REMOTE)
      ENDIF

#endif
