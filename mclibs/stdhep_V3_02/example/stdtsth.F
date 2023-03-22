      PROGRAM TSTHWG
C
C      test program
C      compare event list in herwig and standard structure
#include "herwig.inc"
#include "stdlun.inc"
#if defined(HPZTST)&&defined(UNIX)
#include "quest.inc"
      INTEGER IQUEST,IERR
#endif

      EXTERNAL HWUDAT
C... include this because output is unit 6
      external iucomp
      INTEGER N,LOK
C
C initialize HEP logical units
      LNHWRT=23
      LNHRD=0
      LNHDCY=0
      LNHOUT=6
#if defined(HPZTST)
      OPEN(UNIT=LNHOUT,FILE='stdtsthz.lpt',STATUS='NEW')
      CALL HEPZINIT
#else
      OPEN(UNIT=LNHOUT,FILE='stdtsth.lpt',STATUS='NEW')
      OPEN(UNIT=LNHWRT,FILE='stdtsth.io',STATUS='NEW',
     1          FORM='UNFORMATTED')
#endif
#if defined(HPZTST)
#if defined(UNIX)
      CALL CFOPEN(IQUEST(1),0,900,'w',2,'stdtsthz.fz',IERR)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XLO')
#else
      OPEN(UNIT=LNHWRT,FILE='stdtsthz.fz',STATUS='NEW',
     1       RECORDTYPE='FIXED',FORM='UNFORMATTED',RECL=900,
     2       BLOCKSIZE=3600)
C...setup output file
      CALL FZFILE(LNHWRT,0,'XO')
#endif
#endif
#if defined(HEPDBG)&&defined(HPZTST)
      CALL FZLOGL(LNHWRT,3)
#endif
      CALL TSTBKEM(0)
C
      CALL HPTRLSTH
C---max number of events this run
      MAXEV=20
C---process
      IPROC=1500
C---beams
      PBEAM1=900.
      PBEAM2=900.
      PART1='PBAR'
      PART2='P   '
C---initialise other common blocks
      CALL HWIGIN
C---user can reset parameters at this point,
C   otherwise values set in HWIGIN will be used.
      LRSUD=0
      LWSUD=0
      MAXPR=1
      NRN(1)=106645411
      NRN(2)=135135175
      MAXER=100
      TLOUT=15.
      PTMIN=10.
      PTMAX=80.
      EMMIN=40.
      EMMAX=80.
      Q2MIN=1600.
      Q2MAX=3600.
C---HIGGS mass
      RMASS(201)=400.
C---compute parameter-dependent constants
      IPRINT = 2
      CALL HWUINC
      IPRINT = 1
C---call HWUSTA to make any particle stable
      CALL HWUSTA('PI0 ')
C---user's initial calculations
      CALL HWABEG
C---initialise elementary process
      CALL HWEINI
#if !defined(HPZTST)
C          Fill Stdhep common block 1
        CALL STDFLHWXSEC
C          Write Stdhep begin-run record   
        CALL HEPWRT(100,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep begin run record'
C          Write Herwig begin-run record   
        CALL HEPWRT(103,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*) ' Problem writing begin run record'
#endif
C---loop over events
      DO 100 N=1,MAXEV
C---initialise event
        CALL HWUINE
C---generate hard subprocess
        CALL HWEPRO
C---generate parton cascades
        CALL HWBGEN
C---do heavy quark decays
        CALL HWDHQK
C---do cluster hadronization
        CALL HWCFOR
C---do cluster decay
        CALL HWCDEC
C---do unstable particle decays
        CALL HWDHAD
C---do heavy flavour decays
        CALL HWDHVY
C---add soft underlying event if needed
        CALL HWMEVT
C---finalise event
        CALL HWUFNE
C---user's event analysis
        CALL HWGHEP(1)
        CALL HWANAL
        IF(NEVHEP.LE.MAXPR) THEN
          CALL HEPLST(1)
          CALL HEPTREE
        ENDIF
        CALL TSTFLEM(0)
#if defined(HPZTST)
        CALL HEPZWRT(LOK)
#else
        CALL HEPWRT(1,LOK)
C          Fill Stdhep common block 1
        CALL STDFLHWXSEC
        CALL TSTFLXSEC(0)
#endif
  100 CONTINUE
C---terminate elementary process
      CALL HWEFIN
C---user's terminal calculations
      CALL HWAEND
#if defined(HPZTST)
C... close zebra file
      CALL FZENDO(LNHWRT,'ET')
#else
C          Fill Stdhep common block 1
        CALL STDFLHWXSEC
C          Write Stdhep end-run record   
        CALL HEPWRT(200,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*)
     1        ' Problem writing stdhep end run record'
C          Write end-of-run record  
        CALL HEPWRT(203,LOK)
        IF(LOK.NE.0) WRITE(LNHOUT,*)
     1       ' Problem writing Herwig end run record'
#endif
C...print histograms
      CALL HOUTPU(LNHOUT)
      CALL HISTDO
      CLOSE(UNIT=LNHOUT)
      CLOSE(UNIT=LNHWRT)
      STOP
      END
C----------------------------------------------------------------------
      SUBROUTINE HWABEG
C     USER'S ROUTINE FOR INITIALIZATION
  999 END
      SUBROUTINE HWAEND
C     USER'S ROUTINE FOR TERMINAL CALCULATIONS, HISTOGRAM OUTPUT, ETC
  999 END
      SUBROUTINE HWANAL
C     USER'S ROUTINE TO ANALYSE DATA FROM EVENT
  999 END
C----------------------------------------------------------------------

