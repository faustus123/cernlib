*
* $Id$
*
* $Log$
* Revision 1.1  1996/03/08 15:44:21  mclareni
* Initial revision
*
*
#if defined(CERNLIB_IBMVM)
         PRINT GEN
GETUNIQ  EDCPROL
         BALR 12,0
         USING *,12                  R12 <-- REGISTRO BASE
*********************************************************************
         LA    2,EXTRACT                                            2
         LA    3,2
         DC    X'83',X'23',XL2'0180'     DIAGNOSE X'180'            2
*********************************************************************
         L     15,PID
FIN      EDCEPIL
         LTORG *
EXTRACT  DC    CL8'UNIQUE  '
         DS    CL4
PID      DS    CL4
         END   GETUNIQ
#endif
