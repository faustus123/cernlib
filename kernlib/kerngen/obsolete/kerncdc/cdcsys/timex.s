*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:51:36  mclareni
* Initial revision
*
*
          IDENT TIMEX
*
* CERN PROGLIB# Z007    TIMEX           .VERSION KERNCDC  0.1   760901
*
          ENTRY TIMEX
          EXT   SECOND
*
*     CALL TIMEX (T)     RETURNS RUNNING TIME IN FLOATING SECONDS
*                             AUG-76, JZ.
*
 TRACE    VFD   30/5HTIMEX,30/TIMEX
 TIMEX    DATA  0
+RJSECOND
-         VFD   12/0,18/TRACE
          EQ    TIMEX
          END
#ifdef CERNLIB_TCGEN_TIMEX
#undef CERNLIB_TCGEN_TIMEX
#endif
