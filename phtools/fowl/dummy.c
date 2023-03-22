/* Dummy file to avoid undefined symbols in the library */
/* Kevin McCarty, 26 Apr 2004 */
/* Last revised 13 Aug 2004 */

#include <stdio.h>
#include <stdlib.h>

/* Want the dummy functions to be weakly defined so they may be overridden
 * without error. */

#define kludge(x)    #x
#define stringify(x) kludge(x)
#define underline(x) dummy_ ## x

#if  defined(__APPLE__) || defined( __NVCOMPILER)
//No alias
#define DUMMY(UPPERNAME, fortranname_, returntype) \
returntype fortranname_() __attribute__ ((weak)); \
returntype fortranname_(){ print_dummy(#UPPERNAME); }
#else
#define DUMMY(UPPERNAME, fortranname_, returntype) \
static returntype underline(fortranname_)() { print_dummy(#UPPERNAME); } \
void fortranname_() \
	__attribute__ ((weak, alias (stringify(underline(fortranname_))) ))
#endif

static void print_dummy(const char *function)
{
  fprintf(stderr, "phtools: Now in dummy %s routine.\n", function);
  fprintf(stderr,
          "If you see this message, you should define your own such routine.\n"
	  "For details, see "
	      "the CERN writeup for FOWL (available at the URL\n"
	  "http://wwwasdoc.web.cern.ch/wwwasdoc/Welcome.html ; scroll down\n"
	  "to the link for W505 - FOWL.)\n");
  exit(EXIT_FAILURE);
}

DUMMY(FSTART, fstart_, void);
DUMMY(USER,   user_,   void);
DUMMY(FINISH, finish_, void);

