#include "kerngen/pilot.h"

#include <string.h>

void ucopy2d_(double *from, double *to, int *nwords)
{
  if ( *nwords > 1 ) {
    memmove( (void *)to, (void *)from,(size_t)(sizeof(double)*(*nwords)));
  } else {
    if ( *nwords == 1 ) {
      *to = *from;
    }
    /* else  nothing to do */
  }
}
