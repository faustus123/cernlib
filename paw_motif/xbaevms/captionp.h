/*
 * $Id$
 *
 * $Log$
 * Revision 1.2  1996/03/04 17:41:11  cernlib
 * Remove Fortran comments ( and cmz id) from C header files
 *
 * Revision 1.1.1.1  1996/03/01 11:39:36  mclareni
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
 * CaptionWidget Author: Andrew Wason, Bellcore, aw@bae.bellcore.com
 */

/*
 * CaptionP.h - Private definitions for Caption widget
 */

#ifndef _Xbae_CaptionP_h
#define _Xbae_CaptionP_h

/*
 *  "@(#)CaptionP.h     1.5 7/8/92"
 */

#include <Xm/XmP.h>
/* #include <Xbae/Caption.h> */
#include "caption.h"


/*
 * New fields for the Caption widget class record
 */
typedef struct {
    XtPointer                   extension;
} XbaeCaptionClassPart;

/*
 * Full class record declaration
 */
typedef struct _XbaeCaptionClassRec {
    CoreClassPart               core_class;
    CompositeClassPart          composite_class;
    ConstraintClassPart         constraint_class;
    XmManagerClassPart          manager_class;
    XbaeCaptionClassPart        caption_class;
} XbaeCaptionClassRec;

extern XbaeCaptionClassRec xbaeCaptionClassRec;

/*
 * New fields for the Caption widget record
 */
typedef struct {
    /* resources */
    XmFontList          font_list;
    XbaeLabelAlignment  label_alignment;
    int                 label_offset;
    Pixmap              label_pixmap;
    XbaeLabelPosition   label_position;
    XmString            label_string;
    unsigned char       label_text_alignment;
    unsigned char       label_type;

    /* private state */

} XbaeCaptionPart;

/*
 * Full instance record declaration
 */
typedef struct _XbaeCaptionRec {
    CorePart            core;
    CompositePart       composite;
    ConstraintPart      constraint;
    XmManagerPart       manager;
    XbaeCaptionPart     caption;
} XbaeCaptionRec;

#endif /* _Xbae_CaptionP_h */
