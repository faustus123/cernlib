*
* $Id$
*
* $Log$
* Revision 1.1  1996/05/21 08:39:53  cernlib
* Initial revision
*
* Revision 1.2  1995/04/25  13:58:08  zfiles
* New variable XANGQQ and IDKMEC
*
* Revision 1.1  1994/10/07  23:57:40  zfiles
* New include files for QQ.
*
*
*CMZ :  1.02/61 03/10/94  17.34.24  by  Paul Avery
*CMZ :          08/10/93  10.27.51  by  Paul Avery
*>> Author :
*
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*                         QQTRAK.INC
*
*                     QQ generated tracks
*  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*
C   Contains the list of generated particles in an event and their decay
C   history. The vertex information is stored in QQVRTX.INC.
C
C   For unstable particles there are pointers which tell where in the list
C   the first daughter appears (IDAUTV) and how many daughters there are
C   (NDAUTV). Conversely, for each daughter there is a pointer which
C   tells which particle in the list is its parent (IPRNTV).
C
C   NTRKMC is the length of the list. If only QQ is run, then
C   NTRKMC = NTRKQQ. If a user so chooses, particles like pions,
C   kaons and muons can decay further and augment the particle list
C   (when particles decay they always put their decay products at
C   the end of the list) so that NTRKMC > NTRKQQ. Likewise,
C   NSTBMC >= NSTBQQ and NCHGMC >= NCHGQQ.
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-
*
*  NTRKMC              # particles in track list
*  NTRKQQ              # particles generated by QQ
*  NSTBMC              # stable particles in track list
*  NSTBQQ              # stable particles generated by QQ
*  NCHGMC              # charged stable particles in track list
*  NCHGQQ              # charged stable particles gen. by QQ
*
*  IPRNTV(IT)          Position of parent in track list
*  ITYPEV(IT,2)        ITYPEV(IT,1) = QQ particle ID code
*                      ITYPEV(IT,2) = QQ stable particle code
*  IDECSV(IT)          Decay channel of particle (0=no decay)
*  NDAUTV(IT)          # daughters of particle
*  IDAUTV(IT)          Position of first daughter in track list
*  IVPROD(IT)          Production vertex of particle
*  IVDECA(IT)          Decay vertex of particle (0 if stable)
*  ISTBMC(IT)          Position in stable particle list IDSTBL
*  IDKMEC(IT)          How particle is decayed (filled in CLEOG)
*  PSAV(IT,4)          4-momentum of particle
*  P4QQ(4,IT)          4-momentum with swapped indices (same as PSAV)
*  HELCQQ(IT)          Helicity of particle

      INTEGER IPRNTV, ITYPEV, IDECSV, IDAUTV
      INTEGER ISTBMC, NDAUTV, IDKMEC
      INTEGER IVPROD, IVDECA
      INTEGER NTRKMC, NTRKQQ, NSTBMC, NSTBQQ, NCHGMC, NCHGQQ
      COMMON/QQTRK1/
     *   NTRKMC, NTRKQQ, NSTBMC, NSTBQQ, NCHGMC, NCHGQQ,
     *   IPRNTV(MCTRK), ITYPEV(MCTRK,2),
     *   IDECSV(MCTRK), IDAUTV(MCTRK), NDAUTV(MCTRK),
     *   IVPROD(MCTRK), IVDECA(MCTRK), ISTBMC(MCTRK), IDKMEC(MCTRK)

      REAL PSAV, P4QQ, HELCQQ
      COMMON/QQTRK2/
     *   PSAV(MCTRK,4), P4QQ(4,MCTRK), HELCQQ(MCTRK)


C
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-
C   The stable particles in the full particle list have an entry in the
C   stable particle list IDSTBL (of length NSTBMC). IDSTBL and ISTBMC are
C   inverses of each other:
C    I = IDSTBL(J) ==> pos. in full track list of stable particle J
C    J = ISTBMC(I) ==> pos. in stable track list of particle I (0 if unstable)
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-
*
*  IDSTBL            Stable particle list (inverse of ISTBMC)
      INTEGER IDSTBL
      COMMON/QQTRK3/
     *   IDSTBL(MCSTAB)

C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-
C      The following equivalence statements allow people to use their
C   old Fortran code with minimum disruption.
C  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-
      INTEGER IFINAL(MCTRK), IFINSV(MCSTAB), NFINAL
      EQUIVALENCE (IFINAL,ISTBMC), (IFINSV,IDSTBL), (NFINAL,NSTBMC)

