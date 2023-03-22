*
* $Id$
*
* $Log$
* Revision 1.1  1996/02/26 17:16:45  mclareni
* Initial revision
*
*
#include "sys/CERNLIB_machine.h"
#include "_comis/pilot.h"
#if defined(CERNLIB_NEVER)
/*CMZ :  1.18/02 13/04/94  17.40.58  by  Fons Rademakers*/
/*-- Author :    Vladimir Berezhnoi   30/03/94*/
cc -c -g -DAIX hlshl.c
xlf -qextname -bE:aintimp.o -qrndsngl -qcharlen=32767 -g -o $1  $1.f hlshl.o \
libdl.a -L$PWD /cern/pro/lib/libkernlib.a
chmod +x $1
#endif
