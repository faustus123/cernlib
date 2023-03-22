*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:38  mclareni
* Initial revision
*
*
      FUNCTION LOCB (IVAR)
C
C CERN PROGLIB# N100    LOCB            .VERSION KERNVAX  2.40  930204
C ORIG. 92/07/13 Miguel Marquina
C
      DIMENSION    IVAR(9)

      LOCB = %LOC(IVAR)
      END
