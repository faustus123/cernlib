*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/06 10:46:58  mclareni
* Initial revision
*
*
#define CERNLIB_QFIMDAX
#define CERNLIB_QFIMDANY
#define CERNLIB_MAXMAK24
#include "tefqmain/tfmain.F"
#include "fqtest/fqtest.F"
#undef CERNLIB_ZEBRA_ZSTATE_INC
#undef CERNLIB_ZEBRA_ZUNIT_INC
#undef CERNLIB_ZEBRA_MZBITS_INC
#undef CERNLIB_ZEBRA_QUEST_INC
#undef CERNLIB_ZEBRA_CQBKC_INC
#include "fqtest/fqmake.F"
#undef CERNLIB_ZEBRA_ZSTATE_INC
#undef CERNLIB_ZEBRA_ZUNIT_INC
#undef CERNLIB_ZEBRA_MZBITS_INC
#undef CERNLIB_ZEBRA_QUEST_INC
#undef CERNLIB_ZEBRA_CQBKC_INC
#include "fqtest/fqback.F"
#include "fqtend/zend.F"
#include "tzebend/qnext.F"
#include "tdzdummy/dzdummy.F"
