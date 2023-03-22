#include "kerngen/pilot.h"

#include <string.h>

void ucopy2r_(float *from, float *to, int *nwords)
{
  if ( *nwords > 1 ) {
    memmove( (void *)to, (void *)from,(size_t)(sizeof(float)*(*nwords)));
  } else {
    if ( *nwords == 1 ) {
      *to = *from;
    }
    /* else  nothing to do */
  }
}

