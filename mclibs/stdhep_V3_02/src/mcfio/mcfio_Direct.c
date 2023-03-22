/*******************************************************************************
*									       *
* mcfio_Direct.c --  Utility routines for the McFast Monte-Carlo                 *
*		Direct Access I/O core routines 	                       *
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
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
#define INITIATE 3
#define FLUSH 4

/* Static routine used in this module */

static int mcfioC_gofornextevent(mcfStream *str);   
static int  mcfioC_wrttable(mcfStream *str, int mode);     
static int  mcfioC_wrtfhead(mcfStream *str, int mode);
static int  mcfioC_nextspecevt(mcfStream *str, int inum, int istore, 
                                       int irun, int itrig);      

int mcfioC_OpenReadDirect(char *filename)
/*
** Routine to open and read the header file for a Direct access Stream.
*/
{
   int i, jstr, idtmp, ntot, ll1;
   u_int p1, p2;
   FILE *ff;
   mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_OpenReadDirect: We will first initialize by calling mcfio_Init.\n"); 
     mcfioC_Init();
  }
  if (McfNumOfStreamActive >= MCF_STREAM_NUM_MAX) {
     fprintf(stderr,
  " mcfio_OpenReadDirect: Too many streams opened simultaneously.\n"); 
     return -1;
   }
   jstr = -1; i=0;
   while ((jstr == -1) && (i<MCF_STREAM_NUM_MAX)) {
          if (McfStreamPtrList[i] == NULL) jstr=i;
          i++;
          }
   if(jstr == -1) {
     fprintf(stderr,
  " mcfio_OpenReadDirect: Internal error, please report \n"); 
     return -1;
   }
   if ((filename == NULL) || (strlen(filename) > 255)) {
     fprintf(stderr,
  " mcfio_OpenReadDirect: You must give a valid UNIX filename.\n"); 
     return -1;
   }
   /*
   ** Now we can try to open this file.... 
   */
   ff = fopen(filename, "r");
   if (ff == NULL) {
     fprintf(stderr,
  " mcfio_OpenReadDirect: Problem opening file %s, message \n", filename);
     perror ("mcfio_OpenReadDirect"); 
     return -1;
   }
   McfStreamPtrList[jstr] = (mcfStream *) malloc(sizeof(mcfStream));
   str = McfStreamPtrList[jstr];
   str->xdr = (XDR *) malloc(sizeof(XDR));
   str->id = jstr+1;
   str->row = MCFIO_READ;
   str->dos = MCFIO_DIRECT;
   str->numWordsC = 0;
   str->numWordsT = 0;
   ll1 = strlen(filename) + 1;
   str->filename = (char *) malloc(sizeof(char) * ll1);
   strcpy(str->filename,filename); 
   str->filePtr = ff;
   str->device = NULL;
   str->vsn = NULL;
   str->filenumber = -1;
   str->minlrec = -1;
   str->maxlrec = -1;
   str->shead = NULL;
   str->ehead = NULL;
   str->table = NULL;
   str->buffer = NULL;
   str->buffer2 = NULL;
   xdrstdio_create(str->xdr, ff, XDR_DECODE);
   p1 = xdr_getpos(str->xdr);
   str->firstPos = p1;
   str->status = MCFIO_BOF;
   str->fhead = NULL;
   if (xdr_mcfast_fileheader(str->xdr, &idtmp,
                             &ntot, McfGenericVersion, &(str->fhead)) == FALSE) {
       fprintf (stderr, 
               "mcfio_OpenReadDirect: Unable to decode fileheader \n");
       mcfioC_FreeStream(&McfStreamPtrList[jstr]);
       fclose(ff);
       return -1;
   }
   if (idtmp != FILEHEADER) {
       fprintf (stderr, 
            "mcfio_OpenReadDirect: First Structure not the header \n");
      
       fprintf (stderr, 
            "                    : Further accesses probably suspicious \n");
       mcfioC_FreeStream(&McfStreamPtrList[jstr]);
       fclose(ff);
       return -1;
   }    
   p2 = xdr_getpos(str->xdr);
   str->numWordsC += (ntot/4);
   str->currentPos = p2;
   str->fhead->firstTable = p2;
    /* presumably correct , assume standard direct acces file config. */
   str->numWordsT += ((p2-p1)/4);
   str->status = MCFIO_RUNNING;
   str->table = (mcfxdrEventTable *) malloc(sizeof(mcfxdrEventTable));
   str->table->nextLocator = -1;
   str->table->dim = str->fhead->dimTable;
   str->table->numevts = 0;
   str->table->previousnumevts = 0;
   str->table->evtnums = NULL;
   str->table->storenums = NULL;
   str->table->runnums = NULL;
   str->table->trigMasks = NULL;
   str->ehead = (mcfxdrEventHeader *) malloc(sizeof(mcfxdrEventHeader));
   str->ehead->dimBlocks = str->fhead->nBlocks;
   str->ehead->blockIds = NULL;
   str->ehead->ptrBlocks = NULL;
   McfNumOfStreamActive++;
   return (jstr+1);
}
    
int mcfioC_OpenWriteDirect(char *filename, char *title, char *comment,
                           int numevts_pred, int *blkIds, u_int nBlocks)

/*
** Routine to open and write the header file for a Direct access Stream.
*/
{
   int i, jstr, idtmp, ntot;
   u_int p1, p2;
   FILE *ff;
   mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_OpenWriteDirect: We will first initialize by calling mcfio_Init.\n"); 
     mcfioC_Init();
  }
  if (McfNumOfStreamActive >= MCF_STREAM_NUM_MAX) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: Too many streams opened simultaneously.\n"); 
     return -1;
   }
   jstr = -1; i=0;
   while ((jstr == -1) && (i<MCF_STREAM_NUM_MAX)) {
          if (McfStreamPtrList[i] == NULL) jstr=i;
          i++;
          }
   if(jstr == -1) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: Internal error, please report \n"); 
     return -1;
   }
   if ((filename == NULL) || (strlen(filename) > 255)) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: You must give a valid UNIX filename.\n"); 
     return -1;
   }
   if ((title != NULL) && (strlen(title) > 255)) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: Title is too long\n"); 
     return -1;
   }
     
   if ((comment != NULL) && (strlen(comment) > 255)) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: comment is too long\n"); 
     return -1;
   }
      
   /*
   ** Now we can try to open this file.... 
   */
   ff = fopen(filename, "w");
   if (ff == NULL) {
     fprintf(stderr,
  " mcfio_OpenWriteDirect: Problem opening file %s, message \n", filename);
     perror ("mcfio_OpenWriteDirect"); 
     return -1;
   }
   McfStreamPtrList[jstr] = (mcfStream *) malloc(sizeof(mcfStream));
   str = McfStreamPtrList[jstr];
   str->xdr = (XDR *) malloc(sizeof(XDR));
   str->id = jstr+1;
   str->row = MCFIO_WRITE;
   str->dos = MCFIO_DIRECT;
   str->numWordsC = 0;
   str->numWordsT = 0;
   str->filename = (char *) malloc(sizeof(char) * ( strlen(filename) +1) );
   strcpy(str->filename,filename); 
   str->filePtr = ff;
   str->device = NULL;
   str->vsn = NULL;
   str->filenumber = -1;
   str->minlrec = -1;
   str->maxlrec = -1;
   str->shead = NULL;
   str->ehead = NULL;
   str->table = NULL;
   str->buffer = NULL;
   str->buffer2 = NULL;
   xdrstdio_create(str->xdr, ff, XDR_ENCODE);
   p1 = xdr_getpos(str->xdr);
   str->firstPos = p1;
   str->currentPos = p1;
   str->status = MCFIO_BOF;
   str->fhead = (mcfxdrFileHeader *) malloc(sizeof(mcfxdrFileHeader));
   /*
   ** Fill the file header, additional info will be written on tape
   */
   if (title == NULL) strcpy(str->fhead->title,"No Title given");
    else strcpy(str->fhead->title,title);
    
   if (comment == NULL) strcpy(str->fhead->comment,"No comment");
    else strcpy(str->fhead->comment, comment);
   str->fhead->numevts_expect = numevts_pred;
   str->fhead->numevts = 0;
   /* 
   ** Futur expansion : make this a tunable parameter.
   */
   str->fhead->dimTable = MCF_DEFAULT_TABLE_SIZE;
   str->fhead->firstTable = -1;
   str->fhead->nBlocks = nBlocks;
   str->fhead->blockIds = (int *) malloc(sizeof(int) * nBlocks);
   str->fhead->blockNames = (char**) malloc(sizeof(char *) * nBlocks);
   for (i=0; i<nBlocks; i++) {
     str->fhead->blockIds[i] = blkIds[i];
     str->fhead->blockNames[i] = 
     (char *) malloc(sizeof(char) * (MCF_XDR_B_TITLE_LENGTH + 1));
     mcfioC_GetBlockName(blkIds[i], str->fhead->blockNames[i]);
   }  
   if (mcfioC_wrtfhead(str, INITIATE) == FALSE){
       mcfioC_FreeStream(&McfStreamPtrList[jstr]);
       fclose(ff);
       return -1;
   }
   str->table = (mcfxdrEventTable *) malloc(sizeof(mcfxdrEventTable));
   str->table->numevts=-1;
   str->table->nextLocator = -1;
   str->table->evtnums =   (int *) malloc(sizeof(int) * str->fhead->dimTable);
   str->table->storenums = (int *) malloc(sizeof(int) * str->fhead->dimTable);
   str->table->runnums = (int *) malloc(sizeof(int) * str->fhead->dimTable);
   str->table->trigMasks = (int *) malloc(sizeof(int) * str->fhead->dimTable);
   str->table->ptrEvents = 
         (u_int *) malloc(sizeof(int) * str->fhead->dimTable);
   /*
   ** Write the first dummy table 
   */
   if (mcfioC_wrttable(str, INITIATE) == FALSE) return -1;
   str->ehead = (mcfxdrEventHeader *) malloc(sizeof(mcfxdrEventHeader));
   str->ehead->dimBlocks = str->fhead->nBlocks;
   str->ehead->nBlocks = 0;
   str->ehead->evtnum = 0;
   str->ehead->previousevtnum = 0;
   str->ehead->storenum = 0;
   str->ehead->runnum = 0;
   str->ehead->trigMask = 0;
   str->ehead->blockIds = (int *) malloc(sizeof(int) * str->fhead->nBlocks);
   str->ehead->ptrBlocks = (u_int *) malloc(sizeof(int) * str->fhead->nBlocks);
   /*
   ** Write the first dummy event header
   */
   if (mcfioC_WrtEvt(str, INITIATE) == FALSE) return -1;
   str->ehead->evtnum = 0;
   str->status = MCFIO_RUNNING;
   McfNumOfStreamActive++;
   return (jstr+1);

}

int mcfioC_NextEvent(int stream)
/*
** The Core routine for getting or setting the next event d.s. from/to 
**  a stream. 
**
*/
{
   int i, jstr, idtmp, ntot, nn1;
   u_int p_evt, p1, p2, *p_ptr;
   mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_NextEvent: You must first initialize by calling mcfio_Init.\n"); 
     return -1;
  }
  jstr = stream-1;
  if (McfStreamPtrList[jstr] == NULL) { 
     fprintf(stderr,
 " mcfio_NextEvent: First, declare the stream by calling mcfio_Open...\n"); 
     return -1;
  }
  str = McfStreamPtrList[jstr];
  if (str->dos == MCFIO_SEQUENTIAL) return mcfioC_NextEventSequential(stream);
  if (str->row == MCFIO_READ) {
  /*
  ** Read the next event, hunt for either an event or a table of event
  **  if event table not available.
  */
      if ((str->table == NULL) || 
         ((str->table != NULL)&& (str->table->evtnums == NULL))) { 
                idtmp = mcfioC_gofornextevent(str);
                if (idtmp != EVENTTABLE) {
                    if (str->table !=NULL) 
                       mcfioC_Free_EventTable(&(str->table));
                    if (idtmp == NOTHING) return -1;
                    p_evt = str->currentPos;
                 } else {
                  if( xdr_mcfast_eventtable(str->xdr, &idtmp,
 		     &ntot, McfGenericVersion, &(str->table)) == FALSE) {
                           fprintf(stderr,
 " mcfio_NextEvent: XDR Error decoding the EventTable \n"); 
 		            return -1;
 		    }
                    p2 = xdr_getpos(str->xdr);
                    str->numWordsC += (ntot/4);
                    str->numWordsT += ((p2-str->currentPos)/4);
                    str->currentPos = p2;
                    str->table->ievt = 0;
                    /* 
                    ** If table empty, cal this routine recursively to get 
                    **   the next event 
                    */
                    if (str->table->numevts <= 0) {
                      if (str->table->nextLocator == -1) 
                       mcfioC_Free_EventTable(&(str->table));
                       return mcfioC_NextEvent(str->id);
                    }     
                    p_evt = str->table->ptrEvents[0];
                } 
      } else {
           if (str->table->ievt < str->table->numevts) {
                 p_evt = str->table->ptrEvents[str->table->ievt];
           } else {
           /*
           ** decode the next table, if valid. If not, scrap the 
           ** existing table and call next event recursively.
           */
              if (str->table->nextLocator == -2) {
                  /* 
                  ** Stream is at EOF
                  */
                   str->status = MCFIO_EOF;
                   return MCFIO_EOF;
              } else if (str->table->nextLocator == -1) { 
                           fprintf(stderr,
 " mcfio_NextEvent: Corrupted Event Table \n"); 
 		            return -1;
                }
                if (xdr_setpos(str->xdr, str->table->nextLocator) == FALSE) {
                           fprintf(stderr,
 " mcfio_NextEvent: Error Repositioning stream \n"); 
 		            return -1;
 		 }
                 if( xdr_mcfast_eventtable(str->xdr, &idtmp,
 		     &ntot, McfGenericVersion, &(str->table)) == FALSE) {
                           fprintf(stderr,
 " mcfio_NextEvent: XDR Error decoding the EventTable \n"); 
 		            return -1;
 		    }
                    p2 = xdr_getpos(str->xdr);
                    str->numWordsC += (ntot/4);
                    str->numWordsT += ((p2-str->currentPos)/4);
                    str->currentPos = p2;
                    str->table->ievt = 0;
                    p_evt = str->table->ptrEvents[0];
                  }
       }
       /* 
       ** we should be pointing to a good event header here. 
       */
       if (xdr_setpos(str->xdr, p_evt) == FALSE) return -1;
       if( xdr_mcfast_eventheader(str->xdr, &idtmp,
	&ntot, McfGenericVersion, &(str->ehead)) == FALSE) return -1;
        str->currentPos = xdr_getpos(str->xdr);
        str->numWordsC += (ntot/4);
        str->numWordsT += ((str->currentPos - p_evt)/4);
        str->table->ievt ++;              
        return MCFIO_RUNNING;
  } else {
    /*
    ** Writing Code here.
    */
    str->table->numevts++;
    str->fhead->numevts++;
    if (str->ehead->previousevtnum == str->ehead->evtnum) str->ehead->evtnum++;
     /*
     ** Write the current event header, normal case. First Flush the current
     **  event,  then initiate the next one event. Note that wrtevt will
     ** reposition the stream after rewriting the event header, if FLUSH. 
     ** e.g. ready to initiate either a new table or a new event.
     */
     if (mcfioC_WrtEvt(str, FLUSH) == FALSE) return -1;
     str->ehead->previousevtnum = str->ehead->evtnum;
     if (str->table->numevts == (str->fhead->dimTable - 1)) {
      /*
      ** The Event table is now full. Flush it. Then initiate a new table. 
      */ 
       str->table->nextLocator = xdr_getpos(str->xdr);
       if (mcfioC_wrttable(str, FLUSH) == FALSE) return -1;
       if (mcfioC_wrttable(str, INITIATE) == FALSE) return -1;
     }
     str->ehead->nBlocks = 0;
     nn1 = str->ehead->evtnum;
     if (mcfioC_WrtEvt(str, INITIATE) == FALSE) return -1;
     str->ehead->evtnum = nn1;
     return MCFIO_RUNNING;
  }
}

int mcfioC_SpecificEvent(int stream, int ievt,
                             int istore, int irun, int itrig)
{
   int i, jstr, idtmp, ntot, ok, nn1;
   u_int p_evt, p1, p2, *p_ptr;
   mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_SpecificEvent: You must first initialize by calling mcfio_Init.\n"); 
     return -1;
  }
  jstr = stream-1;
  if (McfStreamPtrList[jstr] == NULL) { 
     fprintf(stderr,
 " mcfio_SpecificEvent: First, declare the stream by calling mcfio_Open...\n"); 
     return -1;
  }
  str = McfStreamPtrList[jstr];
  if ((str->row != MCFIO_READ) || (str->dos != MCFIO_DIRECT)) {
     fprintf(stderr,
 " mcfio_SpecificEvent: Only valid for INPUT, DIRECT ACCESS \n"); 
     return -1;
     }
  if (xdr_setpos(str->xdr, str->fhead->firstTable) == FALSE ) {
       fprintf(stderr,
 " mcfio_SpecificEvent:  Could not reposition Direct Access Stream %d \n",
         (jstr+1)) ;
    return -1;
   }
   str->currentPos = str->fhead->firstTable;
   
   ok = mcfioC_nextspecevt(str, ievt, istore, irun, itrig);
   if (ok == FALSE) return -1;
   return ok;
    
}	                             
int mcfioC_NextSpecificEvent(int stream, int ievt,
                             int istore, int irun, int itrig)
{
   int i, jstr, idtmp, ntot, ok, nn1;
   u_int p_evt, p1, p2, *p_ptr;
   mcfStream *str;
   
  if (McfStreamPtrList == NULL) { 
     fprintf(stderr,
  " mcfio_NextSpecific: You must first initialize by calling mcfio_Init.\n"); 
     return -1;
  }
  jstr = stream-1;
  if (McfStreamPtrList[jstr] == NULL) { 
     fprintf(stderr,
 " mcfio_NextSpecific: First, declare the stream by calling mcfio_Open...\n"); 
     return -1;
  }
  str = McfStreamPtrList[jstr];
  if ((str->row != MCFIO_READ) || (str->dos != MCFIO_DIRECT)) {
     fprintf(stderr,
 " mcfio_NextSpecificEvent: Only valid for INPUT, DIRECT ACCESS \n"); 
     return -1;
     }
   ok = mcfioC_nextspecevt(str, ievt, istore, irun, itrig);
   if (ok == FALSE) return -1;
   return ok;
    
}	                             


void mcfioC_CloseDirect(int jstr)
/*
** Close a direct access stream
**
*/
{
   int i, idtmp, ntot;
   u_int p1, p2, *p_ptr;
   FILE *ff;
   mcfStream *str;
   
   str =  McfStreamPtrList[jstr];
   if (str->row == MCFIO_WRITE) {
       /*
       **  Flush the event header, and the last table header. 
       */
       if (str->status == MCFIO_RUNNING) { 
         str->table->numevts++;
         str->ehead->evtnum++;
         if (mcfioC_WrtEvt(str, FLUSH) == FALSE) return;
         str->table->nextLocator = -2;
         str->table->numevts--; /* Decrement, the table is incomplete at 
         				this point */
         if (mcfioC_wrttable(str, FLUSH) == FALSE) return;
         if (mcfioC_wrtfhead(str, FLUSH) == FALSE) return;
       }
     }
     xdr_destroy(str->xdr);
     fclose(str->filePtr);
}       
       
void mcfioC_RewindDirect(int jstr)
/*
** Rewind a direct access stream, open for Read only
**
*/
{
    mcfStream *str;
    
    str =  McfStreamPtrList[jstr];
    if (xdr_setpos(str->xdr, str->fhead->firstTable) == FALSE )
       fprintf(stderr,
       " mcfio_Rewind:  Could not reposition Direct Access Stream %d \n",
         (jstr+1)) ;
    str->currentPos = str->fhead->firstTable;
    return;
}  
   

static int mcfioC_gofornextevent(mcfStream *str)   
/*
** Move in the direct access file to the next event or event table, 
** whatever comes first. The XDR current position is set to the beginning 
** of the event header or event table, if search sucessfull.
** This is fairly inefficient, as we have to keep reading block after 
** blocks.
*/
{
   u_int p1, p2;
   int id, ntot, go;
   
   go = TRUE;
   while (go == TRUE) {
     p1 = xdr_getpos(str->xdr);
     if (xdr_mcfast_headerBlock(str->xdr, &id, &ntot, McfGenericVersion)
            == FALSE)  return NOTHING;
     if ((id == EVENTTABLE) || (id == EVENTHEADER)) {
         str->currentPos = p1;
         if(xdr_setpos(str->xdr, p1) == FALSE) return NOTHING;
         return id;
     }
   }
   return NOTHING; /* This statement is to make the compiler happy */
}  

static int  mcfioC_wrtfhead(mcfStream *str, int mode)     
/*
** Write the file header. 
**  IF Mode = INITIATE, write the dummy information, at the current location.
**  IF mode = Flush, rewite all the information, this time with the 
**  correct number of events.
**
*/
{
   int idtmp, ntot;
   u_int p1, p0;
   
   idtmp = FILEHEADER;
   if (mode == FLUSH) {
     if(xdr_setpos(str->xdr,str->firstPos) == FALSE) return FALSE; 
     if (xdr_mcfast_fileheader(str->xdr, &idtmp,
                       &ntot, McfGenericVersion, &(str->fhead)) == FALSE) {
       fprintf (stderr, 
               "mcfio_OpenCloseDirect: Unable to reencode file head \n");
       return FALSE;
      }
   } else if (mode == INITIATE) {
     p0 = str->currentPos;
     if (xdr_mcfast_fileheader(str->xdr, &idtmp,
                       &ntot, McfGenericVersion, &(str->fhead)) == FALSE) {
       fprintf (stderr, 
               "mcfio_OpenWriteDirect: Unable to encode fileheader \n");
       return FALSE;
      } 
      p1 = xdr_getpos(str->xdr);
      str->numWordsC += (ntot/4);
      str->numWordsT += ((p1-p0)/4);
      str->currentPos = p1;
      return TRUE;
   } else {
     fprintf(stderr," mcfioC_wrtfhead: Internal error, lost mode \n");
     return FALSE;
   }
   return FALSE; /* This statement is to make the compiler happy */
}
             
   
int  mcfioC_WrtEvt(mcfStream *str, int mode)     
/*
** Write an event header, and update the table. Presumably, we have room 
**  in this table to do so.
**  IF Mode = INITIATE, write the dummy event header, at the current location.
**   Do not fill the element table.
**  If mode = FLUSH write the real event header and also
**     fill the Table elements. 
**
*/
{
   int i, idtmp, ntot;
   u_int p1, p0;
   
   idtmp = EVENTHEADER;
   if (mode == FLUSH) {
    str->table->evtnums[str->table->numevts] = str->ehead->evtnum;             
    str->table->storenums[str->table->numevts] = str->ehead->storenum;             
    str->table->runnums[str->table->numevts] = str->ehead->runnum;             
    str->table->trigMasks[str->table->numevts] = str->ehead->trigMask;
    str->table->ptrEvents[str->table->numevts] = str->evtPos;
    p0 = str->currentPos;
    if(xdr_setpos(str->xdr,str->evtPos) == FALSE) return FALSE; 
    p1 = str->evtPos;
    if(xdr_mcfast_eventheader(str->xdr, &idtmp,
            &ntot, McfGenericVersion, &(str->ehead)) == FALSE) return FALSE;
    str->currentPos = xdr_getpos(str->xdr); 
    str->numWordsC += (ntot/4);
    str->numWordsT += ((str->currentPos-p1)/4);
    if(xdr_setpos(str->xdr,p0) == FALSE) return FALSE;
    str->currentPos = p0;
    str->ehead->nBlocks = 0;
    return TRUE;
   } else if (mode == INITIATE) {
    str->ehead->nBlocks = 0;
    str->ehead->evtnum = -1;
    str->evtPos = xdr_getpos(str->xdr);
    
    if(xdr_mcfast_eventheader(str->xdr, &idtmp,
            &ntot, McfGenericVersion, &(str->ehead)) == FALSE) return FALSE;
    str->currentPos = xdr_getpos(str->xdr);
    return TRUE;
   } else {
     fprintf(stderr," mcfioC_WrtEvt: Internal error, lost mode \n");
     return FALSE;
   }
}
             
static int  mcfioC_wrttable(mcfStream *str, int mode)     
/*
** Write an event table. 
**  IF Mode = INITIATE, write the dummy event table, at the current location.
**   Do not fill the element table.
**  If mode = FLUSH write the real event header and also
**     fill the Table elements. 
**
*/
{
   int idtmp, ntot;
   u_int p1, p0;
   
   idtmp = EVENTTABLE;
   str->table->dim = str->fhead->dimTable;
   if (mode == FLUSH) {
    p0 = str->currentPos;
    if(xdr_setpos(str->xdr,str->tablePos) == FALSE) return FALSE; 
    p1 = str->tablePos;
    str->table->numevts++;
    if(xdr_mcfast_eventtable(str->xdr, &idtmp,
            &ntot, McfGenericVersion, &(str->table)) == FALSE) return FALSE;
    str->currentPos = xdr_getpos(str->xdr); 
    str->numWordsC += (ntot/4);
    str->numWordsT += ((str->currentPos-p1)/4);
    if(xdr_setpos(str->xdr,p0) == FALSE) return FALSE;
    str->currentPos = p0;
    str->tablePos = -1;
    str->table->nextLocator = -1;
    str->table->numevts=-1;
    return TRUE;
   } else if (mode == INITIATE) {
    str->tablePos = xdr_getpos(str->xdr);
    str->table->nextLocator = -1;
    if(xdr_mcfast_eventtable(str->xdr, &idtmp,
            &ntot, McfGenericVersion, &(str->table)) == FALSE) return FALSE;
    str->currentPos = xdr_getpos(str->xdr);
    return TRUE;
   } else {
     fprintf(stderr," mcfioC_wrttable: Internal error, lost mode \n");
     return FALSE;
   }
}
             
static int  mcfioC_nextspecevt(mcfStream *str, int inum, int istore, 
                                       int irun, int itrig)
/*
** For Input, Direct access streams, hunt for a psecific event
**
*/  
{
   int i, jstr, j, idtmp, ntot, found;
   u_int p_evt, p1, p2, *p_ptr;
   
   if ((str->table == NULL) || 
         ((str->table != NULL)&& (str->table->evtnums == NULL))) { 
                idtmp = mcfioC_gofornextevent(str);
                if (idtmp != EVENTTABLE) {
                  fprintf(stderr,
 " mcfio_SpecificEvent: No event table on stream %d \n", str->id);
                  return FALSE;
                 } else {
                  if( xdr_mcfast_eventtable(str->xdr, &idtmp,
 		     &ntot, McfGenericVersion, &(str->table)) == FALSE) {
                           fprintf(stderr,
 " mcfio_SpecificEvent: XDR Error decoding the EventTable \n"); 
 		            return FALSE;
 		    }
                    p2 = xdr_getpos(str->xdr);
                    str->numWordsC += (ntot/4);
                    str->numWordsT += ((p2-str->currentPos)/4);
                    str->currentPos = p2;
                    str->table->ievt = 0;
                    /* 
                    ** If table empty, cal this routine recursively to get 
                    **   the next event 
                    */
                    str->table->ievt = 0;
                } 
      }
      found = FALSE;
      while (found == FALSE){
           j =  str->table->ievt;    
           if (str->table->ievt < str->table->numevts) {
             if (((irun == 0)
                 || ( irun != 0 && (str->table->evtnums[j] == irun))) &&
                 (((istore == 0) 
                 || (istore != 0) && (str->table->storenums[j] == istore))) &&
                 (((irun == 0) 
                 || (irun != 0) && (str->table->runnums[j] == irun))) &&
                 (((itrig == 0) 
                 || (itrig != 0) && (str->table->trigMasks[j] == itrig))))
                  found = TRUE;
                  p_evt = str->table->ptrEvents[str->table->ievt];
                  str->table->ievt++;
           } else {
           /*
           ** decode the next table, if valid. If not, scrap the 
           ** existing table and call next event recursively.
           */
              if (str->table->nextLocator == -2) {
                  /* 
                  ** Stream is at EOF
                  */
                   str->status = MCFIO_EOF;
                   return MCFIO_EOF;
              } else  if (str->table->nextLocator == -1) {
                           fprintf(stderr,
 " mcfio_NextEvent: Next EventTable corrupted, abandoning search \n"); 
 		            return FALSE;
              }
              if (xdr_setpos(str->xdr, str->table->nextLocator)
                      == FALSE) { fprintf(stderr,
 " mcfio_NextEvent: XDR Error repositioning to the next EventTable \n"); 
 		            return FALSE;
              } else  {
                     if( xdr_mcfast_eventtable(str->xdr, &idtmp,
 		     &ntot, McfGenericVersion, &(str->table)) == FALSE) {
                           fprintf(stderr,
 " mcfio_NextEvent: XDR Error decoding the EventTable \n"); 
 		            return FALSE;
 		    }
 	       }
               p2 = xdr_getpos(str->xdr);
               str->numWordsC += (ntot/4);
               str->numWordsT += ((p2-str->currentPos)/4);
               str->currentPos = p2;
               str->table->ievt = 0;
               p_evt = str->table->ptrEvents[0];
           }
       }
       if (found == FALSE) return FALSE;
       /* 
       ** we should be pointing to a good event header here. 
       */
       if (xdr_setpos(str->xdr, p_evt) == FALSE) return FALSE;
       if( xdr_mcfast_eventheader(str->xdr, &idtmp,
	&ntot, McfGenericVersion, &(str->ehead)) == FALSE) return FALSE;
        str->currentPos = xdr_getpos(str->xdr);
        str->numWordsC += (ntot/4);
        str->numWordsT += ((str->currentPos - p_evt)/4);
        return MCFIO_RUNNING;
        
}
