#ifndef _KUIP_H
#define _KUIP_H
#include <cfortran/cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif
PROTOCCALLSFSUB3(KUCLOS,kuclos,INT,STRING,INT)
#define KUCLOS(A1,A2,A3)    CCALLSFSUB3(KUCLOS,kuclos,INT,STRING,INT,A1,A2,A3)

PROTOCCALLSFSUB4(KUOPEN,kuopen,INT,STRING,STRING,PINT)
#define KUOPEN(A1,A2,A3,A4) CCALLSFSUB4(KUOPEN,kuopen,INT,STRING,STRING,PINT,A1,A2,A3,A4)

PROTOCCALLSFSUB0(KUWHAG,kuwhag)
#define KUWHAG() CCALLSFSUB0(KUWHAG,kuwhag)
#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* #ifndef _KUIP_H */
