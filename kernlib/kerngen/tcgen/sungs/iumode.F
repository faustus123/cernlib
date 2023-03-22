*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:49:57  mclareni
* Initial revision
*
*
      FUNCTION IUMODE (IWORD)
C
C CERN PROGLIB# M506    IUMODE          .VERSION KERNSUN  1.00  880922
C ORIG. 22/09/88, JZ
C
C
      J = RSHIFT (IWORD,23)
      IF (J.EQ.-1)  J=0
C
      IUMODE= J
      RETURN
      END
