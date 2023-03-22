*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/28 16:24:31  mclareni
* Initial revision
*
*
#include "hepdb/pilot.h"
      FUNCTION ICDTYP (L)
*     ===================
*
************************************************************************
*                                                                      *
*        FUNC. ICDTYP (L)                                              *
*                                                                      *
*   Gets the bank I/O type from the address of L                       *
*                                                                      *
*   Arguments :                                                        *
*                                                                      *
*     L        Address of the bank                                     *
*                                                                      *
*   Called by various routines in the HEPDB package                    *
*                                                                      *
*   ICDTYP = I/O descriptor (see MZBOOK/MZFORM)                        *
*            < 7 = simple bank                                         *
*            > 7 = self describing                                     *
************************************************************************
*
#include "hepdb/cdcblk.inc"
#include "zebra/q_jbit.inc"
* Ignoring t=pass
*
*     ------------------------------------------------------------------
*
      LST = L - IQ(KOFUCD+L-3) - JBYT(IQ(KOFUCD+L),19,4) - 1
      ICDTYP = JBYT (LQ(KOFUCD+LST), 17, 16)
*                                                             END ICDTYP
      END
