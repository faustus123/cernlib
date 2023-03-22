#include "kerngen/pilot.h"

#include <string.h>
void ucopy2i_(int *from, int *to, int *nwords)
{
  if ( *nwords > 1 ) {
    memmove( (void *)to, (void *)from,(size_t)(sizeof(int)*(*nwords)));
  } else {
    if ( *nwords == 1 ) {
      *to = *from;
    }
    /* else  nothing to do */
  }
}
