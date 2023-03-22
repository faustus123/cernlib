#ifndef _LAPACK_H
#define _LAPACK_H
#include <cfortran/cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif
PROTOCCALLSFSUB11(DGELS,dgels,STRING,INT,INT,INT,DOUBLEV,INT,DOUBLEV,INT,DOUBLEV,INT,PINT)
#define DGELS(TRANS,M,N,NRHS,A,LDA,B,LDB,WORK,LWORK,INFO) CCALLSFSUB11(DGELS,dgels,STRING,INT,INT,INT,DOUBLEV,INT,DOUBLEV,INT,DOUBLEV,INT,PINT,TRANS,M,N,NRHS,A,LDA,B,LDB,WORK,LWORK,INFO)
#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* #ifndef _LAPACK_H */
