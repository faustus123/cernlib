*
* $Id$
*
* $Log$
* Revision 1.3  1999/06/18 13:31:21  couet
* - qcardl.inc was empty: It is now removed and not used.
*   Comment END CDE removed.
*
* Revision 1.2  1996/04/18 16:13:39  mclareni
* Incorporate changes from J.Zoll for version 3.77
*
* Revision 1.1.1.1  1996/03/06 10:47:14  mclareni
* Zebra
*
*
#include "zebra/pilot.h"
      FUNCTION NZBANK (IXSTOR,LGO)

C-    COUNT NUMBER OF BANKS

#include "zebra/q.inc"
*

#include "zebra/q_jbyt.inc"

#include "zebra/qstore.inc"

      NCOUNT = 0

      L = LGO

   21 IF (L.EQ.0)                  GO TO 29
      L = LQ(KQS+L)
      NCOUNT = NCOUNT + 1
      GO TO 21

   29 NZBANK = NCOUNT
      RETURN
      END
