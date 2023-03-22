*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:22:19  cernlib
* Initial revision
*
*
*   (BOOT DATA)
*
* bootdt.inc
*
      COMMON/BOOTDT/MEDIUM,ECUT,RANGE,LTYPE(2,10)
C----------------------------------------------------------------------
C     BOOTSTRAP COMMON : MEDIUM = VOLUME IN WHICH BOOTSTRAP IS DONE
C                        ECUT   = BELOW ECUT TIMES PRIMARY  ENERGY
C                                 BOOTSTRAP REPLACES TRACKING
C                        RANGE  = DEVIATION FROM GENERATED EN-
C                                 ERGY VALUES
C                        LTYPE1 = TYPE OF PARTICLE
C                        LTYPE2 = ASSOCIATED LUN CONTAINING PRESHOWERS
C----------------------------------------------------------------------
