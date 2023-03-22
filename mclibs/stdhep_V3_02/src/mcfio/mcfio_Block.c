/*******************************************************************************
*									       *
* mcfio_Block.c --  Utility routines for the McFast Monte-Carlo                  *
*		The routine to encode/decode a block 	                       *
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
#include <stdlib.h>
#include <time.h>
#ifdef SUNOS
#include <floatingpoint.h>
#else /* SUNOS */
#include <float.h>
#endif /* SUNOS */
#include "mcf_xdr.h"
#include "mcfio_Dict.h"
#include "mcfio_Util1.h"
#include "mcfio_Direct.h"
#include "mcfio_Block.h"
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif

int mcfioC_Block(int stream, int blkid, 
 bool_t xdr_filtercode(XDR *xdrs, int *blockid, int *ntot, char **version))
/*
** Routine to decode or encode a particular Block. Return 1 if O.K, 
** -1 if a problem or unknow block.
*/
{ 
  int i, j, jstr, idtmp, ntot, nbuff;
  bool_t ok;
  u_int p1;
  mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_Block: You must first initialize by calling mcfio_Init.\n"); 
     return -1;
  }
  jstr = stream-1;
  if (McfStreamPtrList[jstr] == NULL) { 
     fprintf(stderr,
 " mcfio_Block: First, declare the stream by calling mcfio_Open...\n"); 
     return -1;
  }
  str = McfStreamPtrList[jstr];
  if ((str->row == MCFIO_WRITE) && 
      (str->fhead->nBlocks == str->ehead->nBlocks)) {
     fprintf(stderr,
 " mcfio_Block: Maximum number of Blocks reached for stream %d ...\n", stream);
     fprintf(stderr,
 "              Please upgrade the declaration mcfio_Open statement \n");
     return -1;
  }
     
  if (str->row == MCFIO_READ) {
      for(i=0, j=-1; i<str->ehead->nBlocks; i++) {
           if (str->ehead->blockIds[i] == blkid) j = i;
        }
      if (j == -1) {
        fprintf(stderr,
 " mcfio_Block: Unable to find block i.d. %d in Stream %d \n", blkid, stream);
          return -1;  
      }
      if (xdr_setpos(str->xdr,str->ehead->ptrBlocks[j]) == FALSE) {
        fprintf(stderr,
         " mcfio_Block: Unable to position stream at block %d \n", blkid);
          return -1;  
      }
      str->currentPos = str->ehead->ptrBlocks[j];
  } else if (str->row == MCFIO_WRITE)  {
      idtmp = blkid;
      /*
      ** if to Sequential media, one first has to make sure we have 
      ** enough room in the buffer.
      */
      if (str->dos == MCFIO_SEQUENTIAL) {
         str->xdr->x_op = XDR_MCFIOCODE;
         ok = xdr_filtercode(str->xdr, &idtmp, &ntot, McfGenericVersion);
         str->xdr->x_op = XDR_ENCODE;
         if ((str->currentPos + 4*(ntot + 1)) > str->bufferSize) {
          /*
          ** Once again, I don't trust realloc, got to copy to the second 
          ** buffer. 
          */
             nbuff = 1 + 
                    (((4*(ntot + 1)) + (str->currentPos - str->firstPos))/
                       str->maxlrec);
             str->buffer2 = 
                 (char *) malloc (sizeof(char) * (str->maxlrec *nbuff));
             memcpy(str->buffer2, str->buffer, 
                       (str->currentPos - str->firstPos));
             free(str->buffer);
             str->buffer = str->buffer2;
             str->buffer2 = NULL;
             str->bufferSize = str->maxlrec * nbuff;
             xdrmem_create(str->xdr, str->buffer, str->bufferSize, XDR_ENCODE);
             if (xdr_setpos(str->xdr, str->currentPos) == FALSE) {
                 fprintf(stderr,
             " mcfio_Block:\n\
 Unable to position stream %d at block %d after realocation.\n", stream, blkid);
                 return -1; 
             } 
          }
       }
   }
   p1 = str->currentPos;
   ok = xdr_filtercode(str->xdr, &idtmp, &ntot, McfGenericVersion);
   if (ok == FALSE) {
        fprintf(stderr,
         " mcfio_Block: Unable to encode or decode block I.D. %d \n", blkid);
         j = str->ehead->nBlocks;
         if (xdr_setpos(str->xdr,str->ehead->ptrBlocks[j]) == FALSE) 
           fprintf(stderr,
         " mcfio_Block: Unable to position stream at block %d \n", blkid);
         return -1;
      }
   idtmp = blkid;  
   if(blkid != idtmp) {
        fprintf(stderr,
         " mcfio_Block: Unexpected I.D = %d found insted of I.D. %d \n",
              idtmp, blkid);
        return -1;
      }
    if (str->row == MCFIO_WRITE)  {  
      str->ehead->blockIds[str->ehead->nBlocks] = blkid;
      str->ehead->ptrBlocks[str->ehead->nBlocks] = p1;
      str->ehead->nBlocks++; 
    }
    str->currentPos = xdr_getpos(str->xdr);    
    str->numWordsC += (ntot/4);
    str->numWordsT += ((str->currentPos-p1)/4);
    return 1;
        
}
            
