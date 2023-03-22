/*
 * $Id$
 *
 * $Log$
 * Revision 1.5  2004/10/22 12:03:16  couet
 * - The previous version of this routine returned NAN on the lxplus machine
 *   lxslc3
 *
 * Revision 1.4  1997/09/02 15:50:42  mclareni
 * WINNT corrections
 *
 * Revision 1.3  1997/03/14 12:02:24  mclareni
 * WNT mods
 *
 * Revision 1.2.2.1  1997/01/21 11:34:43  mclareni
 * All mods for Winnt 96a on winnt branch
 *
 * Revision 1.2  1996/03/14 13:44:12  berezhno
 * mods for WINNT
 *
 * Revision 1.1.1.1  1996/02/26 17:16:55  mclareni
 * Comis
 *
 */
#include "comis/pilot.h"
#if !defined(CERNLIB_ALPHA_OSF)
/*CMZ :          22/11/95  10.40.22  by  Julian Bunn*/
/*-- Author :*/

#define cscalr
#undef  cscalr

#if defined(CERNLIB_WINNT) || defined(CERNLIB_LINUX)
# include <stdio.h>
#endif


#if (defined(CERNLIB_QX_SC))&&(!defined(CERNLIB_WINNT))&&(!defined(CERNLIB_QMLXIA64))
float cscalr_ (name,n,p)
#endif

#if defined(CERNLIB_QXNO_SC)
float cscalr (name,n,p)
#endif

#if defined(CERNLIB_QXCAPT)
# if defined(CERNLIB_MSSTDCALL)
   float type_of_call CSCALR(name,n,p)
# else
   int CSCALR (name,n,p)
# endif
#endif

/*
 * 64-bit pointer systems require a special treatment of addresses - see below 
 * using the CERNLIB_QMLXIA64 macro definition (H. Vogt - Sep 2005)
 * This code will be consistent with that of jumptn.c and jumpxn.c
 * in packlib/kernlib/kerngen/ccgen (usage of jumpad_)
 *
 * for shared objects loaded by the dynamic linker content of the 1st arg
 * in cscalr_ is a pointer which may be above the 32 bit address space
 * therefore *fptr has been changed to type long
 * see changes in csintx.F, cskcal.F, ... (introduction of INTEGER*8 array for
 * those pointers)
 */

#if defined(CERNLIB_QMLXIA64)

/* Additional note: g77 generates code such that it expects REAL functions
 * to return "double".  Hence C functions to be used in FORTRAN as REAL
 * must return "double", and declarations of REAL FORTRAN functions in C files
 * must also return "double".  On most architectures one can get away with
 * using "float" instead, but not on amd64 ... see
 * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=15397
 *
 * -- Kevin McCarty */
# if !(defined(CERNLIB_GFORTRAN)||defined(CERNLIB_INTELIFC))  /* i.e. g77 */
#  define float double
# endif

# include "cscal_lp64.h"
float cscalr_ (fptr,n,pin)
 setcall_lp64(float)
#else
 float (type_of_call *(*name)) ();
 int *n;
 int *p[16];
{
#endif
   float r=0.0;
   switch (*n)
   {
      case 0:
         r = ((*(*name))());
         break;
      case 1:
         r = ((*(*name))(p[0]));
         break;
      case 2:
         r = ((*(*name))(p[0],p[1]));
         break;
      case 3:
         r = ((*(*name))(p[0],p[1],p[2]));
         break;
      case 4:
         r = ((*(*name))(p[0],p[1],p[2],p[3]));
         break;
      case 5:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4]));
         break;
      case 6:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5]));
         break;
      case 7:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6]));
         break;
      case 8:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7]));
         break;
      case 9:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]));
         break;
      case 10:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9]));
         break;
      case 11:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10]));
         break;
      case 12:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11]));
         break;
      case 13:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12]));
         break;
      case 14:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]));
         break;
      case 15:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13],p[14]));
         break;
      case 16:
         r = ((*(*name))(p[0],p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13],p[14],p[15]));
         break;
      default:
         printf("\n More then 16 arguments in call users routine");
   }
   return r;
}
#endif
