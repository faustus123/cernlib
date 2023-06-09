;
; $Id$
;
; $Log$
; Revision 1.1  1996/02/15 17:50:27  mclareni
; Initial revision
;
;
 .TITLE NOARG
;++
; CERN PROGLIB# Z029    NOARG           .VERSION KERNVAX  2.12  850522
; ORIG.  J. VORBRUEGGEN 30/4/83
; MODIFIED D.J.CANDLIN 29/4/85
;
; SUBROUTINE NOARG(NARG)
; RETURN NUMBER OF ARGUMENTS CALLER WAS CALLED WITH
;--
        .IDENT  /01/
        .PSECT  $CODE,PIC,CON,REL,LCL,SHR,EXE,RD,NOWRT,LONG
        .ENTRY  NOARG,^M<>

        MOVL    8(FP),R0    ; UPPER THREE BYTES MAY BE USED LATER !
        MOVZBL  (R0),R1     ; NUMBER OF ARGUMENTS
        CMPL    R1,#1       ; FORTRAN COMPILER ALWAYS PRODUCES
        BNEQ    NOPROB      ; AT LEAST ONE ARGUMENT, USING %VAL(0)
        TSTL    4(R0)       ; IF NO ARGUMENTS ARE GIVEN BY THE
        BNEQ    NOPROB      ; CALLING PROGRAM.
        CLRL    R1          ; IF NARG = 1, AND ARG IS %VAL(0),
                            ; THEN PUT NARG = 0
NOPROB: MOVL    R1,@4(AP)   ; RETURN NARG
        RET
        .END
