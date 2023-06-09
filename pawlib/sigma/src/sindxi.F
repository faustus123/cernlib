*
* $Id$
*
* $Log$
* Revision 1.1  1995/12/12 14:36:17  mclareni
* Initial revision
*
*
#include "sigma/pilot.h"
*CMZ :  1.10/00 26/10/93  12.17.04  by  Carlo E. Vandoni
*-- Author :
      SUBROUTINE SINDXI
C
C
C
C    ..................................................
C
C
C         PURPOSE
C            TO PERFORM INDEXING ON BOTH SIDES OF ASSIGNMENT OPERATOR
C
C         USAGE
C            CALL SINDXI
C
C         DESCRIPTION OF PARAMETERS
C            NAR=0 FOR VALUE SITUATION (RHS OF ASSINGMENT)
C            NAR=1 FOR ASSIGNMENT SITUATION (LHS OF ASSIGNMENT)
C
C         TRACKS USED
C            USES TRACK 33 FOR GENERAL TRACKING
C            USES TRACK 34 TO TRACK EACH D A T A TRANSFER
C
C         REMARKS
C            IN ASSIGNMENT SITUATION STACK HAS
C                     TOP   VALUE ALREADY IN INDEX ORDER THAT IS ASSIGNED
C                     TOP-1 NARG=NUMBER OF ARGUMENTS IN SUBSCRIPT LIST
C                     TOP-2 RIGHTMOST ARG
C                     ...
C                     TOP-NARG-1 LEFTMOST ARG
C                     TOP-NARG-2 THE NAME OF THE INDEXED ARRAY (X)
C
C            IN A VALUE SITUATION THE STACK HAS
C                     TOP   THE NAME OF THE INDEXED ARRAY (X)
C                     TOP-1 THE RIGHTMOST ARG
C                     ...
C                     TOP-NARG THE LEFTMOST ARG
C
C         SUBROUTINES AND FUNCTION SUBPROGRAMS REQUIRED
C            NGET                       SIUSTR
C            IGETT2                     SIUSTK
C            SIASSI
C
C         METHOD
C            CALCULATE RELATIVE DISPLACEMENT OF EACH NEXT ELEMENT
C            WITH RESPECT TO THE POSITION OF THE PRECEDING ELEMENT
C            IN THE PARENT ARRAY
C
C         AUTHOR.   JURIS REINFELDS      DATE 05/06/74
C
C
C    ..................................................
C
C
C
C   PERFOMS INDEXING ON BOTH SIDES OF ASSIGNMENT
C   NAR=0  FOR VALUE SITUATION (RHS OF ASSIGNMENT)
C   NAR=1  FOR ASSIGNMENT SITUATION (LHS OF ASSIGNMENT)
C
#include "sigma/sicsig.inc"
#include "sigma/sigc.inc"
#include "sigma/pawc.inc"
#include "sigma/siclin.inc"
C
      EQUIVALENCE(IADARB,LA1)
      EQUIVALENCE(IADARG,LA2)
      EQUIVALENCE(IADRES,LA3)
      EQUIVALENCE(IADREB,LA4)
      DIMENSION XNCO(10),XDOPE(11),ARGNCO(10),ARGDOP(11),RESNCO(10)
C
      CHARACTER CDOLLA*1,CL*8
      EQUIVALENCE(CDOLLA,CL)
C
       DIMENSION DUDIM(10)
C
CDUMMY DIM ARRAY!!!!
C
      CALL SITRAC(' SINDXI   ')
C
       CALL SINEXT(NARG)
C        PRINT *,' SINDXI WITH NARG =',NARG

C   LOOK UP AND GET NAME OF INDEXED ARRAY
       IINN=0
         CALL SILSKK(IINN,INAME,CNAME)
         CL=CNAME
      CALL SINGET(ISI,0,XNCO)
      IF(IERRNO.NE.0)RETURN
      IF(ISI.GE.3) GOTO 965
      NDIMX=NDIM
      MODEX=MODE
      ISTRIX=ISTRI


      LA6=IADDR


C   MAKE DOPE VECTOR OF X
C
      XDOPE(1)=MODEX
      DO 10 I=1,NDIMX
      XDOPE(I+1)=XDOPE(I)*XNCO(I)
10    CONTINUE
      NDIMP1=NDIMX+1
C
C
      IF(SITRAK(33).NE.1) GOTO 115
      WRITE(NPRINT,1001) (XNCO(I),I=1,NDIMX)
      WRITE(NPRINT,1001) (XDOPE(I),I=1,NDIMP1)
1001  FORMAT(' X ',11F5.0)
115   CONTINUE
C
C   CHECK SUBSCR. LIST ITEMS & MAKE ARGNCO & COUNT ITEMS
C   IF TOO MANY SUBSCRIPT LIST ITEMS(REJECTS GT 10 ITEMS AS NDIMX LE 10)
      IF(NARG.GT.NDIMX) CALL SINERR(25)
      SARNCO=0.
C
      DO 20 I=1,NDIMX
C   TAKES CARE OF MISSING LEADING MISSING INDICES
      IF(I.GT.NARG) GOTO 25
C   TAKES CARE OF ANY MISSING INDEX
C     IF(LSTAK(I+NAR).EQ.MASK3.AND.MSTAK(I+NAR).EQ.MASK3) GOTO 25
C   LOOK UP SUBSCRIPT LIST ITEMS,FIRST JUST TO FIND THEIR LENGTH
      CALL SINGET(ISI,I,ARGDOP)
      IF(IERRNO.NE.0)RETURN
      IF(ISI.GE.3) GO TO 967
C   IF SUBSCR. LIST ITEM MULTIDIMENSIONAL
      IF(NDIM.NE.1) GO TO 986
      ARGNCO(I)=ARGDOP(1)
      GOTO 29
25    CONTINUE
      ARGNCO(I)=XNCO(I)
29    CONTINUE
      SARNCO=SARNCO+ARGNCO(I)
20    CONTINUE
C
C   MAKE ARGDOP VECTOR
      ARGDOP(1)=FLOAT(MODEX)
C
      DO 30 I=1,NDIMX
      ARGDOP(I+1)=ARGDOP(I)*ARGNCO(I)
30    CONTINUE
C
      IF(SITRAK(33).NE.1) GOTO 135
      WRITE(NPRINT,1002) (ARGNCO(I),I=1,NDIMX)
      WRITE(NPRINT,1002) (ARGDOP(I),I=1,NDIMP1)
1002  FORMAT(' ARG ',11F5.0)
135   CONTINUE
C
C   GET AREA FOR INDEX VALUES, TAKE REAL PT,ROUND,CHECK BOUNDS,
C   OMIT SETTING MODE,ISTRI,ETC. AS THIS IS USED AS SCRATCH AREA ONLY
C   GETT2 NOT IGETT2 TO ENSURE ALWAYS A STACK ENTRY FOR INDEX ARRAY
      CALL SIGTT2(IADARG,IFIX(SARNCO),1,ARGNCO)
      IF(IERRNO.NE.0)RETURN
      IADARB=IADARG
C
      DO 40 I=1,NDIMX
C   TAKE CARE OF MISSING LEADING MISSING INDEX
      IF(I.GT.NARG) GOTO 47
C   TAKES CARE OF ANY MISSING INDEX
C     IF(LSTAK(I+1).EQ.MASK3.AND.MSTAK(I+1).EQ.MASK3) GOTO 45
C   LOOK AT SUBSCRIPT LIST AGAIN
C   NOW WE HAVE A PLACE FOR THE SUBSCRIPT VALUES
      CALL SINGET(ITYPE,I+1,DUDIM)
      IF(IERRNO.NE.0)RETURN
      IADDR=IADDR-1
      LA5=IADDR
      M2J=ARGNCO(I)*MODE
      DO 42 J=1,M2J,MODE
      FIRST=FLOAT(IFIX(DYNA(LA5+J)+.5))
C   IF SUBSCRIPT OUT OF RANGE
      IF(FIRST.LT.1.0.OR.FIRST.GT.XNCO(I)) GO TO 964
      DYNA(IADARG)=FIRST
      IADARG=IADARG+1
42    CONTINUE

C
      GOTO 40
C45    CONTINUE
C
47    CONTINUE
C   GENERATE INDEX VALUES FOR MISSING INDEX
      M2J=ARGNCO(I)
C
      DO 48 J=1,M2J
      DYNA(IADARG)=FLOAT(J)
      IADARG=IADARG+1
48    CONTINUE
C
40    CONTINUE
C
C   MAKE NDIMRE & RESNCO BY DROPPING ONES FROM ARGNCO
C
      NDIMRE=0
      DO60 I=1,NDIMX
C   SKIP A ONE IN ARGNCO
      IF(ARGNCO(I).EQ.1.) GOTO 60
      NDIMRE=NDIMRE+1
      RESNCO(NDIMRE)=ARGNCO(I)
60    CONTINUE
C
C   IF RESULT IS NOT A SCALAR
      IF(NDIMRE.NE.0) GOTO 165
      NDIMRE=1
      RESNCO(1)=1.
165   CONTINUE
C
C   GET AREA FOR RESULT
C
      MODE=MODEX
      ISTRI=ISTRIX
      LENGRE=IFIX(ARGDOP(NDIMP1))
       CALL SIGTT2(IADRES,LENGRE,NDIMRE,RESNCO)
      IADREB=IADRES
C
      IF(SITRAK(33).NE.1) GOTO 169
      WRITE(NPRINT,1003) SARNCO,LENGRE,IADARB,IADARG
1003  FORMAT(' SARNCO=',F5.0,' LENGRE=',I4,' IADARB=',I6,
     ,' IADARG=',I6)
      WRITE(NPRINT,1004) (DYNA(I),I=IADARB,IADARG)
1004  FORMAT(' INDICES ',10F5.0)
169   CONTINUE
C
C   CALCULATE FIRST ROW OF DISPLACMTS, DISPLCMT=0 FOR SINGLE ELEM ROW
C
      XMODE=MODEX
C   ROW POSITION OF FIRST INDEXED ELEMENT IN X
      BASADR=(DYNA(IADARB)-1.)*XMODE
      IADARG=IADARB
C   IF NOT JUST ONE ELEM. SPECIFIED
      IF(ARGNCO(1).NE.1.) GOTO 173
      DYNA(IADRES)=0.
      IADRES=IADRES+MODEX
      IADARG=IADARG+1
      GOTO 175
C
173   CONTINUE
      M2I=ARGNCO(1)
C
      DO 70 I=2,M2I
      DYNA(IADRES)=(DYNA(IADARG+1)-DYNA(IADARG))*XMODE
      IADARG=IADARG+1
      IADRES=IADRES+MODEX
70    CONTINUE
C
C
      DYNA(IADRES)=(DYNA(IADARB)-DYNA(IADARG))*XMODE
      IADARG=IADARG+1
      IADRES=IADRES+MODEX
C
175   CONTINUE
C
C === DEBUG
      IF(SITRAK(33).NE.1)GOTO 177
      WRITE(NPRINT,1105)IADREB,IADRES
1105  FORMAT(' IADREB=',I6,' IADRES=',I6)
      WRITE(NPRINT,1005)(DYNA(I),I=IADREB,IADRES)
1005  FORMAT(' DISPLAC',10F5.0)
C === END
177   CONTINUE
C
C
C   DUPLICATE THIS ROW OVER WHOLE ARRAY
C
      M2I=LENGRE/IFIX(ARGDOP(2))-1
C   IF TOTAL NUMBER OF ROWS IN ARRAY IS ONE
      IF(M2I.EQ.0) GOTO 191
C   LENGTH OF ROW COUNTING REAL & IMAG. PARTS SEPARATELY
      M2J=IFIX(ARGNCO(1))*MODEX
C
C
      DO 80 I=1,M2I
      DO 84 J=1,M2J,MODEX
      DYNA(IADRES)=DYNA(IADREB-1+J)
      IADRES=IADRES+MODEX
84    CONTINUE
80    CONTINUE
C
C
191   CONTINUE
C   ADD DISPLACEMENTS DUE TO HIGHER DIMENSIONS
C   IF THERE ARE NO HIGHER DIMENSIONS, DISPLACEMENTS ARE ALREADY CORRECT
      IF(NDIMX.EQ.1) GOTO 193
C
C
      DO 90 I=2,NDIMX
      IADARB=IADARG
      BASADR=BASADR+(DYNA(IADARB)-1)*XDOPE(I)
      IADARG=IADARG+1
C   SKIP THIS DIMENSION IF SINGLE ELEM.(CONTRIB. TO BASADR ALREADY OK)
      IF(ARGNCO(I).EQ.1) GOTO 90
C
C
C   MAKE NEXT LOT OF DISPLACEMENTS
C
      FIRST=DYNA(IADARG-1)
      M2J=IFIX(ARGNCO(I))
      DO 92 J=2,M2J
      DYNA(IADARG-1)=(DYNA(IADARG)-DYNA(IADARG-1))*XDOPE(I)
      IADARG=IADARG+1
92    CONTINUE
      DYNA(IADARG-1)=(FIRST-DYNA(IADARG-1))*XDOPE(I)
C
C
C === DEBUG
      IF(SITRAK(33).EQ.1) WRITE(NPRINT,1005)(DYNA(J),J=IADARB,IADARG)
C === END
C
C
C   ADD THIS SET OF DISPLACEMENTS CYCICLY TO RESULT ARRAY
C
      M2J=LENGRE/IFIX(ARGDOP(I+1))
      DO 96 J=1,M2J
      M2K=IFIX(ARGNCO(I))
      DO 98 K=1,M2K
      KKK=IADREB+(J-1)*IFIX(ARGDOP(I+1))+K*IFIX(ARGDOP(I))-MODEX

      DYNA(KKK)=DYNA(KKK)+DYNA(IADARB+K-1)
98    CONTINUE
96    CONTINUE
C
C === DEBUG
C
      IF(SITRAK(33).EQ.1) WRITE(NPRINT,1006) BASADR,(DYNA(J),J=IADREB
     1,IADRES)
1006  FORMAT(' RESULT',10F5.0)
C
C
C === END
90    CONTINUE
C
C
C
193   CONTINUE
      IBASE=IFIX(BASADR)+LA6
C
C
C   TOP OF STACK NOW HAS DISPLACEMENT VECTOR WITH NCO OF RESULT IN PLACE
C   COPY THE ELEMENTS FROM X IF ON RHS OF ASSIGN

C
      DO 100 I=1,LENGRE,MODEX
      FIRST=DYNA(IADREB+I-1)
      DYNA(IADREB+I-1)=DYNA(IBASE)
C   IF COMPLEX,PICK IMAG. PART FROM NEXT LOCATION IN X & PUT IN RESULT
      IF(MODEX.EQ.2)DYNA(IADREB+I)=DYNA(IBASE+1)
C
C === DEBUG
C
      IF(SITRAK(34).NE.1) GOTO 101
      J=IADREB+I-1
      WRITE(NPRINT,1106) I,J,IBASE
1106  FORMAT(' I=',I6,' IADREB+I-1=',I6,' IBASE=',I6)
      WRITE(NPRINT,*)DYNA(J),DYNA(J+1)
C === END
101   CONTINUE
C
C
      IBASE=IBASE+IFIX(FIRST)
100   CONTINUE
C
C
C === DEBUG
C
      IF(SITRAK(33).NE.1) GOTO 195
      WRITE(NPRINT,1007)IADREB,LENGRE,IBASE
1007  FORMAT(' IADREB=',I6,' LENGRE=',I6,' IBASE=',I6)
C === END
195   CONTINUE
C
C
C   CONSTANTIZE RES IF NEC.,SIUSTK ARGS&INDEX AREA, LEAVE RES ON STACK
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC       RETURN
3344  IADDR=IADREB
      CALL SISTR2(NARG+2)
      RETURN
 964  CONTINUE
C      NAME=NAMX
      CALL SINERR(64)
      RETURN
 965  CONTINUE
C      NAME=NAMX
      CALL SINERR(65)
      RETURN
 967  CONTINUE
C      NAME=NAMX
      CALL SINERR(67)
      RETURN
 986  CONTINUE
C      NAME=NAMX
      CALL SINERR(26)
      END
