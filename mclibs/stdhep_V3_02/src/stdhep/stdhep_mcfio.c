/*******************************************************************************
*									       *
* stdhep_mcfio.c -- C version of mcfio interface routines                      *
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
#include <rpc/types.h>
#include <rpc/xdr.h>
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
/* 
*   mcfio/StdHep definitions and include files
*/
#include "mcfio_Dict.h"
#include "stdhep.h"
#include "stdcnt.h"
#include "stdlun.h"

struct hepevt hepevt_;
struct hepev2 hepev2_;
struct stdcnt stdcnt_;
struct heplun heplun_;
struct stdstr stdstr_;

extern int xdr_stdhep_();
extern int xdr_stdhep_multi_();
extern int xdr_stdhep_cm1_();

int StdHepXdrReadInit(char *filename, int ntries, int ist)
{
    int ierr;
    
    mcfioC_Init();
    ierr = StdHepXdrReadOpen(filename, ntries, ist);
    return ierr;
}
int StdHepXdrReadOpen(char *filename, int ntries, int ist)
{
    int istream;
    char* date[80], title[255], comment[255];
    int dlen, tlen, clen;
    int numblocks, blkids[50];

    istream =  mcfioC_OpenReadDirect(filename);
    stdstr_.ixdrstr[ist] = istream;
    if (istream == -1) {
        fprintf(stderr," StdHepXdrReadOpen: cannot open output file \n");
        return -1;
        }
    mcfioC_InfoStreamChar(istream, MCFIO_CREATIONDATE, date, &dlen);
    mcfioC_InfoStreamChar(istream, MCFIO_TITLE, title, &tlen);
    mcfioC_InfoStreamChar(istream, MCFIO_COMMENT, comment, &clen);
    mcfioC_InfoStreamInt(istream, MCFIO_NUMEVTS, &ntries);
    mcfioC_InfoStreamInt(istream, MCFIO_NUMBLOCKS, &numblocks);
    mcfioC_InfoStreamInt(istream, MCFIO_BLOCKIDS, blkids);
    stdcnt_.nstdrd = 0;
    fprintf(stdout,
       " StdHepXdrReadOpen: successfully opened input stream %d\n",istream);
    fprintf(stdout,"          title: %s\n",title);
    fprintf(stdout,"          date: %s\n",date);
    fprintf(stdout,"                    %d events\n",ntries);
    fprintf(stdout,"                    %d blocks per event\n",numblocks);
    return 0;
}
int StdHepXdrRead(int *ilbl, int ist)
{
/* Purpose: to read a buffer or an event from the standard common block.
C
C       returns ilbl
C
C		ilbl = 1   - standard HEPEVT common block
C		ilbl = 2   - standard HEPEVT common block and HEPEV2
C		ilbl = 100 - STDHEP begin run record
C		ilbl = 200 - STDHEP end run record
C   */

    int istat;
    int istream;
    int i, numblocks, blkids[50];

    istream = stdstr_.ixdrstr[ist];
    if(mcfioC_NextEvent(istream) != MCFIO_RUNNING) {
        mcfioC_InfoStreamInt(istream, MCFIO_STATUS, &istat);
        if(istat == MCFIO_EOF) {
            fprintf(stderr,"     StdHepXdrRead: end of file found\n");
            return 1;
            }
        else {
            fprintf(stderr,"     StdHepXdrRead: unrecognized status - stop\n");
            return 2;
            }
        }
    mcfioC_InfoStreamInt(istream, MCFIO_NUMBLOCKS, &numblocks);
    mcfioC_InfoStreamInt(istream, MCFIO_BLOCKIDS, blkids);
    for (i = 0; i < numblocks; i++) {
        if (blkids[i] == MCFIO_STDHEP) {
            StdHepZero();
            if (mcfioC_Block(istream,MCFIO_STDHEP,xdr_stdhep_) != -1) {
                *ilbl = 1;
                if (StdHepTempCopy(2) == 0)
                    stdcnt_.nstdrd = stdcnt_.nstdrd + 1;
                return 0;
                }
            }
        else if (blkids[i] == MCFIO_STDHEPM) {
            StdHepZero();
            if (mcfioC_Block(istream,MCFIO_STDHEPM,xdr_stdhep_multi_) != -1) {
                *ilbl = 2;
                stdcnt_.nstdrd = stdcnt_.nstdrd + 1;
                return 0;
                }
            }
        else if (blkids[i] == MCFIO_STDHEPBEG) {
            if (mcfioC_Block(istream,MCFIO_STDHEPBEG,xdr_stdhep_cm1_) != -1) {
                *ilbl = 100;
                return 0;
                }
            }
        else if (blkids[i] == MCFIO_STDHEPEND) {
            if (mcfioC_Block(istream,MCFIO_STDHEPEND,xdr_stdhep_cm1_) != -1) {
                *ilbl = 200;
                return 0;
                }
            }
        }
    return 1;
}
int StdHepXdrReadMulti(int *ilbl, int ist)
{
/* Purpose: to read a buffer or an event from the standard common block
            this routine handles multiple input streams
C
C       return ilbl
C
C		ilbl = 1   - standard HEPEVT common block
C		ilbl = 2   - standard HEPEVT common block and HEPEV2
C		ilbl = 100 - STDHEP begin run record
C		ilbl = 200 - STDHEP end run record
C   */

    int istat;
    int istream;
    int i, numblocks, blkids[50];

    istream = stdstr_.ixdrstr[ist];
    if(mcfioC_NextEvent(istream) != MCFIO_RUNNING) {
        mcfioC_InfoStreamInt(istream, MCFIO_STATUS, &istat);
        if(istat == MCFIO_EOF) {
            fprintf(stderr,"     StdHepXdrReadMulti: end of file found\n");
            return 1;
            }
        else {
            fprintf(stderr,
              "     StdHepXdrReadMulti: unrecognized status - stop\n");
            return 2;
            }
        }
    mcfioC_InfoStreamInt(istream, MCFIO_NUMBLOCKS, &numblocks);
    mcfioC_InfoStreamInt(istream, MCFIO_BLOCKIDS, blkids);
    for (i = 0; i < numblocks; i++) {
        if (blkids[i] == MCFIO_STDHEP) {
           if (mcfioC_Block(istream,MCFIO_STDHEP,xdr_stdhep_) == -1) {
                fprintf(stderr,
                  "     StdHepXdrReadMulti: unable to read xdr block\n");
                return 1;
                }
            *ilbl = 1;
            if (StdHepTempCopy(2) == 0)
                stdcnt_.nstdrd = stdcnt_.nstdrd + 1;
            }
        else if (blkids[i] == MCFIO_STDHEPM) {
            fprintf(stderr,
          "    StdHepXdrRead: multiple interaction event - HEPEVT is zeroed\n");
            StdHepZero();
            if (mcfioC_Block(istream,MCFIO_STDHEPM,xdr_stdhep_multi_) == -1) {
                fprintf(stderr,
                  "     StdHepXdrReadMulti: unable to read xdr block\n");
                return 1;
                }
            *ilbl = 2;
            stdcnt_.nstdrd = stdcnt_.nstdrd + 1;
            }
        }
    return 0;
}
int StdHepXdrWriteInit(char *filename, char *title, int ntries, int ist)
{
    int ierr;

    mcfioC_Init();
    ierr = StdHepXdrWriteOpen(filename, title, ntries, ist);
    return ierr;
}
int StdHepXdrWriteOpen(char *filename, char *title, int ntries, int ist)
{
    int istream;
    int numblocks = 4;
    int blkids[50];
    char *comment = '\0';

    blkids[0] = MCFIO_STDHEP;
    blkids[1] = MCFIO_STDHEPM;
    blkids[2] = MCFIO_STDHEPBEG;
    blkids[3] = MCFIO_STDHEPEND;
    istream =  mcfioC_OpenWriteDirect(filename, title, comment,
                    ntries, blkids, numblocks);
    stdstr_.ixdrstr[ist] = istream;
    if (istream == -1) {
        fprintf(stderr," StdHepXdrWriteOpen: cannot open output file \n");
        return -1;
        }
    fprintf(stdout," StdHepXdrWriteOpen: I/O initialized for StdHep only\n");
    return 0;
}
int StdHepXdrWrite(int ilbl, int ist)
{
    int iret = 0;

    if ((ilbl == 1) || (ilbl == 2))
        iret = StdHepXdrWriteEvent(ilbl, ist);
    else if ((ilbl == 100) || (ilbl == 200))
        iret = StdHepXdrWriteCM(ilbl, ist);
    else
        fprintf(stderr,
      "     StdHepXdrWrite: don't know what to do with record type %d\n", ilbl);
    return iret;
}
int StdHepXdrWriteCM(int ilbl, int ist)
{
    int istream;

    istream = stdstr_.ixdrstr[ist];
    if (ilbl == 100) {
        if (mcfioC_Block(istream, MCFIO_STDHEPBEG, xdr_stdhep_cm1_) == -1) {
            fprintf(stderr,
              "     StdHepXdrWriteCM: error filling stdhep cm1 common block\n");
            return 2;
            }
        }
    else if (ilbl == 200) {
        if (mcfioC_Block(istream, MCFIO_STDHEPEND, xdr_stdhep_cm1_) == -1) {
            fprintf(stderr,
              "     StdHepXdrWriteCM: error filling stdhep cm1 common block\n");
            return 2;
            }
        }
    else {
        fprintf(stderr,
           "     StdHepXdrWriteCM: called with improper label %d\n",ilbl);
        return 3;
        }
    if (mcfioC_NextEvent(istream) == -1) {
        fprintf(stderr,
          "     StdHepXdrWriteCM: error writing stdhep cm1 xdr block\n");
        return 1;
        }
    return 0;
}
int StdHepXdrWriteEvent(int ilbl, int ist)
{
    int istream;

    istream = stdstr_.ixdrstr[ist];
    if ((ilbl != 1) && (ilbl != 2)) {
        fprintf(stderr,
          "     StdHepXdrWriteEvent: called with illegal label %d\n",
                            ilbl);
        return 3;
        }
    else if (hepevt_.nhep <= 0) {
        fprintf(stderr,
          "     StdHepXdrWriteEvent: event %d is empty\n", hepevt_.nevhep);
        return 0;
        }
    else if (ilbl == 1) {
        if (StdHepTempCopy(1) != 0) {
            fprintf(stderr,
              "     StdHepXdrWriteEvent: copy failed - event not written\n");
            return 4;
            }
        if (mcfioC_Block(istream, MCFIO_STDHEP, xdr_stdhep_) == -1) {
            fprintf(stderr,
          "     StdHepXdrWriteEvent: error filling stdhep block for event %d\n",
                     hepevt_.nevhep);
            return 2;
            }
        mcfioC_SetEventInfo(istream, MCFIO_STORENUMBER, &hepevt_.nevhep);
        }
    else if (ilbl == 2) {
        if (mcfioC_Block(istream, MCFIO_STDHEPM, xdr_stdhep_multi_) == -1) {
            fprintf(stderr,
          "     StdHepXdrWriteEvent: error filling stdhep block for event %d\n",
                     hepevt_.nevhep);
            return 2;
            }
        mcfioC_SetEventInfo(istream, MCFIO_STORENUMBER, &hepevt_.nevhep);
        }
    if (mcfioC_NextEvent(istream) == -1) {
        fprintf(stderr,"     StdHepXdrWriteCM: error writing event %d\n",
                         hepevt_.nevhep);
        return 1;
        }
    stdcnt_.nstdwrt = stdcnt_.nstdwrt + 1;
    return 0;
}
void StdHepXdrEnd(int ist)
{
    int istream;
    int inum, ieff;

    istream = stdstr_.ixdrstr[ist];
    mcfioC_InfoStreamInt(istream, MCFIO_NUMWORDS, &inum);
    mcfioC_InfoStreamInt(istream, MCFIO_EFFICIENCY, &ieff);
    mcfioC_Close(istream);
    fprintf(stdout,
       "          StdHepXdrEnd: %d words i/o with %d efficiency\n",inum,ieff);
}
