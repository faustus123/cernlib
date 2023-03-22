/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/08 15:33:00  mclareni
 * Initial revision
 *
 */
/* Interface for building lists (with Motif) */
typedef struct {
   char         *listLabel;
   char         *label;
   char         *help;
   IntFunc      *OKcallback;
   IntFunc      *user_callback;
   char         *OKcallback_data;
} ListData;

