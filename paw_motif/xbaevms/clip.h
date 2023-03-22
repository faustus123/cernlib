/*
 * $Id$
 *
 * $Log$
 * Revision 1.2  1996/03/04 17:41:12  cernlib
 * Remove Fortran comments ( and cmz id) from C header files
 *
 * Revision 1.1.1.1  1996/03/01 11:39:37  mclareni
 * Paw
 *
 */
/*
 * Copyright(c) 1992 Bell Communications Research, Inc. (Bellcore)
 *                        All rights reserved
 * Permission to use, copy, modify and distribute this material for
 * any purpose and without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all
 * copies, and that the name of Bellcore not be used in advertising
 * or publicity pertaining to this material without the specific,
 * prior written permission of an authorized representative of
 * Bellcore.
 *
 * BELLCORE MAKES NO REPRESENTATIONS AND EXTENDS NO WARRANTIES, EX-
 * PRESS OR IMPLIED, WITH RESPECT TO THE SOFTWARE, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR ANY PARTICULAR PURPOSE, AND THE WARRANTY AGAINST IN-
 * FRINGEMENT OF PATENTS OR OTHER INTELLECTUAL PROPERTY RIGHTS.  THE
 * SOFTWARE IS PROVIDED "AS IS", AND IN NO EVENT SHALL BELLCORE OR
 * ANY OF ITS AFFILIATES BE LIABLE FOR ANY DAMAGES, INCLUDING ANY
 * LOST PROFITS OR OTHER INCIDENTAL OR CONSEQUENTIAL DAMAGES RELAT-
 * ING TO THE SOFTWARE.
 *
 * ClipWidget Author: Andrew Wason, Bellcore, aw@bae.bellcore.com
 */

/*
 * Clip.h - Public definitions for Clip widget
 */

#ifndef _Xbae_Clip_h
#define _Xbae_Clip_h

/*
 *  "@(#)Clip.h 3.4 7/8/92"
 */

#include <Xm/Xm.h>

#ifdef vms
#undef  XtIsRealized
#define XtIsRealized(object)    (XtWindowOfObject(object) != (Window)0)
#endif                               /* IntrinsicP.h this is (Window)NULL */


/* Resources:
 * Name                 Class                   RepType         Default Value
 * ----                 -----                   -------         -------------
 * exposeProc           Function                Function        NULL
 * focusCallback        Callback                Callback        NULL
 */

#define XmNexposeProc "exposeProc"


/* Class record constants */

extern WidgetClass xbaeClipWidgetClass;

typedef struct _XbaeClipClassRec *XbaeClipWidgetClass;
typedef struct _XbaeClipRec *XbaeClipWidget;


/*
 * External interfaces to class methods
 */


#if defined (__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

extern void XbaeClipRedraw(
#if NeedFunctionPrototypes
                           Widget       /* w */
#endif
                           );

#if defined (__cplusplus) || defined(c_plusplus)
}
#endif

#endif /* _Xbae_Clip_h */
