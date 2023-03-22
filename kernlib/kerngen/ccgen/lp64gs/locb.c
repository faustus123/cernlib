/*>    ROUTINE LOCB
  CERN PROGLIB# N101    LOCB            .VERSION KERNFOR  4.36  930602
*/

unsigned int chkloc(char *address);

unsigned int locb_(iadr)
   char *iadr;
{
   return (chkloc(iadr));
}

#include <stdint.h>    /* for ptrdiff_t, size_t */
#include <stdio.h>     /* for fprintf */
#include <stdlib.h>    /* for exit    */

int iptrdiff_(iadr1, iadr2)
   char * iadr1, * iadr2;
{
  long diff = (long)iadr1 - (long)iadr2;
  if (diff < (long)INT32_MIN || diff > (long)INT32_MAX) {
      fprintf(stderr, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
      fprintf(stderr, "IPTRDIFF: difference of addresses %p and %p\n", iadr1, iadr2);
      fprintf(stderr, "cannot be stored in 32-bit signed integer!\n");
      fprintf(stderr, "This may result in program crash or incorrect results\n");
      fprintf(stderr, "Therefore we will stop here\n");
      fprintf(stderr, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
      exit (999);
  }
  else return (int)diff;
}

int iptrsame_(iadr1, iadr2)
   char * iadr1, * iadr2;
{
  return (size_t)iadr1 == (size_t)iadr2 ? 1 : 0;
}
