#ifndef _PAW_H
#define _PAW_H
#include <cfortran/cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif
PROTOCCALLSFSUB2(PAW,paw,INT,INT)
#define PAW(A1,A2)  CCALLSFSUB2(PAW,paw,INT,INT,A1,A2)

PROTOCCALLSFSUB0(PAEXIT,paexit)
#define PAEXIT() CCALLSFSUB0(PAEXIT,paexit)

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* #ifndef _PAW_H */
