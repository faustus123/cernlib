/*
 *
 * Revision 1.1.1.1  2006/06/14
 * Kernlib  utility for locf, locb on LP64 architectures  H. Vogt
 * (AMD64/Intel EM64T and IA64) 
 *
 */

#include <stdio.h>
#include <stdlib.h>

/*>    ROUTINE LOCF
  CERN PROGLIB# N100    LOCF            .VERSION KERNFOR  4.36  930602
*/
/*>    ROUTINE LOCB
  CERN PROGLIB# N101    LOCB            .VERSION KERNFOR  4.36  930602
*/

unsigned int chkloc(iadr)
   char *iadr;
{
  /* 64 bit architectures may exceed the 32 bit address space !               */

  /* AMD64/Intel EM64T architectures have the dynamic segments above
     0x80000000000 and the stack immediately below this whereas the text and
     data segments are staring from 0x400000. The implementations address
     space is limited to 0x00007fffffffffff.
     Allocated memory with malloc/calloc is starting from the end of text and
     data segments upwards.                                                   

     IA64 architectures have the dynamic segments are above 0x2000000000000000,
     the stack is above 0x8000000000000000, the data segments starts at 
     0x6000000000000000 and the text segments start at 0x4000000000000000   
     Allocated memory with malloc/calloc is starting from the end of
     data segments upwards. All addresses here are expected to be in
     the data segment area.                                                   */

  /* K. McCarty: On Alpha, on the other hand, I couldn't find any docs for the
     Linux segmentation for virtual memory.  Judging by a test machine
     (escher.debian.org), the data section starts slightly above 0x120010000.
     On the other hand the stack grows downward from 0x120000000. */

   const unsigned long mask=0xffffffff00000000;
   static unsigned long limit=0x00000000ffffffff;
   unsigned long jadr=((unsigned long) iadr & mask);
#if defined (__ia64__)
    if ( jadr != 0x6000000000000000) {
#elif defined (__alpha__)
    if ( jadr != 0x0000000100000000) {
#elif  defined(__DARWIN__)
    if ( jadr != 0x0000000100000000) {
      fprintf(stderr, "Darwin64\n");
#else  /* amd64 or ppc64 */
    if ( jadr != 0) {
      fprintf(stderr, "amd64 or ppc64\n");
#endif
      fprintf(stderr, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
      fprintf(stderr, "LOCB/LOCF: address %p exceeds the 32 bit address space\n", iadr);
      fprintf(stderr, "or is not in the data segments\n");
      fprintf(stderr, "This may result in program crash or incorrect results\n");
      fprintf(stderr, "Therefore we will stop here\n");
      fprintf(stderr, "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
      exit (999);
    }
    jadr=((unsigned long) iadr & limit);
    return ((unsigned) jadr);
}
/*> END <----------------------------------------------------------*/

