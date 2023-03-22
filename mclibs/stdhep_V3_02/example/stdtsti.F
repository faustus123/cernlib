      PROGRAM TSTISA
C   
C     JTDKY = +/- unit number for decay table file.    
C                 If it is negative, decay table is not printed.   
C     JTEVT = +/- unit number for output event file.   
C                 If it is negative, only stable particles are written on it. 
C     JTCOM =     unit number for command file.    
C     JTLIS =     unit number for listing. 
C   
      IMPLICIT NONE 
#include "itapes.inc"
#include "idrun.inc"
#include "primar.inc"
#include "isloop.inc"
C
#include "stdhep.inc"
#include "stdlun.inc"
#if defined(HPZTST) && defined(UNIX)
#if defined(ULTRIX)
C... problem here because isajet defines IQUEST
#include "quest.inc"
      INTEGER IERR
#else
#include "quest.inc"
      INTEGER IQUEST,IERR
#endif
#endif
C   
      INTEGER JTDKY,JTEVT,JTCOM,JTLIS,IFL,ILOOP,IPRT,LOK,ILOOP2
#if defined(UNIX)
      INTEGER INDEC
      CHARACTER*132 ISADEC
#endif
      LOGICAL OK,DONE
      SAVE ILOOP,JTDKY,JTEVT,JTCOM,JTLIS

      EXTERNAL ALDATA
C   
C          Initialize ISAJET    
C   
      JTDKY=-1
      JTEVT=23
      JTCOM=21
      JTLIS=22
#if defined(UNIX)
C  point to standard decay tables
      CALL GETENV( 'DAT', ISADEC )
      IF ( ISADEC .EQ. ' ' ) THEN
         ISADEC = 'isajet.dat'
      ELSE
         INDEC   = INDEX ( ISADEC , ' ' ) - 1
         ISADEC  = ISADEC(:INDEC) // '/isajet.dat'
      ENDIF
      OPEN(UNIT=1,FILE=ISADEC,STATUS='OLD')
#else
      OPEN(UNIT=1,FILE='DAT:ISADECAY.DAT',STATUS='OLD',READONLY)
#endif
      OPEN(UNIT=JTCOM,FILE='stdtsti.cmd',STATUS='OLD')
#if defined(HPZTST)
      OPEN(UNIT=JTLIS,FILE='stdtstiz.lpt',STATUS='NEW')
#else
      OPEN(UNIT=JTLIS,FILE='stdtsti.lpt',STATUS='NEW')
#endif
      CALL ISAINI(JTDKY,JTEVT,JTCOM,JTLIS)  
C initialize HEP logical units
      LNHWRT=JTEVT
      LNHRD=0
      LNHDCY=0
      LNHOUT=JTLIS
#if defined(HPZTST)
      CALL HEPZINIT
#else
      OPEN(UNIT=LNHWRT,FILE='stdtsti.io',STATUS='NEW',
     1     FORM='UNFORMATTED')
#endif
#if defined(HPZTST) && (!defined(UNIX))
      OPEN(UNIT=LNHWRT,FILE='stdtstiz.fz',STATUS='NEW',
     1     RECORDTYPE='FIXED',FORM='UNFORMATTED',RECL=900,BLOCKSIZE=3600)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XO')
#endif
#if defined(HPZTST) && defined(UNIX)
      CALL CFOPEN(IQUEST(1),0,900,'w',2,'stdtstiz.fz',IERR)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XLO')
#endif
#if defined(HEPDBG)&&defined(HPZTST)
      CALL FZLOGL(LNHWRT,3)
#endif
      CALL TSTBKEM(40)
      IPRT=1
C   
C print list of defined particles and their translations
C    (you have to call ISAINI first)
C use bogus masses for 4th generation quarks so we can see their definitions
C
      CALL PRTLST(JTLIS,200.,220.)
C
C    compare particle ID for isajet and standard
C
      CALL HPTRLSTI
C   
C          Read instructions; terminate for STOP command or error.  
C   
      ILOOP2 = 0
 201  IFL=0 
      CALL ISABEG(IFL)  
      IF(IFL.NE.0)THEN
#if defined(HPZTST)
C... close zebra file
        CALL FZENDO(LNHWRT,'ET')
#endif
C...print histograms
        CALL HOUTPU(LNHOUT)
        CALL HISTDO
      ENDIF
      IF(IFL.NE.0) STOP
#if !defined(HPZTST)
C          Fill Stdhep common block 1
        CALL STDFLISXSEC
C          Write Stdhep begin-run record   
        CALL HEPWRT(100,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep begin run record'
C          Write Isajet begin-run record   
        CALL HEPWRT(104,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing begin run record'
#endif
C   
C          Event loop   
C   
      ILOOP=0   
 301  CONTINUE  
      ILOOP=ILOOP+1   
C        Generate one event - discard if .NOT.OK  
      CALL ISAEVT(ILOOP,OK,DONE)  
C        Write event record   
      IF(OK)THEN
        CALL ISAHEP(1)
        IF(NEVHEP.LE.IPRT)THEN
           CALL PRTEVT(0)
           CALL HEPLST(1)
           CALL HEPTREE
        ENDIF
        CALL TSTFLEM(40)
#if defined(HPZTST)
        CALL HEPZWRT(LOK)
#else
        CALL HEPWRT(1,LOK)
C          Fill Stdhep common block 1
        CALL STDFLISXSEC
        CALL TSTFLXS(40,ILOOP2)
#endif
        IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing event record'
      ENDIF
      IF(.NOT.DONE) GO TO 301   
C   
C          Calculate cross section and luminosity   
C   
      CALL ISAEND   
#if !defined(HPZTST)
C          Fill Stdhep common block 1
      CALL STDFLISXSEC
C          Write Stdhep end-run record   
      CALL HEPWRT(200,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep end run record'
C          Write end-of-run record  
      CALL HEPWRT(204,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing end run record'
      ILOOP2 = ILOOP2 + ILOOP
#endif
      GO TO 201   
      END 
      SUBROUTINE TSTFLXS(IOFF,ILP)
C... fill histograms
#include "stdhep.inc"
#include "stdcm1.inc"

      INTEGER IOFF,ILP
      REAL BN

      BN = FLOAT(NEVHEP+ILP)+0.5
      CALL HFILL(IOFF+20,BN,0.,STDXSEC)
      RETURN
      END

