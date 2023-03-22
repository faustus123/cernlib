*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:17  mclareni
* Initial revision
*
*
#ifndef CERNLIB_CSPACK_SZCHOPT_INC
#define CERNLIB_CSPACK_SZCHOPT_INC
*
*
* szchopt.inc
*
         IL = INDEX(CHMAIL,'/')
         IR = INDEXB(CHMAIL,'/')
         IF((IL.NE.0).AND.(IR.GT.IL)) THEN
            CHOPT = CHMAIL(IL+1:IR-1)
         ELSE
            CHOPT = ' '
         ENDIF
*

#endif
