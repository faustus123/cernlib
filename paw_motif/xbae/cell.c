/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/01 11:39:35  mclareni
 * Initial revision
 *
 */
/*CMZ :  2.06/01 09/11/94  18.36.43  by  Fons Rademakers*/
/*-- Author :    Fons Rademakers   01/11/94*/
/*
 * Copyright(C) Q. Frank Xia (qx@math.columbia.edu), 1994.
 *
 *                       All Rights Reserved
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose and without fee is hereby granted,
 * provided that the above copyright notice appear in all copies and that
 * both that copyright notice and this permission notice appear in
 * supporting documentation, and that the name of Q. Frank Xia not be
 * used in advertising or publicity pertaining to distribution of the
 * software without specific, written prior permission.
 *
 * This software is provided as-is and without any warranty of any kind.
 */

/*
 * Cell.c - This widget is derived from Motif TextField widget.
 *      It overwrites UnhighlightBorder method of Primitive widget.
 *      This widget is used in Matrix widget to replace TextField widget.
 *
 * 7-20-1994:
 *      This file is created.
 */

#include <Xm/XmP.h>
/* #include <Xbae/CellP.h> */
#include "cellp.h"

/* Declaration of methods */

#ifdef _NO_PROTO
static void UnhighlightBorder();
#else
static void UnhighlightBorder(Widget w);
#endif /* _NO_PROTO */

XqCellClassRec xqCellClassRec = {
    {
    /* core_class fields        */
    /* superclass               */      (WidgetClass) &xmTextFieldClassRec,
    /* class_name               */      "XqCell",
    /* widget_size              */      sizeof(XqCellRec),
    /* class_initialize         */      NULL,
    /* class_part_initialize    */      NULL,
    /* class_inited             */      FALSE,
    /* initialize               */      NULL,
    /* initialize_hook          */      NULL,
    /* realize                  */      XtInheritRealize,
    /* actions                  */      NULL,
    /* num_actions              */      0,
    /* resources                */      NULL,
    /* num_resources            */      0,
    /* xrm_class                */      NULLQUARK,
    /* compress_motion          */      TRUE,
    /* compress_exposure        */      XtExposeCompressSeries |
                                                XtExposeGraphicsExpose |
                                                  XtExposeNoExpose,
    /* compress_enterleave      */      TRUE,
    /* visible_interest         */      False,
    /* destroy                  */      NULL,
    /* resize                   */      XtInheritResize,
    /* expose                   */      XtInheritExpose,
    /* set_values               */      NULL,
    /* set_values_hook          */      NULL,
    /* set_values_almost        */      XtInheritSetValuesAlmost,
    /* get_values_hook          */      NULL,
    /* accept_focus             */      XtInheritAcceptFocus,
    /* version                  */      XtVersion,
    /* callback_private         */      NULL,
    /* tm_table                 */      XtInheritTranslations,
    /* query_geometry           */      XtInheritQueryGeometry,
    /* display_accelerator      */      XtInheritDisplayAccelerator,
    /* extension                */      NULL
    },
    {  /* Primitive class       */
    /* border_highlight         */      (XtWidgetProc)_XtInherit,
    /* border_unhighlight       */      (XtWidgetProc)UnhighlightBorder,
    /* translations             */      NULL,
    /* arm_and_activate         */      (XtActionProc)_XtInherit,
    /* syn resources            */      NULL,
    /* num_syn_resources        */      0,
    /* extension                */      NULL,
    },
    {  /* TextField class */
    /* extension                */      NULL,
    },
    {  /* Cell class */
    /* extension                */      NULL,
    }
};

WidgetClass xqCellWidgetClass = (WidgetClass) &xqCellClassRec;

static void
#ifdef _NO_PROTO
UnhighlightBorder(w)
Widget w ;
#else
UnhighlightBorder(Widget w)
#endif /* _NO_PROTO */
{
    XmPrimitiveWidget pw = (XmPrimitiveWidget) w ;

    pw->primitive.highlighted = False ;
    pw->primitive.highlight_drawn = False ;

    if(XtWidth( w) == 0 || XtHeight( w) == 0
       || pw->primitive.highlight_thickness == 0) return ;

#if XmVersion > 1001
    _XmClearBorder( XtDisplay (pw), XtWindow (pw), 0, 0, XtWidth( w),
                   XtHeight( w) , pw->primitive.highlight_thickness) ;
#endif
}

