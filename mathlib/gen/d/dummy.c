/* Dummy file to avoid undefined symbols in the library */
/* Kevin McCarty, 16 May 2006 */

#include <stdio.h>
#include <stdlib.h>

/* Want the dummy functions to be weakly defined so they may be overridden
 * without error. */

#define kludge(x)    #x
#define stringify(x) kludge(x)
#define underline(x) dummy_ ## x

#if  defined(__APPLE__) || defined( __NVCOMPILER)
//No alias
#define DUMMY(UPPERNAME, fortranname_, returntype, exitcode, docs) \
returntype fortranname_() __attribute__ ((weak)); \
returntype fortranname_(){ print_dummy(#UPPERNAME, docs, exitcode); }
#define DUMMYRET(UPPERNAME, fortranname_, returntype, exitcode, docs, rv) \
returntype fortranname_() __attribute__ ((weak)); \
returntype fortranname_(){ print_dummy(#UPPERNAME, docs, exitcode); return rv; }
#else
#define DUMMY(UPPERNAME, fortranname_, returntype, exitcode, docs) \
static returntype underline(fortranname_)() \
        { print_dummy(#UPPERNAME, docs, exitcode); } \
void fortranname_() \
	__attribute__ ((weak, alias (stringify(underline(fortranname_))) ))
#define DUMMYRET(UPPERNAME, fortranname_, returntype, exitcode, docs, rv ) \
static returntype underline(fortranname_)() \
        { print_dummy(#UPPERNAME, docs, exitcode); return rv;} \
void fortranname_() \
	__attribute__ ((weak, alias (stringify(underline(fortranname_))) ))
#endif

static void print_dummy(const char *function, const char * docs, int exitcode)
{
  fprintf(stderr, "mathlib: Now in dummy %s routine.\n", function);
  fprintf(stderr,
          "If you see this message, you %s define your own such routine.\n",
	  exitcode ? "must" : "may wish to");
  if (docs)
    fprintf(stderr,
	  "For details, the CERN writeup that can be found at\n"
	  "%s\n"
	  "may be helpful.\n", docs);
  if (exitcode)
    exit(exitcode);
}

static char d151docs[] = "http://preprints.cern.ch/cgi-bin/setlink?base=preprint&categ=cern&id=IT-ASD-D151";
static char d300docs[] = "http://preprints.cern.ch/cgi-bin/setlink?base=preprint&categ=cern&id=IT-ASD-D300";
static char d510docs[] = "http://wwwasdoc.web.cern.ch/wwwasdoc/shortwrupsdir/d510/top.html";

/* User-defined callback functions and subroutines */

/* D151: DIVONNE: multidimensional integration */
DUMMYRET(DFUN, dfun_, double, EXIT_FAILURE, d151docs, 0.0);

/* D300: elliptic partial differential equation callbacks */
DUMMY(GETCO, getco_, void, EXIT_FAILURE, d300docs);
DUMMY(USER1, user1_, void, 0, d300docs);
DUMMY(USER2, user2_, void, 0, d300docs);

/* D510: fitting likelihood functions (obsolete; use MINUIT instead!) */
DUMMYRET(FUNCT, funct_, double, EXIT_FAILURE, d510docs, 0.0);

/* No docs for MINSQ / LINSQ?  Not clear what CERN package they come from. */
DUMMY(FCN, fcn_, void, EXIT_FAILURE, 0);

