/*******************************************************************************
*									       *
* stdhep_internal_utils.c -- C version of stdhep internal utility routines     *
*									       *
* Copyright (c) 1995 Universities Research Association, Inc.		       *
* All rights reserved.							       *
* 									       *
* This material resulted from work developed under a Government Contract and   *
* is subject to the following license:  The Government retains a paid-up,      *
* nonexclusive, irrevocable worldwide license to reproduce, prepare derivative *
* works, perform publicly and display publicly by or for the Government,       *
* including the right to distribute to other Government contractors.  Neither  *
* the United States nor the United States Department of Energy, nor any of     *
* their employees, makes any warranty, express or implied, or assumes any      *
* legal liability or responsibility for the accuracy, completeness, or         *
* usefulness of any information, apparatus, product, or process disclosed, or  *
* represents that its use would not infringe privately owned rights.           *
*                                        				       *
*									       *
* Written by Lynn Garren    					       	       *
*									       *
*									       *
*******************************************************************************/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
/* 
*   StdHep definitions and include files
*/
#include "stdhep.h"
#include "stdtmp.h"

struct stdtmp stdtmp_;

int StdHepTempCopy(int idir)
{
    int nh, i, k;
    if (idir == 1) {
        stdtmp_.nevhept = hepevt_.nevhep;
        stdtmp_.nhept = hepevt_.nhep;
        for (i = 0; i < hepevt_.nhep; i++) {
            stdtmp_.isthept[i] = hepevt_.isthep[i];
            stdtmp_.idhept[i] = hepevt_.idhep[i];
            for (k = 0; k < 2; k++) {
                stdtmp_.jmohept[k][i] = hepevt_.jmohep[k][i];
                stdtmp_.jdahept[k][i] = hepevt_.jdahep[k][i];
                }
            for (k = 0; k < 5; k++)
                stdtmp_.phept[k][i] = hepevt_.phep[k][i];
            for (k = 0; k < 4; k++)
                stdtmp_.vhept[k][i] = hepevt_.vhep[k][i];
            }
        }
    else if (idir == 2) {
        if (hepevt_.nhep + stdtmp_.nhept > NMXHEP) {
            fprintf(stderr,
              "     StdHepTempCopy: event would overflow HEPEVT array size\n");
            fprintf(stderr,"     StdHepTempCopy: event %d has been lost\n",
                   stdtmp_.nevhept);
            return 5;
            }
        hepevt_.nevhep = stdtmp_.nevhept;
        nh = hepevt_.nhep;
        for (i = 0; i < stdtmp_.nhept; i++) {
            hepevt_.isthep[nh+i] = stdtmp_.isthept[i];
            hepevt_.idhep[nh+i] = stdtmp_.idhept[i];
            for (k = 0; k < 2; k++) {
                hepevt_.jmohep[k][nh+i] = stdtmp_.jmohept[k][i];
                hepevt_.jdahep[k][nh+i] = stdtmp_.jdahept[k][i];
                }
            for (k = 0; k < 5; k++)
                hepevt_.phep[k][nh+i] = stdtmp_.phept[k][i];
            for (k = 0; k < 4; k++)
                hepevt_.vhep[k][nh+i] = stdtmp_.vhept[k][i];
            }
        hepev2_.nmulti += 1;
        for (i = 0; i < stdtmp_.nhept; i++) {
            hepev2_.jmulti[nh+i] = hepev2_.nmulti;
            for (k = 0; k < 2; k++) {
                hepevt_.jmohep[k][nh+i] += hepevt_.nhep;
                hepevt_.jdahep[k][nh+i] += hepevt_.nhep;
                }
            }
        hepevt_.nhep += stdtmp_.nhept;
        }
    else 
        fprintf(stderr," StdHepTempCopy: improper calling flag\n");
    return 0;
}

void StdHepZero(void)
{
    int i, k;
    hepevt_.nhep = 0;
    hepev2_.nmulti = 0;
    for (i = 0; i < NMXHEP; i++) {
        hepevt_.isthep[i] = 0;
        hepevt_.idhep[i] = 0;
        hepev2_.jmulti[i] = 0;
        for (k = 0; k < 2; k++) {
            hepevt_.jmohep[k][i] = 0;
            hepevt_.jdahep[k][i] = 0;
            }
        for (k = 0; k < 5; k++)
            hepevt_.phep[k][i] = 0.;
        for (k = 0; k < 4; k++)
            hepevt_.vhep[k][i] = 0.;
        }
}
