*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/07 15:17:50  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_fatmen/pilot.h"
select count(vsn) from fatmen.volumes_&1 where vsn like 'I%';
