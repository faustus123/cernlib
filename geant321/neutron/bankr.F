*
* $Id$
*
* $Log$
* Revision 1.1  1995/10/24 10:21:53  cernlib
* Initial revision
*
*
#include "geant321/pilot.h"
*CMZ :  3.21/02 29/03/94  15.41.48  by  S.Giani
*-- Author :
      SUBROUTINE BANKR(D,LD,NBNKID)
C       THIS IS A DUMMY ROUTINE USUALLY SUPPLIED BY THE USER TO
C       OBTAIN FURTHER ANALYSIS OF THE PROBLEM DEPENDING ON THE
C       VALUE ASSIGNED TO NBNKID.
#include "geant321/minput.inc"
#include "geant321/mconst.inc"
#include "geant321/mpoint.inc"
#include "geant321/mapoll.inc"
#include "geant321/mrecoi.inc"
#include "geant321/mgamma.inc"
#include "geant321/mmass.inc"
      DIMENSION D(*),LD(*)
      NBNK=NBNKID
   10 GO TO (20,30,40,50,60,70,80,90,100,110,120,130,140),NBNKID
C       SOURCES GENERATED
   20 RETURN
C       SPLITTINGS OCCURRING
   30 RETURN
C       FISSIONS OCCURRING
   40 RETURN
C       GAMMA RAYS GENERATED
   50 RETURN
C       REAL COLLISIONS
   60 RETURN
C       ALBEDO SCATTERINGS
   70 RETURN
   80 RETURN
   90 RETURN
C       ENERGY CUTOFFS
  100 RETURN
C       TIME CUTOFFS
  110 RETURN
C       RUSSIAN ROULETTE KILLS
  120 RETURN
C       RUSSIAN ROULETTE SURVIVORS
  130 RETURN
C       GAMMA RAYS NOT STORED BECAUSE BANK WAS FULL
  140 RETURN
      END
