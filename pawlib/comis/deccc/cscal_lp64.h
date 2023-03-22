#if defined(CERNLIB_QMLXIA64)
/* Hideous hack macros that attempt to deal with 64-bit pointers using
 * knowledge about only 32 bits of them. */

/* Test whether a variable is automatic or static based on the lowest 32 bits
 * of its address.
 *
 * Itanium architecture is such that the data section starts at
 * 0x6000000000000000.  The stack is supposed to be between 0x80...0 and
 * 0xa0...0 starting at the high end and growing downwards, although on a test
 * machine (merulo.debian.org) it seemed instead to start at 0x6000100000000000
 * and grow downwards.  The addresses we actually get are truncated to the
 * lowest 32 bits, so we assume that those greater than 0x80000000 are in the
 * stack.  Constant strings are in the text section starting at 0x40...0; we
 * hope that functions using these macros don't receive any.
 *
 * On AMD64, the data section and constant strings are all within 32 bits
 * of NULL, starting at 0x400000 and growing upward.  The stack starts
 * at 0x80000000000 and grows downward.  However, tests I've run on an AMD64
 * indicate that the low-order 32 bits of the address for variables on the
 * stack may be indistinguishable from data segments; therefore we simply
 * hope (pray) that all variables used are in the data segments.
 *
 * On Alpha, on the other hand, I couldn't find any docs for the Linux
 * segmentation for virtual memory.  Judging by a test machine
 * (escher.debian.org), the data section starts slightly above 0x120010000.
 * On the other hand the stack grows downward from 0x120000000.  Here it
 * seems safe to suppose that the variable is in the stack if the uint32
 * truncated address received is less than 0x20000000.
 *
 * -- Kevin McCarty
 */

#if defined (__ia64__)
# define autotest(_var) ((unsigned long)(_var) > 0x80000000UL)
#elif defined (__alpha__)
# define autotest(_var) ((unsigned long)(_var) < 0x20000000UL)
#else /* amd64 */
# define autotest(_var) 0 /* can't test for it */
#endif


#define restore_pointer(_var, _ptr, _cast) do {			      	    \
   static int sdummy = 0; int adummy = 0;                                   \
   unsigned long sbase = ((unsigned long)&sdummy) & 0xffffffff00000000UL;   \
   unsigned long abase = ((unsigned long)&adummy) & 0xffffffff00000000UL;   \
   _ptr = (_cast)((unsigned long)(_var) + (autotest(_var) ? abase : sbase));\
 } while (0)


#define setcall_lp64(type)                                                  \
 long *fptr;                                                                \
 int *n;                                                                    \
 unsigned pin[16];                                                          \
{                                                                           \
   int jumpad_();                                                           \
   type (*name)();                                                          \
   unsigned long ptr = (unsigned long)jumpad_;                              \
   unsigned long p[16];                                                     \
   int  count;                                                              \
   ptr += *fptr;                                                            \
   name = (type (*)())ptr;                                                  \
   for ( count=0; count<16; count++ )                                       \
     restore_pointer(pin[count], p[count], unsigned long);                  \
   /* end of macro */


#define setaddr_lp64(__ja, __jb)                                            \
  restore_pointer(__ja, a, char*);                                          \
  restore_pointer(__jb, b, char*);                                          \
   /* end of macro */

#endif

