/*         test C binding to stdhep xdr interface       */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "stdhep.h"
#include "stdlun.h"
#include "stdcnt.h"

void fill_stdhep(int i);

void main(void)
{
    int ierr, i;
    int istr = 0;
    int nevt = 50;
    char fileout[80], title[100];

    strcpy(fileout,"stdtstx.io\0");
    strcpy(title,"test the c interface \0");
    ierr = StdHepXdrWriteInit(fileout, title, nevt, istr);
    for (i = 0; i < nevt; i++) {
        fill_stdhep(i+1);
        ierr = StdHepXdrWrite(1,istr);
        if (ierr == 0)
            printf(" at event %d with %d particles\n",
                     hepevt_.nevhep, hepevt_.nhep);
    }
    printf(" %d events written\n",i);
    StdHepXdrEnd(istr);
}

void fill_stdhep(int i)
{
    int j, k, num;

    num = i * 20;
    hepevt_.nevhep = i;
    hepevt_.nhep = num;
    for (j = 0; j < num; j++) {
        hepevt_.idhep[j] = 211;
        hepevt_.isthep[j] = 1;
        for (k = 0; k < num; k++) {
            hepevt_.jmohep[k][j] = j - 1;
            hepevt_.jdahep[k][j] = j + 1;
            }
        for (k = 0; k < num; k++)
            hepevt_.phep[k][j] = 10.2 * k;
        for (k = 0; k < num; k++)
            hepevt_.vhep[k][j] = .0001;
        }
}
