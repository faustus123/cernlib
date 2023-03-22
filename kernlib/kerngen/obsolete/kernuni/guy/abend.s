*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/15 17:53:58  mclareni
* Initial revision
*
*
. *****************************         LAST MODIF.
.
 .    CALL ABEND             ABNORMAL JOB-STEP TERMINATION
 .                           STRASSBURG, AUG 1976
          AXR$
$(1)
ABEND*
          ER        EABT$
          END
#ifdef CERNLIB_TCGEN_ABEND
#undef CERNLIB_TCGEN_ABEND
#endif
