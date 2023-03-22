/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/02/15 17:47:53  mclareni
 * Initial revision
 *
 */
#include "kernbit/pilot.h"
#if !defined(CERNLIB_QXNO_SC)
/*>    ROUTINE UNALIGN
  CERN PROGLIB# T002    UNALIGN         .VERSION KERNBIT  1.08  920316
  ORIG. 91/xx/xx Lee Roberts-SSC

  Interface to allow_unaligned_data_access when using option +ppu

  HP has chosen NOT to allow unaligned accesses by default. This
  routine is needed by tests who do like KERNNUMT.

*/
void allow_unaligned_data_access_()
{
     allow_unaligned_data_access();
}
#endif
