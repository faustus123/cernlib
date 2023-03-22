#ifndef _ZEBRA_H
#define _ZEBRA_H
#include <cfortran/cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif
PROTOCCALLSFSUB1(MZEBRA,mzebra,INT)
#define MZEBRA(A1)    CCALLSFSUB1(MZEBRA,mzebra,INT,A1)

PROTOCCALLSFSUB2(MZPAW,mzpaw,INT,STRING)
#define MZPAW(A1,A2)  CCALLSFSUB2(MZPAW,mzpaw,INT,STRING,A1,A2)
#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* #ifndef _ZEBRA_H */
