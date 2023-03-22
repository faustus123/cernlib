*
* $Id$
*
* $Log$
* Revision 1.1  1996/04/01 15:03:18  mclareni
* Initial revision
*
*
          IDENT OVLATAK
ID        VFD 42/0HOVLATAK,18/1
*
*         SUBROUTINE OVLATAK (LENTRY)  JUMPS TO OVERLAY MAIN PROGRAM AT
      ENTRY OVLATAK
OVLATAK   JP *
          SB1 X1
      SA5 B1
      SB1 X5
      SA1 OVLATAK
      MX6 6
      BX7 -X6*X1
      SA2 VFD
      BX6 X7+X2
      SA6 B1
      SB7 B1+1
      JP B7
*
VFD       VFD 3/0,3/2,54/0
      END
