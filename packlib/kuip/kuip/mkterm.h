/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/08 15:33:00  mclareni
 * Initial revision
 *
 */

#define ESCAPE          "#@"


typedef void (*KxtermActionProc)(
#ifndef NO_PROTOTYPES
    char**              /* params */,
    int                 /* num_params */
#endif
);

typedef struct _KxtermActionsRec{
    char               *string;
    KxtermActionProc    proc;
} KxtermActionsRec;

typedef KxtermActionsRec  *KxtermActionList;

extern void             kxterm_add_actions(
                                     KxtermActionList);
extern void             handle_kxterm_action(
                                     char *);
extern void             send_kxterm_cmd(
                                     char**);
extern void             send_single_kxterm_cmd(
                                     char*);

