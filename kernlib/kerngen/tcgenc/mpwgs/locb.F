*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:50:39  mclareni
* Initial revision
*
*
      FUNCTION LOCB (AM)
C
C CERN PROGLIB# N101    LOCB            .VERSION KERNMPW  1.00  891208
C ORIG. 13/12/83  F.Carminati
C
      DIMENSION AM(*)
 
      LOCB= %LOC (AM(1))
      END
