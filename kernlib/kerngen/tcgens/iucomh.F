*
* $Id$
*
* $Log$
* Revision 1.3  2006/09/15 09:35:21  mclareni
* Submitted mods for gcc4/gfortran and MacOSX, corrected to work also on slc4 with gcc3.4 and 4.1
*
* Revision 1.2  1997/02/04 17:36:24  mclareni
* Merge Winnt and 97a versions
*
* Revision 1.1.1.1.2.1  1997/01/21 11:31:39  mclareni
* All mods for Winnt 96a on winnt branch
*
* Revision 1.1.1.1  1996/02/15 17:50:19  mclareni
* Kernlib
*
*
#include "kerngen/pilot.h"
#if defined(CERNLIB_WINNT)
#include "wntgs/iucomh.F"
#elif defined(CERNLIB_QMDOS)
#include "dosgs/iucomh.F"
#elif defined(CERNLIB_QMVAOS)||defined(CERNLIB_QMVMI)
#include "allgs/iucomh.F"
#elif defined(CERNLIB_QMLNX) && (!defined(CERNLIB_GFORTRAN))
#include "lnxgs/iucomh.F"
#elif defined(CERNLIB_QMVAX)
#include "vaxgs/iucomh.F"
#elif defined(CERNLIB_GFORTRAN)
#include "allgs/iucomh.F"
#endif
