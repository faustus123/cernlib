/*******************************************************************************
*									       *
* mcf_evt_xdr.c -- XDR Utility routines for the McFast Monte-Carlo             *
*									       *
* Copyright (c) 1994 Universities Research Association, Inc.		       *
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
* Written by Paul Lebrun						       *
*									       *
*									       *
*******************************************************************************/
#include <stdio.h>
#include <string.h>
#include <sys/param.h>
#include <rpc/types.h>
#include <sys/types.h>
#include <rpc/xdr.h>
#include <limits.h>
#ifdef SUNOS
#include <floatingpoint.h>
#else /* SUNOS */
#include <float.h>
#endif /* SUNOS */
#include <stdlib.h>
#include <time.h>
#include "mcf_xdr.h"
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif




bool_t xdr_mcfast_generic(XDR *xdrs, int *blockid,
 				 int *ntot, char** version, char** data)
{
/*  Translate a Generic mcfFast block. This module will allocate memory 
    for the data. */
        
    unsigned int nn;
    
    if (xdrs->x_op == XDR_ENCODE) {
      nn = strlen(*data);  
      *ntot = 12+nn;
       strcpy(*version, "0.00");
       } else if (xdrs->x_op == XDR_FREE) {
          free(*data);
          return 1;
       }
      
     if (( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH)) 
     	         == FALSE) return FALSE;
     nn = *ntot - 12;	      
     if (xdrs->x_op == XDR_DECODE) *data = NULL; 
     return (xdr_string(xdrs, data, nn));     	
}   


bool_t xdr_mcfast_headerBlock(XDR *xdrs, int *blockid,
 				 int *ntot, char** version)
{
/*  Translate a Generic mcfFast block. This module will allocate memory 
    for the data. */
        
    unsigned int nn;
    
    if (xdrs->x_op == XDR_ENCODE) {
       printf ("xdr_mcfast_headerBlock: Internal error \n");
       return FALSE;
       }
      
     return ( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH));
}   
bool_t xdr_mcfast_fileheader(XDR *xdrs, int *blockid,
 		 int *ntot, char** version, mcfxdrFileHeader **mcf)
{
/*  Translate a mcf FileHeader block.  This subroutine will allocate
	the memory needed if the stream is DECODE */
        
    int i;
    unsigned int nn;
    char **ctmp;
    char *atmp, *btmp, *dtmp;
    int *itmp;
    bool_t ok;
    mcfxdrFileHeader *mcftmp;
    time_t clock;
    
    
    mcftmp = *mcf;
    if (xdrs->x_op == XDR_ENCODE) {
      *ntot = sizeof(mcfxdrFileHeader) - sizeof(int *) - sizeof(char **) 
              + 2 * sizeof(int) * mcftmp->nBlocks 
              - sizeof(char) * MCF_XDR_F_TITLE_LENGTH
              + sizeof(char) * strlen(mcftmp->title) + 
              + sizeof(char) * strlen(mcftmp->comment) ;
      for (i=0, ctmp = mcftmp->blockNames; 
             i< mcftmp->nBlocks; i++, ctmp++) *ntot += strlen(*ctmp);  
       strcpy(*version, "1.00");
       /* Put the current date/time in a string */
       time(&clock);
       strcpy(mcftmp->date, ctime(&clock));
     }  else if (xdrs->x_op == XDR_FREE) {
          mcfioC_Free_FileHeader(mcf);
          return 1;
     } else if((xdrs->x_op == XDR_DECODE) && (*mcf == NULL)) {
          mcftmp = (mcfxdrFileHeader *) malloc(sizeof(mcfxdrFileHeader));
          *mcf = mcftmp;
     } 
        

       
     if (( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH))
     	                  == FALSE) return FALSE;
     
     /*
     ** Code valid for version 1.00
     */
     if (strcmp(*version, "1.00") == 0) {
         atmp = &(mcftmp->title[0]);
         btmp = &(mcftmp->comment[0]);
         dtmp = &(mcftmp->date[0]);
     	      
        if ((xdr_string(xdrs, &atmp, MCF_XDR_F_TITLE_LENGTH) &&
             xdr_string(xdrs,&btmp, MCF_XDR_F_TITLE_LENGTH) &&
             xdr_string(xdrs,&dtmp, 30)) == FALSE) return FALSE;
	
        if ((xdr_u_int(xdrs,&(mcftmp->numevts_expect)) &&
             xdr_u_int(xdrs,&(mcftmp->numevts)) &&
             xdr_u_int(xdrs,&(mcftmp->firstTable)) &&
             xdr_u_int(xdrs,&(mcftmp->dimTable)) &&
             xdr_u_int(xdrs,&(mcftmp->nBlocks))) == FALSE) return FALSE;
        if(xdrs->x_op == XDR_DECODE) {
           mcftmp->blockIds = (int *) malloc(sizeof(int) * mcftmp->nBlocks);
           mcftmp->blockNames = 
           	(char**) malloc(sizeof(char *) * mcftmp->nBlocks);
           for (i=0; i<mcftmp->nBlocks; i++) 
                mcftmp->blockNames[i] =
                  (char *) malloc(sizeof(char) * (MCF_XDR_B_TITLE_LENGTH +1));
        }
        itmp = mcftmp->blockIds;
        if (xdrs->x_op == XDR_ENCODE) nn = mcftmp->nBlocks;
	if (xdr_array(xdrs, (char **) &itmp, &nn, 
	             mcftmp->nBlocks, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
	for (i=0; i<mcftmp->nBlocks; i++) {
	       if (xdr_string(xdrs, &(mcftmp->blockNames[i]), 
	               MCF_XDR_B_TITLE_LENGTH) == FALSE) return FALSE; 
	    }	              
	   
     } else return FALSE; /* Futur version encoded here. */
     return TRUE;
     	      
}   

bool_t xdr_mcfast_eventtable(XDR *xdrs, int *blockid,
 		 int *ntot, char** version, mcfxdrEventTable **mcf)
{
/*  Translate a mcf EventTable block.  This subroutine will allocate
	the memory needed if the stream is DECODE */
        
    int i, *idat;
    unsigned int nn, nnold, *uidat;
    char **ctmp;
    mcfxdrEventTable *mcftmp;
    
    
    mcftmp = *mcf;
    if (xdrs->x_op == XDR_ENCODE) {
      *ntot = sizeof(mcfxdrEventTable) + 4 * sizeof(int)* mcftmp->dim
              + sizeof(unsigned int)* mcftmp->dim - 2 * sizeof(int)
              - 4 * sizeof(int *) - sizeof(u_int *);
       strcpy(*version, "1.00");
     }  else if (xdrs->x_op == XDR_FREE) {
          mcfioC_Free_EventTable(mcf);
          return 1;
     } else if((xdrs->x_op == XDR_DECODE) && ( mcftmp == NULL)) {
          mcftmp = (mcfxdrEventTable *) malloc(sizeof(mcfxdrEventTable));
          *mcf = mcftmp;
     } 
        

       
     if (( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH)) 
     	                 == FALSE) return FALSE;
     
     /*
     ** Code valid for version 1.00
     */
     if (strcmp(*version, "1.00") == 0) {
     	      
        if((xdrs->x_op == XDR_DECODE) && (mcftmp->evtnums != NULL))
             nnold = mcftmp->previousnumevts;
          else nnold = 0;
        idat = &mcftmp->nextLocator;
        uidat = (u_int *) &mcftmp->numevts;  
        if ((xdr_int(xdrs,idat) && xdr_u_int(xdrs,uidat )) == FALSE)
                  return FALSE; 
        if(xdrs->x_op == XDR_DECODE) {
           if ((mcftmp->evtnums == NULL) || (mcftmp->numevts > nnold)) {
           if (mcftmp->evtnums != NULL) {
            /*
            ** I don't trust realloc.. just alloc again.. 
            */
            free(mcftmp->evtnums); free(mcftmp->storenums); 
            free(mcftmp->runnums); free(mcftmp->trigMasks);
            free(mcftmp->ptrEvents);
            }  
           mcftmp->evtnums = (int *) malloc(sizeof(int) * mcftmp->dim);
           mcftmp->storenums = (int *) malloc(sizeof(int) * mcftmp->dim);
           mcftmp->runnums = (int *) malloc(sizeof(int) * mcftmp->dim);
           mcftmp->trigMasks = (int *) malloc(sizeof(int) * mcftmp->dim);
           mcftmp->ptrEvents = 
            (unsigned int *) malloc(sizeof(unsigned int) * mcftmp->dim);
            mcftmp->previousnumevts = mcftmp->dim;
           }
        }
        if (xdrs->x_op == XDR_ENCODE) nn = mcftmp->dim;
        idat = mcftmp->evtnums;
	if (xdr_array(xdrs, (char **) &idat, &nn, 
	              mcftmp->dim, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
        idat = mcftmp->storenums;
	if (xdr_array(xdrs, (char **) &idat, &nn, 
	              mcftmp->dim, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
        idat = mcftmp->runnums;
	if (xdr_array(xdrs, (char **) &idat, &nn, 
	              mcftmp->dim, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
        idat = mcftmp->trigMasks;
	if (xdr_array(xdrs, (char **) &idat, &nn, 
	              mcftmp->dim, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
        uidat = mcftmp->ptrEvents;
	if (xdr_array(xdrs, (char **) &uidat, &nn, 
	              mcftmp->dim, sizeof(int), xdr_u_int) == FALSE) 
	              return FALSE;
     } else return FALSE; /* Future version encoded here. */
     return TRUE;
     	      
}
   
bool_t xdr_mcfast_seqheader(XDR *xdrs, int *blockid,
 		 int *ntot, char** version, mcfxdrSequentialHeader **mcf)
{
/*  Translate a mcf EventTable block.  This subroutine will allocate
	the memory needed if the stream is DECODE */
        
    int i;
    unsigned int nn;
    char **ctmp;
    mcfxdrSequentialHeader *mcftmp;
    
    
    if (xdrs->x_op == XDR_ENCODE) {
      mcftmp = *mcf;
      *ntot = sizeof(mcfxdrSequentialHeader);
       strcpy(*version, "1.00");
     }  else if (xdrs->x_op == XDR_FREE) {
          mcfioC_Free_SeqHeader(mcf);
          return 1;
     } else if(xdrs->x_op == XDR_DECODE) {
          if (*mcf == NULL) {
              mcftmp = (mcfxdrSequentialHeader *) 
                        malloc(sizeof(mcfxdrSequentialHeader));
              *mcf = mcftmp;
          } else mcftmp = *mcf;
          
     } 
        

       
/*     if (( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH)) 
     	                 == FALSE) return FALSE;
*/
      if (xdr_int(xdrs,blockid) == FALSE) return FALSE;
      if (xdr_int(xdrs,ntot) == FALSE) return FALSE; 
      if (xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH) 
     	                 == FALSE) return FALSE;    
     /*
     ** Code valid for version 1.00
     */
     if (strcmp(*version, "1.00") == 0) {
     	      
        if (xdr_u_int(xdrs,&(mcftmp->nRecords)) == FALSE) return FALSE; 
     } else return FALSE; /* Futur version encoded here. */
     return TRUE;
     	      
}

bool_t xdr_mcfast_eventheader(XDR *xdrs, int *blockid,
 		 int *ntot, char** version, mcfxdrEventHeader **mcf)
{
/*  Translate a mcf Event header block.  This subroutine will allocate
	the memory needed if the stream is DECODE */
        
    int i, *itmp;
    unsigned int nn, nnold, *uitmp;
    char **ctmp;
    mcfxdrEventHeader *mcftmp;
    
    
    mcftmp = *mcf;
    if (xdrs->x_op == XDR_ENCODE) {
      *ntot = sizeof(mcfxdrEventHeader)
              + sizeof(unsigned int)* mcftmp->nBlocks
              + sizeof(int ) * mcftmp->nBlocks 
              - sizeof(int *)  - sizeof(u_int *) ;
       strcpy(*version, "1.00");
     }  else if (xdrs->x_op == XDR_FREE) {
          mcfioC_Free_EventHeader(mcf);
          return 1;
     } else if((xdrs->x_op == XDR_DECODE) && (mcftmp == NULL)) {
          mcftmp =
           (mcfxdrEventHeader *) malloc(sizeof(mcfxdrEventHeader));
          *mcf = mcftmp;
          mcftmp->blockIds = NULL;
          mcftmp->ptrBlocks = NULL;
     } 
        

       
     if (( xdr_int(xdrs, blockid) && 
     	      xdr_int(xdrs, ntot) &&
     	      xdr_string(xdrs, version, MCF_XDR_VERSION_LENGTH)) 
     	                  == FALSE) return FALSE;
     
     /*
     ** Code valid for version 1.00
     */
     if (strcmp(*version, "1.00") == 0) {
        if((xdrs->x_op == XDR_DECODE) && (mcftmp->blockIds != NULL))
             nnold = mcftmp->dimBlocks;  
     	else nnold = 0;      
        if ((xdr_int(xdrs,&(mcftmp->evtnum)) &&
             xdr_int(xdrs,&(mcftmp->storenum)) &&
             xdr_int(xdrs,&(mcftmp->runnum)) &&
             xdr_int(xdrs,&(mcftmp->trigMask)) &&
             xdr_u_int(xdrs,&(mcftmp->nBlocks)) &&
             xdr_u_int(xdrs,&(mcftmp->dimBlocks))) == FALSE) return FALSE; 
        if(xdrs->x_op == XDR_DECODE) {
           if ((mcftmp->blockIds == NULL) || (mcftmp->dimBlocks > nnold)) {
           if (mcftmp->blockIds != NULL) {
            /*
            ** I don't trust realloc.. just alloc again.. 
            */
            free(mcftmp->blockIds); free(mcftmp->ptrBlocks); 
            }  
           mcftmp->blockIds =
             (int *) malloc(sizeof(unsigned int) * mcftmp->dimBlocks);
           mcftmp->ptrBlocks =
             (unsigned int *) malloc(sizeof(unsigned int) * mcftmp->dimBlocks);
           }
        }
        if (xdrs->x_op == XDR_ENCODE)  nn = mcftmp->dimBlocks;
        itmp = mcftmp->blockIds;
	if (xdr_array(xdrs, (char **) &itmp, &nn, 
	              mcftmp->dimBlocks, sizeof(int), xdr_int) == FALSE) 
	              return FALSE;
	uitmp = mcftmp->ptrBlocks;              
	if (xdr_array(xdrs, (char **) &uitmp, &nn, 
	              mcftmp->dimBlocks, sizeof(u_int), xdr_u_int) == FALSE) 
	              return FALSE;
     } else return FALSE; /* Futur version encoded here. */
     return TRUE;
     	      
}

