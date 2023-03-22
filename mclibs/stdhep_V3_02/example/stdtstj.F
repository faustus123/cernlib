      PROGRAM TSTJET
C
C      test program
C      compare event list in jetset and standard structure
C
#include "ludat1.inc"
#include "stdlun.inc"
#if defined(HPZTST)&&defined(UNIX)
#include "quest.inc"
      INTEGER IQUEST,IERR
#endif
#ifdef MCFIOT
      integer istr
#endif

      INTEGER NEVT,I,NPRNT,LOK
      EXTERNAL LUDATA
C
      NEVT=100
      NPRNT=1
C initialize HEP logical units
      LNHWRT=23
      LNHRD=0
      LNHDCY=0
      LNHOUT=22
      MSTU(11)=LNHOUT
#ifdef HPZTST
      OPEN(UNIT=LNHOUT,FILE='stdtstjz.lpt',STATUS='NEW')
      CALL HEPZINIT
#ifdef UNIX
      CALL CFOPEN(IQUEST(1),0,900,'w',2,'stdtstjz.fz',IERR)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XLO')
#else
      OPEN(UNIT=LNHWRT,FILE='stdtstjz.fz',STATUS='NEW',
     1     RECORDTYPE='FIXED',FORM='UNFORMATTED',RECL=900,BLOCKSIZE=3600)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XO')
#endif
#endif
#ifdef MCFIOT
      OPEN(UNIT=LNHOUT,FILE='stdtstjx.lpt',STATUS='NEW')
      call stdxwinit('stdtstjx.io','STDHEP/Jetset example',
     1               NEVT,istr,LOK)
      call mcfio_FPrintDictionary(LNHOUT)
#endif
#if (!defined(MCFIOT))&&(!defined(HPZTST))
      OPEN(UNIT=LNHOUT,FILE='stdtstj.lpt',STATUS='NEW')
      OPEN(UNIT=LNHWRT,FILE='stdtstj.io',STATUS='NEW',
     1     FORM='UNFORMATTED')
#endif
C
#if defined(HEPDBG)&&defined(HPZTST)
      CALL FZLOGL(LNHWRT,3)
#endif
      CALL TSTBKEM(20)
C... this I/O call will fail - no event generated yet
#ifdef HPZTST
      CALL HEPZWRT(LOK)
#endif
#if (!defined(MCFIOT))&&(!defined(HPZTST))
      CALL HEPWRT(1,LOK)
#endif
      CALL HPTRLSTJ
#ifdef MCFIOT
C          Write begin-run record   
      call stdxwrt(100,istr,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing begin run record'
#endif
#if (!defined(MCFIOT))&&(!defined(HPZTST))
C          Write begin-run record   
        CALL HEPWRT(101,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing begin run record'
#endif
C
      DO 100 I=1,NEVT
        CALL LU2ENT(0.,2,-2,20.)
        CALL LUNHEP(1)
        IF(I.LE.NPRNT)THEN
          CALL LULIST(2)
          CALL HEPLST(1)
          CALL HEPTREE
        ENDIF
        CALL TSTFLEM(20)
#ifdef HPZTST
        CALL HEPZWRT(LOK)
#endif
#ifdef MCFIOT
        call stdxwrt(1,istr,LOK)
#endif
#if (!defined(MCFIOT))&&(!defined(HPZTST))
        CALL HEPWRT(1,LOK)
#endif
 100  CONTINUE
C
#ifdef HPZTST
C... close zebra file
      CALL FZENDO(LNHWRT,'ET')
#endif
#ifdef MCFIOT
C          Write end-of-run record  
      call stdxwrt(200,istr,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing end run record'
#endif
#if (!defined(MCFIOT))&&(!defined(HPZTST))
C          Write end-of-run record  
        CALL HEPWRT(201,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing end run record'
#endif
c...close event file
#ifdef MCFIOT
      call stdxend(istr)
#else
      CLOSE(UNIT=LNHWRT)
#endif
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
c...close output file
      CLOSE(UNIT=LNHOUT)
      STOP
      END

