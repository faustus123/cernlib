/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/01 11:39:12  mclareni
 * Initial revision
 *
 */
/*CMZ :  2.03/16 07/10/93  15.13.36  by  Fons Rademakers*/
/*-- Author :*/
/* interface to PAWLUN common block (defined in PAW) */
struct {
   long lunit[128];
   long lunchn;
} pawlun __attribute((__section(pawlun)));

