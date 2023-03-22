#ifndef _MDPOOL_H
#define _MDPOOL_H

/* mdpool.h */

/* #include <comis/mdpool.h> or <comis/mdpool.inc> in one source code file of
 * your executable program dynamically linked against libpaw
 * so that MDPOOL is defined in your executable.  This is
 * necessary for proper functioning of the COMIS interpreter when
 * dynamically linked.
 */

/* define MDSIZE: */
#include <comis/mdsize.h>

#include <cfortran.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
  int iq[MDSIZE];
} mdpool_def;

#define MDPOOL COMMON_BLOCK(MDPOOL, mdpool)
COMMON_BLOCK_DEF(mdpool_def, MDPOOL);

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _MDPOOL_H */
