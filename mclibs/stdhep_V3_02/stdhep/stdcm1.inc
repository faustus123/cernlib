C -------------------------------------------------------------
C
C   STDECOM  - center-of-mass energy
C   STDXSEC  - cross-section
C   STDSEED1 - random number seed
C   STDSEED2 - random number seed
C   NEVTREQ  - number of events to be generated
C   NEVTGEN  - number of events actually generated
C   NEVTWRT  - number of events written to output file
C
      real STDECOM,STDXSEC
      double precision STDSEED1,STDSEED2
      integer NEVTREQ,NEVTGEN,NEVTWRT
      common /STDCM1/ STDECOM,STDXSEC,STDSEED1,STDSEED2,
     1                NEVTREQ,NEVTGEN,NEVTWRT
      save /STDCM1/
C
C -------------------------------------------------------------
