/*
 * $Id$
 *
 * $Log$
 * Revision 1.1  1996/03/01 11:39:35  mclareni
 * Initial revision
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
 * MatrixWidget Author: Andrew Wason, Bellcore, aw@bae.bellcore.com
 *
 * 7/20/1994:
 *      Changes are made by Q. Frank Xia, qx@math.columbia.edu,
 *      for cosmetic improvement.
 */

#ifndef _Xbae_Matrix_h
#define _Xbae_Matrix_h

/*
 *  "@(#)Matrix.h       3.9 11/25/92"
 */

/*
 * Matrix Widget public include file
 */

#include <Xm/Xm.h>
#include <X11/Core.h>


/* Resources:
 * Name                 Class                   RepType         Default Value
 * ----                 -----                   -------         -------------
 * boldLabels           BoldLabels              Boolean         False
 * cellHighlightThickness HighlightThickness    HorizontalDimension 2
 * cellMarginHeight     MarginHeight            VerticalDimension   5
 * cellMarginWidth      MarginWidth             HorizontalDimension 5
 * cells                Cells                   StringTable     NULL
 * cellShadowThickness  ShadowThickness         HorizontalDimension 2
***colors               Colors                  PixelTable      NULL ***
***this resource replaced by cellBackgrounds                         ***
 * columnAlignments     Alignments              AlignmentArray  dynamic
 * columnLabelAlignmentsAlignments              AlignmentArray  dynamic
 * columnLabels         Labels                  StringArray     NULL
 * columnMaxLengths     ColumnMaxLengths        MaxLengthArray  NULL
 * columnWidths         ColumnWidths            WidthArray      NULL
 * columns              Columns                 int             0
 * enterCellCallback    Callback                Callback        NULL
 * fixedColumns         FixedColumns            Dimension       0
 * fixedRows            FixedRows               Dimension       0
 * fontList             FontList                FontList        fixed
 * leaveCellCallback    Callback                Callback        NULL
 * modifyVerifyCallback Callback                Callback        NULL
 * rowLabelAlignment    Alignment               Alignment       XmALIGNMENT_END
 * rowLabelWidth        RowLabelWidth           Short           dynamic
 * rowLabels            Labels                  StringArray     NULL
 * rows                 Rows                    int             0
 * selectCellCallback   Callback                Callback        NULL
 * selectedCells        SelectedCells           BooleanTable    dynamic
 * space                Space                   Dimension       6
 * textTranslations     Translations            TranslationTable    dynamic
 * topRow               TopRow                  int             0
 * traverseCellCallback Callback                Callback        NULL
 * visibleColumns       VisibleColumns          Dimension       0
 * visibleRows          VisibleRows             Dimension       0
 *
 * Resources added by Q. Frank Xia.
 * ----                 -----                   -------         -------------
 * evenRowBackground    Color                   Pixel           dynamic
 * oddRowBackground     Color                   PixelTable      NULL
 * cellBackgrounds      Colors                  Pixel           dynamic
 * selectedBackground   Color                   Pixel           dynamic
 * selectedForeground   Color                   Pixel           dynamic
 * gridType             GridType                GridType        XmGRID_LINE
 * gridLineColor        Color                   Pixel           dynamic
 */

#define XmNboldLabels "boldLabels"
#define XmNcellHighlightThickness "cellHighlightThickness"
#define XmNgridType "gridType"
#define XmNgridLineColor "gridLineColor"
#define XmNcellMarginHeight "cellMarginHeight"
#define XmNcellMarginWidth "cellMarginWidth"
#define XmNcellShadowThickness "cellShadowThickness"
#define XmNcells "cells"
#define XmNcellBackgrounds "cellBackgrounds"
#define XmNevenRowBackground "evenRowBackground"
#define XmNoddRowBackground "oddRowBackground"
#define XmNcolumnAlignments "columnAlignments"
#define XmNcolumnLabelAlignments "columnLabelAlignments"
#define XmNcolumnLabels "columnLabels"
#define XmNcolumnMaxLengths "columnMaxLengths"
#define XmNcolumnWidths "columnWidths"
#define XmNeditVerifyCallback "editVerifyCallback"
#define XmNenterCellCallback "enterCellCallback"
#define XmNfixedColumns "fixedColumns"
#define XmNfixedRows "fixedRows"
#define XmNleaveCellCallback "leaveCellCallback"
#define XmNrowLabelAlignment "rowLabelAlignment"
#define XmNrowLabelWidth "rowLabelWidth"
#define XmNrowLabels "rowLabels"
#define XmNselectedCells "selectedCells"
#define XmNselectedBackground "selectedBackground"
#define XmNselectedForeground "selectedForeground"
#define XmNselectCellCallback "selectCellCallback"
#define XmNtopRow "topRow"
#define XmNtraverseCellCallback "traverseCellCallback"
#define XmNvisibleColumns "visibleColumns"
#define XmNvisibleRows "visibleRows"

#define XmCAlignments "Alignments"
#define XmCBoldLabels "BoldLabels"
#define XmCCells "Cells"
#define XmCColors "Colors"
#define XmCColumnMaxLengths "ColumnMaxLengths"
#define XmCColumnWidths "ColumnWidths"
#define XmCFixedColumns "FixedColumns"
#define XmCFixedRows "FixedRows"
#define XmCGridType "GridType"
#define XmCLabels "Labels"
#define XmCRowLabelWidth "RowLabelWidth"
#define XmCSelectedCells "SelectedCells"
#define XmCTopRow "TopRow"
#define XmCVisibleColumns "VisibleColumns"
#define XmCVisibleRows "VisibleRows"

#define XmRGridType "GridType"
#if XmVersion == 1001
#define XmRStringArray "StringArray"
#endif
#define XmRWidthArray "WidthArray"
#define XmRMaxLengthArray "MaxLengthArray"
#define XmRAlignmentArray "AlignmentArray"
#define XmRPixelTable "PixelTable"
#define XmRBooleanTable "BooleanTable"

enum {
  XmGRID_NONE,
  XmGRID_LINE,
  XmGRID_SHADOW_IN,
  XmGRID_SHADOW_OUT
};

/* Class record constants */

extern WidgetClass xbaeMatrixWidgetClass;

typedef struct _XbaeMatrixClassRec *XbaeMatrixWidgetClass;
typedef struct _XbaeMatrixRec *XbaeMatrixWidget;

/*
 * External interfaces to class methods
 */

#if defined (__cplusplus) || defined(c_plusplus)
#define CONST const
extern "C" {
#else
#define CONST
#endif

extern void XbaeMatrixSetCell(
#if NeedFunctionPrototypes
                              Widget            /* w */,
                              int               /* row */,
                              int               /* column */,
                              CONST String      /* value */
#endif
                              );

extern void XbaeMatrixEditCell(
#if NeedFunctionPrototypes
                               Widget   /* w */,
                               int      /* row */,
                               int      /* column */
#endif
                               );

extern void XbaeMatrixSelectCell(
#if NeedFunctionPrototypes
                                 Widget /* w */,
                                 int    /* row */,
                                 int    /* column */
#endif
                                 );

extern void XbaeMatrixSelectRow(
#if NeedFunctionPrototypes
                                Widget  /* w */,
                                int     /* row */
#endif
                                );

extern void XbaeMatrixSelectColumn(
#if NeedFunctionPrototypes
                                   Widget       /* w */,
                                   int          /* column */
#endif
                                 );

extern void XbaeMatrixDeselectAll(
#if NeedFunctionPrototypes
                                 Widget /* w */
#endif
                                 );

extern void XbaeMatrixDeselectCell(
#if NeedFunctionPrototypes
                                   Widget/* w */,
                                   int  /* row */,
                                   int  /* column */
#endif
                                 );

extern void XbaeMatrixDeselectRow(
#if NeedFunctionPrototypes
                                   Widget/* w */,
                                   int  /* row */
#endif
                                 );

extern void XbaeMatrixDeselectColumn(
#if NeedFunctionPrototypes
                                   Widget/* w */,
                                   int  /* column */
#endif
                                 );

extern String XbaeMatrixGetCell(
#if NeedFunctionPrototypes
                                Widget  /* w */,
                                int     /* row */,
                                int     /* column */
#endif
                                );

extern Boolean XbaeMatrixCommitEdit(
#if NeedFunctionPrototypes
                                    Widget      /* w */,
                                    Boolean     /* unmap */
#endif
                                    );

extern void XbaeMatrixCancelEdit(
#if NeedFunctionPrototypes
                                 Widget         /* w */,
                                 Boolean        /* unmap */
#endif
                                 );


extern void XbaeMatrixAddRows(
#if NeedFunctionPrototypes
                              Widget    /* w */,
                              int       /* position */,
                              String *  /* rows */,
                              String *  /* labels */,
                              Pixel *   /* colors */,
                              int       /* num_colors */
#endif
                              );

extern void XbaeMatrixDeleteRows(
#if NeedFunctionPrototypes
                                 Widget /* w */,
                                 int    /* position */,
                                 int    /* num_rows */
#endif
                                 );

extern void XbaeMatrixAddColumns(
#if NeedFunctionPrototypes
                                 Widget         /* w */,
                                 int            /* position */,
                                 String *       /* columns */,
                                 String *       /* labels */,
                                 short *        /* widths */,
                                 int *          /* max_lengths */,
                                 unsigned char * /* alignments */,
                                 unsigned char * /* label_alignments */,
                                 Pixel *        /* colors */,
                                 int            /* num_columns */
#endif
                                 );

extern void XbaeMatrixDeleteColumns(
#if NeedFunctionPrototypes
                                    Widget      /* w */,
                                    int         /* position */,
                                    int         /* num_columns */
#endif
                                    );

extern void XbaeMatrixSetRowColors(
#if NeedFunctionPrototypes
                                   Widget       /* w */,
                                   int          /* position */,
                                   Pixel *      /* colors */,
                                   int          /* num_colors */
#endif
                                   );

extern void XbaeMatrixSetColumnColors(
#if NeedFunctionPrototypes
                                      Widget    /* w */,
                                      int       /* position */,
                                      Pixel *   /* colors */,
                                      int       /* num_colors */
#endif
                                      );

extern void XbaeMatrixSetCellColor(
#if NeedFunctionPrototypes
                                      Widget    /* w */,
                                      int       /* row */,
                                      int       /* column */,
                                      Pixel     /* color */
#endif
                                      );

#if defined (__cplusplus) || defined(c_plusplus)
}
#endif
#undef CONST

/*
 * Callback reasons.  Try to stay out of range of the Motif XmCR_* reasons.
 */
typedef enum _XbaeReasonType {
    XbaeModifyVerifyReason = 102,
    XbaeEnterCellReason,
    XbaeLeaveCellReason,
    XbaeTraverseCellReason,
    XbaeSelectCellReason
} XbaeReasonType;

/*
 * Struct passed to modifyVerifyCallback
 */
typedef struct _XbaeMatrixModifyVerifyCallbackStruct {
    XbaeReasonType reason;
    int row, column;
    XmTextVerifyCallbackStruct *verify;
} XbaeMatrixModifyVerifyCallbackStruct;

/*
 * Struct passed to enterCellCallback
 */
typedef struct _XbaeMatrixEnterCellCallbackStruct {
    XbaeReasonType reason;
    int row, column;
    Boolean doit;
} XbaeMatrixEnterCellCallbackStruct;

/*
 * Struct passed to leaveCellCallback
 */
typedef struct _XbaeMatrixLeaveCellCallbackStruct {
    XbaeReasonType reason;
    int row, column;
    String value;
    Boolean doit;
} XbaeMatrixLeaveCellCallbackStruct;

/*
 * Struct passed to traverseCellCallback
 */
typedef struct _XbaeMatrixTraverseCellCallbackStruct {
    XbaeReasonType reason;
    int row, column;
    int next_row, next_column;
    int fixed_rows, fixed_columns;
    int num_rows, num_columns;
    String param;
    XrmQuark qparam;
} XbaeMatrixTraverseCellCallbackStruct;

/*
 * Struct passed to selectCellCallback
 */
typedef struct _XbaeMatrixSelectCellCallbackStruct {
    XbaeReasonType reason;
    int row, column;
    Boolean **selected_cells;
    String **cells;
    Cardinal num_params;
    String *params;
    XEvent *event;
} XbaeMatrixSelectCellCallbackStruct;


#endif /* _Xbae_Matrix_h */
/* DON'T ADD STUFF AFTER THIS #endif */


