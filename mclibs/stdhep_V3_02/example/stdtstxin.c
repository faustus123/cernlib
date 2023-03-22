/*         test C binding to stdhep xdr interface       */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stdhep.h"
#include "stdlun.h"
#include "stdcnt.h"

void main(void)
{
    int ierr, i, lbl;
    int istr = 0;
    int nevt = 50;
    char filein[80];

    strcpy(filein,"stdtstx.io\0");
    ierr = StdHepXdrReadInit(filein, nevt, istr);
    for (i = 0; i < nevt; i++) {
        ierr = StdHepXdrRead(&lbl,istr);
        if (ierr == 0)
            printf(" at event %d with %d particles\n",
                     hepevt_.nevhep, hepevt_.nhep);
        else {
            printf(" unexpected end of file after %d events\n",i);
            exit(0);
            }
    }
    printf(" %d events read\n",i);
    StdHepXdrEnd(istr);
}
