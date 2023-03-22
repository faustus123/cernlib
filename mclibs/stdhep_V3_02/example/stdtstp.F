      PROGRAM TSTPYT
C
C      test program for stdhep/pythia interface
C      compare event list
C      write events and cross-section
C      this is a non-zebra example
C
#include "stdlun.inc"

#ifdef MCFIOT
      integer istr
#endif
      INTEGER NEVT,I,NPRNT,LOK
      EXTERNAL LUDATA,PYDATA
C
      NEVT=100
      NPRNT=1
#ifdef MCFIOT   
      CALL UPYINIT(NEVT,istr)
#else
      CALL UPYINIT
#endif

C          Fill Stdhep common block 1 (only valid for Pythia)
      CALL STDFLPYXSEC(NEVT)
C          Write Stdhep begin-run record   
#ifdef MCFIOT   
      call stdxwrt(100,istr,LOK)
#else
      CALL HEPWRT(100,LOK)
#endif
      IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep begin run record'
#if !defined(MCFIOT)
C          Write begin-run record   
      CALL HEPWRT(101,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing begin run record'
#endif
C
      DO 100 I=1,NEVT
        CALL PYEVNT
        CALL LUNHEP(1)
        IF(I.LE.NPRNT)THEN
          CALL LULIST(2)
          CALL HEPLST(1)
        ENDIF
        CALL PYTFLEM(1,I)
#ifdef MCFIOT
        call stdxwrt(1,istr,LOK)
#else
         CALL HEPWRT(1,LOK)
#endif
C          Fill Stdhep common block 1 (only valid for Pythia)
        CALL STDFLPYXSEC(NEVT)
        CALL PYTFLEM(2,I)
 100  CONTINUE
C
C          Fill Stdhep common block 1
      CALL STDFLPYXSEC(NEVT)
#ifdef MCFIOT
C          Write end-of-run record  
      call stdxwrt(200,istr,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing end run record'
#else

C          Write Stdhep end-run record   
      CALL HEPWRT(200,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep end run record'
C          Write end-of-run record  
      CALL HEPWRT(201,LOK)
      IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing end run record'
#endif

C...   Print end of run statistics.
      CALL PYSTAT(MSTAT)

c...close event file
#ifdef MCFIOT
      call stdxend(istr)
#else
      CLOSE(UNIT=LNHWRT)
#endif
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
      CLOSE(UNIT=LNHOUT)
      STOP
      END

#ifdef MCFIOT
      SUBROUTINE UPYINIT(NEVT,istr)
#else
      SUBROUTINE UPYINIT
#endif
C
C   Pythia initialization
C
#include "ludat1.inc"
#include "stdlun.inc"

C...   PYTHIA initialization variables.
      CHARACTER*4 FRAME
      CHARACTER*5 BEAM,TARGET
      integer NEVT,istr
      REAL WIN
C
C initialize HEP logical units
      LNHWRT=23
      LNHRD=0
      LNHDCY=0
      LNHOUT=22
      MSTU(11)=LNHOUT
#ifdef MCFIOT
      OPEN(UNIT=LNHOUT,FILE='stdtstpx.lpt',STATUS='NEW')
      call stdxwinit('stdtstpx.io','STDHEP/Pythia example',
     1               NEVT,istr,LOK)
#else
      OPEN(UNIT=LNHOUT,FILE='stdtstp.lpt',STATUS='NEW')
      OPEN(UNIT=LNHWRT,FILE='stdtstp.io',STATUS='NEW',
     1     FORM='UNFORMATTED')
#endif
C
      CALL PYTBKEM
C
C...   Initialize PYTHIA
      FRAME  = 'CMS'
      BEAM   = 'PBAR'
      TARGET = 'P'
      WIN    = 1800.0
      CALL PYGIVE('MSEL=5')
      CALL PYGIVE('MSTJ(21)=0')
      CALL PYINIT(FRAME,BEAM,TARGET,WIN)

      RETURN
      END

      SUBROUTINE PYTFLEM(IBLK,IEV)
C... fill histograms
C   STDXSEC  - cross-section
C
#include "stdhep.inc"
#include "stdcm1.inc"

      INTEGER IBLK,I,IEV
      REAL BN

      IF(IBLK.EQ.1)THEN
        CALL HFILL(1,FLOAT(NEVHEP),0.,1.)
        CALL HFILL(2,FLOAT(NHEP),0.,1.)
        DO I=1,NHEP
          CALL HFILL(3,FLOAT(IDHEP(I)),0.,1.)
          CALL HFILL(4,FLOAT(ISTHEP(I)),0.,1.)
          CALL HFILL(5,SNGL(PHEP(1,I)),0.,1.)
          CALL HFILL(6,SNGL(PHEP(2,I)),0.,1.)
          CALL HFILL(7,SNGL(PHEP(3,I)),0.,1.)
          CALL HFILL(8,SNGL(PHEP(4,I)),0.,1.)
          CALL HFILL(9,SNGL(PHEP(5,I)),0.,1.)
        ENDDO
      ELSEIF(IBLK.EQ.2)THEN
        BN = FLOAT(IEV)+0.5
        CALL HFILL(10,BN,0.,STDXSEC)
      ENDIF
      RETURN
      END
      SUBROUTINE PYTBKEM
C--- book histograms
C
      IMPLICIT NONE
C---   The HBOOK common
      REAL HMEMOR
      COMMON/PAWC/HMEMOR(50000)
C---   Setup the HBOOK memory limit.
      CALL HLIMIT(50000)
C---   Book histograms.
      CALL HBOOK1(1,'PYTHIA: NEVHEP',100,0.,100.,0.)
      CALL HBOOK1(2,'PYTHIA: NHEP',100,0.,200.,0.)
      CALL HBOOK1(3,'PYTHIA: IDHEP',100,0.,100.,0.)
      CALL HBOOK1(4,'PYTHIA: ISTHEP',20,0.,20.,0.)
      CALL HBOOK1(5,'PYTHIA: PHEP(1,)',100,-100.,100.,0.)
      CALL HBOOK1(6,'PYTHIA: PHEP(2,)',100,-100.,100.,0.)
      CALL HBOOK1(7,'PYTHIA: PHEP(3,)',100,-100.,100.,0.)
      CALL HBOOK1(8,'PYTHIA: PHEP(4,)',100,-100.,100.,0.)
      CALL HBOOK1(9,'PYTHIA: PHEP(5,)',100,-100.,100.,0.)
      CALL HBOOK1(10,'STDHEP: cross-section',100,0.,100.,0.)
      RETURN
      END

