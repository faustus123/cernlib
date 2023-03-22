#ifndef _CSPACK_H
#define _CSPACK_H
#include <cfortran/cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif
PROTOCCALLSFSUB2(CZPUTA,czputa,STRING,PINT)
#define CZPUTA(CHMAIL,ISTAT) CCALLSFSUB2(CZPUTA,czputa,STRING,PINT,CHMAIL,ISTAT)

PROTOCCALLSFSUB2(CZGETA,czgeta,PSTRING,PINT)
#define CZGETA(CHMAIL,ISTAT) CCALLSFSUB2(CZGETA,czgeta,PSTRING,PINT,CHMAIL,ISTAT)
#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* #ifndef _CSPACK_H */
