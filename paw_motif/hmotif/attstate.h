/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/01 11:39:10  mclareni
 * Initial revision
 *
 */
/*CMZ :  2.04/15 05/03/94  14.34.00  by  Fons Rademakers*/
/*-- Author :*/
/***********************************************************************
 *                                                                     *
 * attState.h: declarations and definitions for attributes.            *
 *                                                                     *
 ***********************************************************************/
#ifndef _attState_h
#define _attState_h

#define MAX_TITLE_SIZE   255

typedef struct {
   char   *FirstLetter;
   int     LineWidth;
   int     SurfaceColor;           /* don't use for X and Y Axis Object */
   int     ContourColor;
   int     ZoneColor;              /* use only for Box Object */
   int     StatColor;              /* use only for Box Object */
   char    Title[MAX_TITLE_SIZE];
   int     IndexHatch;

} TStateObject;

#endif  /* _attState_h */
