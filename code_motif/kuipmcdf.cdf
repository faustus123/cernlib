*
* $Id$
*
* $Log$
* Revision 1.2  1997/09/01 07:53:33  cremel
* Implement the possibility to "close" a palette with commands:
* MULTI_PANEL <title> close
* or:
* MULTI_PANEL last close
* Update HELP accordingly.
*
* Revision 1.1.1.1  1996/03/08 15:33:13  mclareni
* Kuip
*
*
*CMZ :  2.06/03 13/01/95  11.54.39  by  N.Cremel
*-- Author :    Alfred Nathaniel   25/11/92
>Name KUIDFM


>Browse Commands . kscncmds%C
 List
'Set Default'  .  ' Set/Root /'

>Class /Menu Menu big_menu sm_menu
 List
'Set Root'     .  ' Set/Root [path]/[this]'

>Class Cmd Command big_cmd sm_cmd
 Execute       .  ' [path]/[this]'
'Execute...'   .  '-[path]/[this]'
 Help          /  ' Help [path]/[this]'
 Usage         .  ' Usage [path]/[this]'
 Manual        .  ' Manual [path]/[this]'
'Set Command'  /  ' Set/Command [path]/[this] $*'
 Deactivate    !  ' Set/Visibility [path]/[this] off'

>Class InvCmd 'Deactivated Command' big_invcmd sm_invcmd
 Help          .  ' Set/Visibility [path]/[this] on; Help [path]/[this]; _
                    Set/Visibility [path]/[this] off'
 Activate      /! ' Set/Visibility [path]/[this] on'

>Browse Files . kmbfil%C kmbfdi%C
 List
'Chdir to ...' .  '-Set/LCDIR [path]'
!Edit          .  '-KUIP/EDIT [path]'

>Class ExFile 'Executable File' big_fx sm_fx
 Execute       .  ' /KUIP/SHELL [that]'
'Execute...'   .  '-/KUIP/SHELL [that]'
 Edit          .  ' /KUIP/EDIT [that]'
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  ' -/KUIP/SHELL rm [that]'

>Class RwFile 'Read/Write File' big_frw sm_frw
 Edit          .  ' /KUIP/EDIT [that]'
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL rm [that]'

>Class RoFile 'Read-only File' big_fro sm_fro
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL rm [that]'

>Class NoFile 'No-access File' big_fno sm_fno
 Chmod         .  '-/KUIP/SHELL chmod 644 [that]'

>Class VmsComFile 'Command script' big_fx sm_fx
 Execute       .  ' /KUIP/SHELL @[that]'
'Execute...'   .  '-/KUIP/SHELL @[that]'
 Edit          .  ' /KUIP/EDIT [that]'
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL DELETE [that];0'

>Class VmsExeFile 'Executable File' big_fx sm_fx
 Execute       !  ' /KUIP/SHELL RUN [that]'
'Execute...'   !  '-/KUIP/SHELL RUN [that]'
 Delete        !  '-/KUIP/SHELL DELETE [that];0'

>Class VmsRwFile 'Read/Write File' big_frw sm_frw
 Edit          .  ' /KUIP/EDIT [that]'
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL DELETE [that];0'

>Class VmsRoFile 'Read-only File' big_fro sm_fro
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL DELETE [that];0'

>Class VmsNoFile 'No-access File' big_fno sm_fno
 'Set Protection'  .  '-/KUIP/SHELL SET PROTECTION [that]'

>Browse Macro . kmbmac%C kmbmdi%C
 List
 Edit          !  '-KUIP/EDIT [path]'

>Class MacFile 'Kuip Macro' big_fm sm_fm
 Exec          !  ' /MACRO/EXEC [that]'
'Exec...'      !  '-MACRO/EXEC [that]'
 Edit          .  ' /KUIP/EDIT [that]'
 View          .  . km_view_file%C
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL rm [that]'

>Class PSFile 'PostScript File' big_ps sm_ps
 View          .  ' /KUIP/PSVIEW [that]'
 Edit          .  ' /KUIP/EDIT [that]'
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL rm [that]'

>Class EPSFile 'Encapsulated PostScript File' big_ps sm_ps
 View          .  ' /KUIP/PSVIEW [that]'
 Edit          .  ' /KUIP/EDIT [that]'
 Print         .  ' /KUIP/PRINT [that]'
 Delete        !  '-/KUIP/SHELL rm [that]'

>Class /DirFile Directory big_menu sm_menu
 List

>Class /DirUpFile 'Up Directory' big_dirup sm_dirup
 List

>Icon_bitmaps

#define pixpan_width 30
#define pixpan_height 23
static char pixpan_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x01, 0x00, 0x00, 0xff, 0x07, 0x00,
   0x80, 0xff, 0x0f, 0x00, 0xc0, 0x07, 0x1f, 0x00, 0xe0, 0x21, 0x3c, 0x00,
   0xf0, 0x70, 0x78, 0x00, 0x70, 0x70, 0x70, 0x00, 0x78, 0x70, 0xf0, 0x00,
   0x38, 0x70, 0xe0, 0x00, 0x38, 0x70, 0xe0, 0x00, 0x38, 0x70, 0xe0, 0x00,
   0x38, 0x70, 0xe0, 0x00, 0x38, 0x00, 0xe0, 0x00, 0x78, 0x70, 0xf0, 0x00,
   0x70, 0x70, 0x70, 0x00, 0xf0, 0x70, 0x78, 0x00, 0xe0, 0x01, 0x3c, 0x00,
   0xc0, 0x07, 0x1f, 0x00, 0x80, 0xff, 0x0f, 0x00, 0x00, 0xff, 0x07, 0x00,
   0x00, 0xfc, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00};

#define big_menu_width 30
#define big_menu_height 23
static char big_menu_bits[] = {
   0xff, 0xff, 0xff, 0x3f, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x30,
   0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a,
   0x01, 0x54, 0x15, 0x30, 0x01, 0xa8, 0x0a, 0x30, 0x51, 0x01, 0x40, 0x35,
   0xa9, 0x02, 0xa0, 0x3a, 0x51, 0x55, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a,
   0x51, 0x55, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35,
   0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a,
   0x51, 0x55, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35,
   0xfd, 0xff, 0xff, 0x3f, 0xff, 0xff, 0xff, 0x3f};

#define sm_menu_width 20
#define sm_menu_height 16
static char sm_menu_bits[] = {
   0xff, 0xff, 0x0f, 0x01, 0x00, 0x08, 0x01, 0x00, 0x0c, 0x51, 0x55, 0x0d,
   0xa9, 0xaa, 0x0e, 0x01, 0x15, 0x0c, 0x29, 0x80, 0x0e, 0x51, 0x55, 0x0d,
   0xa9, 0xaa, 0x0e, 0x51, 0x55, 0x0d, 0xa9, 0xaa, 0x0e, 0x51, 0x55, 0x0d,
   0xa9, 0xaa, 0x0e, 0x51, 0x55, 0x0d, 0xfd, 0xff, 0x0f, 0xff, 0xff, 0x0f};

#define big_cmd_width 30
#define big_cmd_height 30
static char big_cmd_bits[] = {
   0xff, 0xff, 0xff, 0x3f, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x30,
   0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x3d, 0xa9, 0xaa, 0xaa, 0x3a,
   0x51, 0x55, 0x56, 0x31, 0xa9, 0x2a, 0xaa, 0x38, 0x51, 0x15, 0x56, 0x3c,
   0xa9, 0x0a, 0x2a, 0x3e, 0x51, 0x05, 0x06, 0x3f, 0xa9, 0x02, 0x82, 0x3b,
   0x51, 0x01, 0xc0, 0x3d, 0xa9, 0x00, 0xe0, 0x3a, 0x51, 0x00, 0x70, 0x3d,
   0x29, 0x18, 0xb8, 0x3a, 0x11, 0x1c, 0x5c, 0x3d, 0x09, 0x1f, 0xae, 0x3a,
   0xc5, 0x17, 0x57, 0x3d, 0xf3, 0x9a, 0xab, 0x3a, 0x7f, 0xd5, 0x55, 0x3d,
   0xaf, 0xfa, 0xaa, 0x3a, 0x51, 0x75, 0x55, 0x3d, 0xa9, 0xba, 0xaa, 0x3a,
   0x51, 0x55, 0x55, 0x3d, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x3d,
   0xf9, 0xff, 0xff, 0x3f, 0xfd, 0xff, 0xff, 0x3f, 0xff, 0xff, 0xff, 0x3f};

#define sm_cmd_width 16
#define sm_cmd_height 16
static char sm_cmd_bits[] = {
   0xff, 0xff, 0x01, 0x80, 0x01, 0xc0, 0xa9, 0xea, 0x51, 0xc5, 0x29, 0xe2,
   0x11, 0xf0, 0x09, 0xf8, 0x01, 0xdc, 0x31, 0xee, 0x3f, 0xd7, 0xaf, 0xeb,
   0xd1, 0xd5, 0xa9, 0xea, 0xfd, 0xff, 0xff, 0xff};

#define big_invcmd_width 35
#define big_invcmd_height 35
static char big_invcmd_bits[] = {
   0xe0, 0xff, 0xff, 0xff, 0x07, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00,
   0x00, 0x00, 0x06, 0x00, 0x55, 0x55, 0x55, 0x07, 0x00, 0xaa, 0xaa, 0xaa,
   0x07, 0x07, 0x54, 0x55, 0x55, 0x07, 0x0d, 0xa8, 0xaa, 0xaa, 0x07, 0x09,
   0x50, 0x65, 0x55, 0x07, 0x19, 0xa8, 0xa2, 0xaa, 0x07, 0x31, 0x50, 0x61,
   0x15, 0x06, 0x69, 0xf0, 0xa0, 0x8a, 0x07, 0x51, 0x00, 0x61, 0xc5, 0x07,
   0x69, 0x00, 0xa2, 0xe2, 0x07, 0xd1, 0x00, 0x60, 0x70, 0x07, 0xa9, 0x07,
   0x2c, 0xb8, 0x07, 0x51, 0x05, 0x30, 0x5c, 0x07, 0xa9, 0x1a, 0x20, 0xae,
   0x07, 0x51, 0x21, 0x40, 0x57, 0x07, 0xa9, 0x40, 0xc0, 0xab, 0x07, 0x51,
   0xe0, 0xc0, 0x55, 0x07, 0x29, 0xf0, 0x81, 0xaa, 0x07, 0x11, 0xdc, 0x00,
   0x55, 0x07, 0x09, 0xaf, 0x02, 0xaa, 0x07, 0xc5, 0xd7, 0x04, 0x54, 0x07,
   0xf3, 0xaa, 0x0e, 0xa8, 0x07, 0x7f, 0xd5, 0x0f, 0x40, 0x07, 0xaf, 0xaa,
   0x1b, 0x80, 0x07, 0x51, 0xd5, 0x35, 0x00, 0x07, 0xa9, 0xaa, 0xea, 0x01,
   0x06, 0x51, 0x55, 0x55, 0x03, 0x04, 0xa9, 0xaa, 0xaa, 0x06, 0x00, 0x51,
   0x55, 0x55, 0x0d, 0x00, 0xf9, 0xff, 0xff, 0x1f, 0x00, 0xfd, 0xff, 0xff,
   0x3f, 0x00, 0xff, 0xff, 0xff, 0x7f, 0x00};

#define sm_invcmd_width 19
#define sm_invcmd_height 18
static char sm_invcmd_bits[] = {
   0x10, 0x00, 0x06, 0xa0, 0xaa, 0x06, 0x43, 0x55, 0x07, 0x81, 0x2a, 0x06,
   0x0d, 0x11, 0x07, 0x19, 0x83, 0x07, 0x15, 0xc0, 0x07, 0x69, 0xe0, 0x06,
   0x95, 0x60, 0x07, 0x89, 0xb0, 0x06, 0x41, 0x41, 0x07, 0x71, 0x86, 0x06,
   0x5f, 0x07, 0x07, 0xef, 0x1b, 0x04, 0x55, 0x35, 0x00, 0xa9, 0x2a, 0x00,
   0xfd, 0x7f, 0x00, 0xff, 0xff, 0x00};

#define big_frw_width 28
#define big_frw_height 38
static char big_frw_bits[] = {
   0xff, 0xff, 0xff, 0x0f, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08, 0xb1, 0x7b, 0x6b, 0x08,
   0x01, 0x00, 0x00, 0x08, 0xb9, 0x77, 0xef, 0x08, 0x01, 0x00, 0x00, 0x08,
   0xb9, 0xf6, 0x1a, 0x08, 0x01, 0x00, 0x00, 0x08, 0x69, 0xde, 0xbc, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x59, 0x4f, 0x9e, 0x08, 0x01, 0x00, 0x00, 0x08,
   0xd9, 0x07, 0x00, 0x08, 0x81, 0x0c, 0x00, 0x08, 0x81, 0x18, 0x00, 0x08,
   0x81, 0x33, 0x00, 0x08, 0x01, 0x67, 0x00, 0x08, 0x01, 0xce, 0x00, 0x08,
   0x01, 0x9c, 0x01, 0x08, 0x01, 0x38, 0x03, 0x08, 0x01, 0x70, 0x06, 0x08,
   0x01, 0xe0, 0x0c, 0x08, 0x01, 0xc0, 0x19, 0x08, 0x01, 0x80, 0x33, 0x08,
   0x01, 0x00, 0x67, 0x08, 0x01, 0x00, 0xce, 0x08, 0x01, 0x00, 0x9c, 0x09,
   0x01, 0x00, 0xb8, 0x0b, 0x01, 0x00, 0x70, 0x0e, 0x01, 0x00, 0x60, 0x0b,
   0x01, 0x00, 0xc0, 0x09, 0x01, 0x00, 0x80, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0xff, 0xff, 0xff, 0x0f};

#define sm_frw_width 18
#define sm_frw_height 22
static char sm_frw_bits[] = {
   0xff, 0xff, 0x03, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0xd9, 0x76, 0x02,
   0x01, 0x00, 0x02, 0xf9, 0x00, 0x02, 0x21, 0x01, 0x02, 0x61, 0x02, 0x02,
   0xc1, 0x04, 0x02, 0x81, 0x09, 0x02, 0x01, 0x13, 0x02, 0x01, 0x26, 0x02,
   0x01, 0x6c, 0x02, 0x01, 0x98, 0x02, 0x01, 0x70, 0x02, 0x01, 0x20, 0x02,
   0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02,
   0x01, 0x00, 0x02, 0xff, 0xff, 0x03};

#define big_fro_width 28
#define big_fro_height 38
static char big_fro_bits[] = {
   0xff, 0xff, 0xff, 0x0f, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08, 0xb1, 0x7b, 0x6b, 0x08,
   0x01, 0x00, 0x00, 0x08, 0xb9, 0x77, 0xef, 0x08, 0x01, 0x00, 0x00, 0x08,
   0xb9, 0xf6, 0x1a, 0x08, 0x01, 0x00, 0x00, 0x08, 0xe9, 0xf6, 0x7a, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x39, 0xf6, 0xcc, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x79, 0x9c, 0x73, 0x08, 0x01, 0x00, 0x00, 0x08, 0xe1, 0xfc, 0xcc, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x39, 0xc6, 0xe3, 0x08, 0x01, 0x00, 0x00, 0x08,
   0xd9, 0x37, 0x6f, 0x08, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x01, 0x06, 0xc0, 0x08, 0x01, 0x09, 0x20, 0x09,
   0x81, 0x08, 0x10, 0x09, 0xe1, 0xc8, 0x09, 0x09, 0x11, 0x2d, 0x86, 0x09,
   0x09, 0x12, 0x04, 0x08, 0x09, 0x12, 0x04, 0x08, 0x09, 0x12, 0x04, 0x08,
   0x11, 0x21, 0x02, 0x08, 0xe1, 0xc0, 0x01, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0xff, 0xff, 0xff, 0x0f};

#define sm_fro_width 18
#define sm_fro_height 22
static char sm_fro_bits[] = {
   0xff, 0xff, 0x03, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0xd9, 0x76, 0x02,
   0x01, 0x00, 0x02, 0xb9, 0x6d, 0x02, 0x01, 0x00, 0x02, 0x69, 0x77, 0x02,
   0x01, 0x00, 0x02, 0xd9, 0x6e, 0x02, 0x01, 0x00, 0x02, 0xb9, 0x77, 0x02,
   0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x81, 0x40, 0x02, 0x41, 0xa1, 0x02,
   0xb1, 0x9d, 0x02, 0x49, 0x12, 0x02, 0x49, 0x12, 0x02, 0x31, 0x0c, 0x02,
   0x01, 0x00, 0x02, 0xff, 0xff, 0x03};

#define big_fm_width 28
#define big_fm_height 38
static char big_fm_bits[] = {
   0xff, 0xff, 0xff, 0x0f, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x0c,
   0xa9, 0xaa, 0xaa, 0x0e, 0x51, 0x55, 0x55, 0x0d, 0xa9, 0xaa, 0xaa, 0x0e,
   0x51, 0x55, 0x55, 0x0d, 0xa9, 0xaa, 0xaa, 0x0e, 0xf1, 0x55, 0x7d, 0x0d,
   0xf9, 0xab, 0xfe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xaf, 0xff, 0x0e,
   0xf1, 0xff, 0x7f, 0x0d, 0xf9, 0xff, 0xff, 0x0e, 0xf1, 0xff, 0x7f, 0x0d,
   0xf9, 0xfb, 0xfe, 0x0e, 0xf1, 0x77, 0x7f, 0x0d, 0xf9, 0xab, 0xfe, 0x0e,
   0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xab, 0xfe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d,
   0xf9, 0xab, 0xfe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xab, 0xfe, 0x0e,
   0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xab, 0xfe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d,
   0xf9, 0xab, 0xfe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xab, 0xfe, 0x0e,
   0xf1, 0x57, 0x7f, 0x0d, 0xa9, 0xaa, 0xaa, 0x0e, 0x51, 0x55, 0x55, 0x0d,
   0xa9, 0xaa, 0xaa, 0x0e, 0x51, 0x55, 0x55, 0x0d, 0xa9, 0xaa, 0xaa, 0x0e,
   0xfd, 0xff, 0xff, 0x0f, 0xff, 0xff, 0xff, 0x0f};

#define sm_fm_width 18
#define sm_fm_height 22
static char sm_fm_bits[] = {
   0xff, 0xff, 0x03, 0x01, 0x00, 0x02, 0x55, 0x55, 0x03, 0xb9, 0xba, 0x03,
   0x7d, 0x7d, 0x03, 0xf9, 0xbe, 0x03, 0xfd, 0x7f, 0x03, 0xb9, 0xbb, 0x03,
   0x7d, 0x7d, 0x03, 0xb9, 0xba, 0x03, 0x7d, 0x7d, 0x03, 0xb9, 0xba, 0x03,
   0x7d, 0x7d, 0x03, 0xb9, 0xba, 0x03, 0x7d, 0x7d, 0x03, 0xb9, 0xba, 0x03,
   0x7d, 0x7d, 0x03, 0xa9, 0xaa, 0x03, 0x55, 0x55, 0x03, 0xa9, 0xaa, 0x03,
   0xff, 0xff, 0x03, 0xff, 0xff, 0x03};

#define big_ps_width 28
#define big_ps_height 38
static big_char ps_bits[] = {
   0xff, 0xff, 0xff, 0x0f, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x0c,
   0xa9, 0xaa, 0xaa, 0x0e, 0x51, 0x55, 0x55, 0x0d, 0xf9, 0xff, 0xaa, 0x0e,
   0xf1, 0xff, 0x55, 0x0d, 0xf9, 0xff, 0xab, 0x0e, 0xf1, 0xff, 0x57, 0x0d,
   0xf9, 0xff, 0xaf, 0x0e, 0xf1, 0xd7, 0x5f, 0x0d, 0xf9, 0xab, 0xaf, 0x0e,
   0xf1, 0xd7, 0x5f, 0x0d, 0xf9, 0xab, 0xaf, 0x0e, 0xf1, 0xd7, 0x5f, 0x0d,
   0xf9, 0xab, 0xaf, 0x0e, 0xf1, 0xd7, 0x5f, 0x0d, 0xf9, 0xff, 0xaf, 0x0e,
   0xf1, 0xff, 0x57, 0x0d, 0xf9, 0xff, 0xab, 0x0e, 0xf1, 0xff, 0x55, 0x0d,
   0xf9, 0xab, 0xbe, 0x0e, 0xf1, 0x57, 0x7f, 0x0d, 0xf9, 0xab, 0xff, 0x0e,
   0xf1, 0x57, 0x77, 0x0d, 0xf9, 0xab, 0xaf, 0x0e, 0xf1, 0x57, 0x5f, 0x0d,
   0xf9, 0xab, 0xbe, 0x0e, 0xf1, 0x57, 0x7d, 0x0d, 0xf9, 0xab, 0xeb, 0x0e,
   0xf1, 0x57, 0x77, 0x0d, 0xf9, 0xaf, 0xff, 0x0e, 0xf9, 0x57, 0x7f, 0x0d,
   0xa9, 0xaa, 0xaa, 0x0e, 0x51, 0x55, 0x55, 0x0d, 0xa9, 0xaa, 0xaa, 0x0e,
   0xfd, 0xff, 0xff, 0x0f, 0xff, 0xff, 0xff, 0x0f};

#define sm_ps_width 18
#define sm_ps_height 22
static char sm_ps_bits[] = {
   0xff, 0xff, 0x03, 0x01, 0x00, 0x02, 0x55, 0x55, 0x03, 0xf9, 0xab, 0x03,
   0xfd, 0x57, 0x03, 0xb9, 0xae, 0x03, 0x7d, 0x5d, 0x03, 0xb9, 0xae, 0x03,
   0x7d, 0x5d, 0x03, 0xb9, 0xae, 0x03, 0xfd, 0x57, 0x03, 0xf9, 0xab, 0x03,
   0x7d, 0x55, 0x03, 0xb9, 0xbe, 0x03, 0x7d, 0x65, 0x03, 0xb9, 0x8e, 0x03,
   0x7d, 0x7d, 0x03, 0xfd, 0xaa, 0x03, 0xfd, 0x65, 0x03, 0xa9, 0xbe, 0x03,
   0x55, 0x55, 0x03, 0xff, 0xff, 0x03};

#define big_fx_width 30
#define big_fx_height 30
static char big_fx_bits[] = {
   0xff, 0xff, 0xff, 0x3f, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x30,
   0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x3d, 0xa9, 0xaa, 0xaa, 0x3a,
   0x51, 0x55, 0x56, 0x31, 0xa9, 0x2a, 0xaa, 0x38, 0x51, 0x15, 0x56, 0x3c,
   0xa9, 0x0a, 0x2a, 0x3e, 0x51, 0x05, 0x06, 0x3f, 0xa9, 0x02, 0x82, 0x3b,
   0x51, 0x01, 0xc0, 0x3d, 0xa9, 0x00, 0xe0, 0x3a, 0x51, 0x00, 0x70, 0x3d,
   0x29, 0x18, 0xb8, 0x3a, 0x11, 0x1c, 0x5c, 0x3d, 0x09, 0x1f, 0xae, 0x3a,
   0xc5, 0x17, 0x57, 0x3d, 0xf3, 0x9a, 0xab, 0x3a, 0x7f, 0xd5, 0x55, 0x3d,
   0xaf, 0xfa, 0xaa, 0x3a, 0x51, 0x75, 0x55, 0x3d, 0xa9, 0xba, 0xaa, 0x3a,
   0x51, 0x55, 0x55, 0x3d, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x3d,
   0xf9, 0xff, 0xff, 0x3f, 0xfd, 0xff, 0xff, 0x3f, 0xff, 0xff, 0xff, 0x3f};

#define sm_fx_width 16
#define sm_fx_height 16
static char sm_fx_bits[] = {
   0xff, 0xff, 0x01, 0x80, 0x01, 0xc0, 0xa9, 0xea, 0x51, 0xc5, 0x29, 0xe2,
   0x11, 0xf0, 0x09, 0xf8, 0x01, 0xdc, 0x31, 0xee, 0x3f, 0xd7, 0xaf, 0xeb,
   0xd1, 0xd5, 0xa9, 0xea, 0xfd, 0xff, 0xff, 0xff};

#define big_fno_width 28
#define big_fno_height 38
static char big_fno_bits[] = {
   0xff, 0xff, 0xff, 0x0f, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08, 0xa1, 0x88, 0xa4, 0x08,
   0xe1, 0xcc, 0xfe, 0x08, 0x01, 0x00, 0x00, 0x08, 0x41, 0xfd, 0x27, 0x08,
   0x61, 0xfe, 0xef, 0x08, 0x01, 0xff, 0x1f, 0x08, 0x81, 0xff, 0x3f, 0x08,
   0xc1, 0xff, 0x7f, 0x08, 0xc1, 0xff, 0x7f, 0x08, 0xc1, 0x0f, 0x7e, 0x08,
   0xc1, 0x0f, 0x7e, 0x08, 0xc1, 0x0f, 0x7e, 0x08, 0x01, 0x00, 0x7f, 0x08,
   0x01, 0xe0, 0x3f, 0x08, 0x01, 0xf0, 0x1f, 0x08, 0x01, 0xf0, 0x0f, 0x08,
   0x01, 0xf0, 0x03, 0x08, 0x01, 0xf0, 0x01, 0x08, 0x01, 0xf0, 0x01, 0x08,
   0x01, 0xf0, 0x01, 0x08, 0x01, 0xf0, 0x01, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x21, 0xf1, 0x95, 0x08, 0xe1, 0xf1, 0xf5, 0x08, 0x01, 0xf0, 0x01, 0x08,
   0x41, 0xf4, 0x85, 0x08, 0xe1, 0xf6, 0x9d, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x08,
   0x01, 0x00, 0x00, 0x08, 0xff, 0xff, 0xff, 0x0f};

#define sm_fno_width 18
#define sm_fno_height 22
static char sm_fno_bits[] = {
   0xff, 0xff, 0x03, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0xd9, 0x76, 0x02,
   0xe1, 0x1f, 0x02, 0xf9, 0x7f, 0x02, 0xf1, 0x3f, 0x02, 0xf9, 0x7f, 0x02,
   0xf1, 0x3c, 0x02, 0x59, 0x7e, 0x02, 0x01, 0x1f, 0x02, 0xb9, 0x7f, 0x02,
   0x81, 0x07, 0x02, 0xd9, 0x77, 0x02, 0x81, 0x07, 0x02, 0x59, 0x68, 0x02,
   0x81, 0x07, 0x02, 0xe9, 0x07, 0x02, 0x81, 0x07, 0x02, 0x01, 0x00, 0x02,
   0x01, 0x00, 0x02, 0xff, 0xff, 0x03};

#define big_dirup_width 30
#define big_dirup_height 23
static char big_dirup_bits[] = {
   0xff, 0xff, 0xff, 0x3f, 0x01, 0x00, 0x00, 0x20, 0xfd, 0x01, 0x00, 0x30,
   0xfd, 0xaa, 0xaa, 0x3a, 0x7d, 0x55, 0x55, 0x35, 0xfd, 0xaa, 0xaa, 0x3a,
   0xfd, 0x55, 0x15, 0x30, 0xed, 0xab, 0x0a, 0x30, 0xd5, 0x17, 0x40, 0x35,
   0xa9, 0x0f, 0xa0, 0x3a, 0x51, 0x5f, 0x55, 0x35, 0xa9, 0xbe, 0xaa, 0x3a,
   0x51, 0x5d, 0x55, 0x35, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35,
   0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x5f, 0x5f, 0x35, 0xa9, 0xae, 0xae, 0x3a,
   0x51, 0x5f, 0x5f, 0x35, 0xa9, 0xaa, 0xaa, 0x3a, 0x51, 0x55, 0x55, 0x35,
   0xfd, 0xff, 0xff, 0x3f, 0xff, 0xff, 0xff, 0x3f};

#define sm_dirup_width 20
#define sm_dirup_height 16
static char sm_dirup_bits[] = {
   0xff, 0xff, 0x0f, 0x01, 0x00, 0x08, 0xfd, 0x00, 0x0c, 0x7d, 0x55, 0x0d,
   0xbd, 0xaa, 0x0e, 0x7d, 0x15, 0x0c, 0xed, 0x80, 0x0e, 0xd5, 0x55, 0x0d,
   0xa9, 0xab, 0x0e, 0x51, 0x55, 0x0d, 0xa9, 0xaa, 0x0e, 0xd1, 0x5d, 0x0d,
   0xa9, 0xaa, 0x0e, 0x51, 0x55, 0x0d, 0xfd, 0xff, 0x0f, 0xff, 0xff, 0x0f};

>Menu MOTIF
>Guidance
Command and Help definitions specific to the OSF/Motif interface.

>Command MULTI_PANEL
>Parameters
+
TITL 'Title' C D= 'kuipPalette'
GEOM 'Geometry (wxh+x+y)' C D='300x700+0+0'
>Guidance
Define a kind of "palette of panels" where several panels can be grouped
togeter into one new KUIP/Motif container widget. All panel definitions
can remain the same.
.
   MULTI_PANEL 'My Palette' '200x100+0+0'
.
will display a "multi_panel" widget with the given title and geometry.
After that all panel definitions and executions will go into that widget.
This can be done simply by executing the KUIP macro containing your
panel definitions in the command line area, or, by selecting the
"Add button" entry in the File" menu of the "multi_panel" widget.
Then the user is requested the name of a KUIP macro which is automatically
executed for him.
.
To finish a "multi-panel" setting one just have to type:
.
   MULTI_PANEL end
.
This means that the following panel definitions and executions will be
displayed as usual individual panels and will not go into the "palette"
anymore.
.
To close a "palette" you can either use the appropriate button ("Close")
in the "File" menu of the palette, or type the command:
.
   MULTI_PANEL <title> close
.
This will close the palette which has been created with that <title>.
(N.B. Defaults title is "kuipPalette", and if several palettes 
have been created with the same title all these palettes will be closed).
.
or:
.
   MULTI_PANEL last close
.
This will close the "last palette" which corresponds to 
the last existing palette in the list.
.
>Action kxpalet%C

>Menu PANEL_HELP

>Command CREATE
>Parameters
BNAME 'Button label' C
FNAME 'File name' C
>Guidance
Get access to help corresponding to the button label in panels.
The help information must be provided in the KUIP macro file
which contain the panel description. For each button you want
to provide some help you have to write in your KUIP macro
something like:
.
application data my_button.hlp
   ... help info corresponding to "my_button" ...
my_button.hlp
MOTIF/PANEL_HELP my_button my_button.hlp
.
This defines some help information which corresponds to the
button "my_button" inside a user-defined panel.
>Action kxphlpc%C

>Command LIST
>Parameters
>Guidance
List all user defined help items for panels.
>Action kxphlpl%C

>Command DELETE
>Parameters
+
BNAME 'Button label' C
>Guidance
Delete help item with the corresponding button label,
or all user defined help items if no label is given.
>Action kxphlpd%C

>Command PRINT
>Parameters
BNAME 'Button label' C
>Guidance
Print (display in kxterm window) the user defined help corresponding
to a  button label inside a panel.
>Action kxphlpp%C

>Menu /MOTIF

>Command ICON
>Parameters
INAME 'Icon name' C
FNAME 'File name' C
>Guidance
Define icon from a bitmap file.
>Action kxicon%C

>Help_item HELP_BROWSER
>Guidance
       *** KUIP/Motif Browser Interface ***
.
.
The KUIP/Motif Browser interface is a general tool to display and
manipulate a tree structure of objects which are defined either
by KUIP itself (commands, files, macros, etc.) or by the
application.
.
The "Clone" button at the bottom creates a new independent browser window.
The "Close" button destroys the browser window. The Main Browser cannot
be destroyed (only iconized).
.
.
The middle part of the browser is divided into two windows:
.
  1) The left hand "FileList" or "browsable" window shows the list of
  all the currently connected browsables (defined with the ">Browse"
  directive in the CDF). The browsables "Commands", "Files" and "Macros"
  are built in KUIP itself. Each application can add to this
  list its own definitions for any kind of browsables (e.g. in Paw++:
  "Zebra", "Hbook", "Chains" and "PAWC"). Browsables can also be
  attached at run time by selecting the corresonding "Open" entry in
  the menu "File".
  Selecting one item/browsable in this window (with the left mouse button)
  displays the content of the browsable in the right hand window ("DirList"
  or "object" window).
  Pressing the right mouse button in this window shows a popup menu with
  all the possible actions which have been defined for this browsable.
  Note that the first entry of this menu is always "List": it displays the
  content of the browsable in the right hand window (this is automatically
  performed when the item is selected). The last entry is always "Help" and
  should give information concerning the selected browsable.
.
  2) The right hand "DirList" or "object" window shows the content of
  the currently selected browsable for the selected path (e.g. when you
  select the browsable "Macro", built in KUIP, you get all the KUIP
  macro files and sub-directories which are in the selected directory).
.
  Objects are selected by clicking on them with the left mouse button.
  Pressing the right mouse button pops up a menu of possible operations
  depending on the object type.
.
  An item in a popup menu is selected by pointing at the corresponding line
  and releasing the right mouse button.
  Double clicking with the left mouse button is equivalent to selecting
  the first menu item.
.
  Each menu item executes a command sequence where the name of the
  selected object is filled into the appropriate place.
  By default the command is executed immediately whenever possible
  (the commands executed can be seen by selecting "Echo Commands"
  in the "Options" menu of the Executive Window). In case some mandatory
  parameters are missing a panel is displayed where the remaining
  arguments have to be filled in. The command is executed then by
  pressing the "OK" or "Execute" button in that panel (if it is not
  the last one in the sequence of commands bound to the  menu item
  the application is blocked until the "OK" or "Cancel" button is pressed).
.
  The immediate command execution can be inhibited by holding down the
  CTRL-key BEFORE pressing the right mouse button.
  Some popup menus also contain different menu item for immediate and
  delayed execution, e.g. "Execute" and "Execute..."
  for class "Commands".
.
.
The top of the browser is a menu-bar with the following menus:
   File
      Open...
      Close...
         Applications can add these menu entries which give access
         to the commands that can be used to open or close a new
         browsable (e.g. in Paw++ there are the items "Open Hbook File..."
         and "Close Hbook File..." which interface to /HISTO/FILE and
         /FORTRAN/CLOSE).
      Exit
         Exit the application.
.
   View
      Icons
         Display the objects using icons with labels below them.
      Small Icons
         Display the object using small icons and labels on the right
         of the icon.
      No Icons
         Display only the labels.
      Titles
         Display small icons and extended labels on the right of the icons.
      Select All
         Select all objects.
      Filter...
         Show only the objects that pass the filter (not yet implemented).
.
   Options
      Raise Window
         Bring the different toplevel windows of the application to
         the top of the window stack.
      Command Argument Panel...
         Prompt the user for a command name. If the command is valid
         then the corresponding "command argument panel" with the list
         and description of all parameters will be displayed. If the
         command is ambiguous the user will be presented a list of all
         possible commands.
.
   Commands
      This menu gives access to the complete tree of commands defined
      by KUIP and the application in the form of a pulldown menu. When
      a terminal item (command) in this menu is selected then the
      corresponding "command argument panel" is displayed. The
      functionality of this menu is quite similar to the browsable
      "Commands" (this is just a matter of taste whether the user prefers
      to access commands through this pulldown menu or through the
      "Commands" browser). This menu is a so called "tear off" menu. By
      selecting the dashed line menu item one obtains a permanent window
      which contains all menu items. This facilitates frequent access to
      the same menu.
.
   Help
      On <application>
         Help on the application.
      On <application> Resources
         Help on the X/Motif, application specific, customizable resources.
      On KUIP Resources
         Help on the X/Motif, application independent, customizable
         resources.
      On Browser
         The help you are currently reading.
      On Panel
         Help on the KUIP/Motif panel interface (user definable panels
         of commands).
      On System Functions
         Help on the KUIP system functions.
.
.
Below the menubar the path of the currently selected directory is displayed.
The directory tree can be traversed upward by pointing in the desired part
of the path and clicking the left mouse button. Clicking a second time on
the same path segment performs the directory change and updates the object
window. To go downwards in the directory hierarchy double click on a
subdirectory displayed in the object window. To edit the directory path
by hand, click the right mouse button and edit the path. Hit the return
key to go to the new path.


>Command BROWSER
>Parameters
BNAME 'Browsable name' C
+
PNAME 'Path name' C
>Guidance
Open the corresponding browsable with the corresponding path (optional)
and displays its content.
>Action kxbrset%C

>Help_item HELP_PANEL
>Guidance
      *** KUIP/Motif PANEL Interface ***
.
.
The PANEL Interface allows to define command sequences which are
executed when the corresponding button is pressed (like "STYLE GP"
in PAW/X11).
The command sequence
   PANEL 0
   PANEL 4.06 'some string'
   PANEL 0 D 'This is my first panel' 500x300+500+600
creates a panel with 4 rows and 6 columns of buttons.
The text 'some string' should be long enough to fit the longest command
Sequence which should be put onto one of the buttons.
The 'PANEL 0 D' command defines the title and the window size and coordinates
in the form WxH+X+Y.
.
.
The panels can be edited interactively:
.
- Clicking with the right mouse button on an empty panel button the
user will be asked to give a definition to this button.
.
- Clicking with the left mouse button on a panel button removes its
definition.
.
.
The PANEL commands needed to recreate a panel can be saved into
a macro file by pressing the "Save Panel" button.
Panels can be reloaded either by executing the command 'PANEL 0 D'
or by pressing the "Command Panel" button in the "View" menu
of the Executive window and entering the corresponding file name.
.

>Help_item HELP_EDIT_PANEL
>Guidance
       *** KUIP/Motif PANEL Interface (Editing and Saving) ***
.
.
It is possible to edit  interactively a panel writing a new label
if the button is empty (and  consequently to define the action
which corresponds to that button).
.
.
When clicking with <mouse button 1> on an empty button
users will be asked to give some
text to write into that button.  To  change the label (and behavior)
of an already defined button, one  just
has to erase firstly this button by  clicking with <mouse button
3> on it. It is then possible to edit again the button by clicking
on it  with <mouse button 1>.
.
.
It is possible to  save this new panel  configuration  with  its
current size and position (which can also be modified interacti-
vely)  into a new  (or the same) macro file,  by clicking on the
button "Save Panel".  You will be  prompted for the  name to  be
given to this file.
.

>Help_item HELP_SAVE_PANEL
>Guidance
       *** KUIP/Motif PANEL Interface (Save Panel) ***
.
.
When users are pleased with the actual configuration of a  panel
(size, position and components) it is possible to  save it  in a
KUIP macro file for later  (re)use. You just have to give a name
to this macro and press <OK>. To  display this  panel afterwards
you just have to select the macro class in the "class window" and
double-click on the desired macro.
.

>Help_item HELP_DOLLAR_PANEL
>Guidance
       ***   KUIP/Motif PANEL Interface   ***
             (dollar sign inside a key)
.
.
The dollar sign inside a key is replaced by additional keyboard
input.
Example:
.
'VEC/PRI V($)'    | entering 11:20 will execute VEC/PRI V(11:20)
.

>Help_item HELP_MINUS_PANEL
>Guidance
       ***   KUIP/Motif PANEL Interface   ***
           (key ending with a minus sign)
.
.
Keys ending with a minus sign make an additional request of
keyboard input.
Example:
.
'VEC/PRI-'        | entering VAB will execute VEC/PRI VAB.
.

>Help_item HELP_MINUS2_PANEL
>Guidance
       ***      KUIP/Motif PANEL Interface      ***
           (key ending with a double minus sign)
.
.
Keys ending with a double minus sign make an additional request
of keyboard input.
Example:
.
VEC/PRI V--'     | entering AB will execute VEC/PRI VAB
.

>Help_item HELP_Commands
>Guidance
       *** Class "Commands" ***
.
.
The class "Commands" allows to browse the command tree defined
for the application and execute them.
.
There are three types of objects:
.
- Menus are directories containing other sub-menus or terminal commands.
.
- Executable commands
.
- Non-executable commands (see SET/VISIBILITY)

>Help_item HELP_Files
>Guidance
       *** Class "Files" ***
.
.
The class "Files" allows to browse the file system and
execute or edit files.

>Help_item HELP_Macro
>Guidance
       *** Class "Macro" ***
.
.
The class "Macro" allows to browse the file system for KUIP macro
files with extension ".kumac" and execute or edit them.

>Help_item HELP_GET_COMMAND_PANEL
>Guidance
       *** Command Argument Panel ***
.
.
It is  possible to retrieve a "command argument panel"
just by giving the name of a valid command, and pressing
<OK>, instead of browsing the whole command tree
structure in menu "Commands" of the Main Browser.
.
.
If users give a command which is ambiguous a
list of possible commands is displayed and
users can select the desired one with a single
click in the list.  The command panel will be
displayed by pressing <OK>.


>Help_item HELP_RESOURCES
>Guidance
       *** X Resources for KUIP/Motif ***
.
.
This is a list of the X resources available
to any KUIP/Motif based application (e.g. Paw++).
Resources control the appearance and behavior of
an application.
.
Users can specify their own values for
these resources in the standard X/Motif way
(via the .Xdefaults file or a file in the
/usr/lib/X11/app-defaults directory). One just
has to prefix the desired resource by the class
name of the application.
.
To customize Paw++, for instance, all the
resources have to be prefixed with "Paw++" or
they should be stored in the file
/usr/lib/X11/app-defaults/Paw++.
.
Any default values specified by KUIP are given
behind the resource name.
.
.
.
 *background:
.
Specify the background color for all windows.
.
 *foreground:
.
Specify the foreground color for all windows.
.
 *kxtermGeometry:                 650x450+0+0
.
Geometry of Kxterm, the kuip terminal emulator (executive window).
.
 *kuipGraphics_shell.geometry:    600x600-0+0
.
Geometry of the graphics window(s) (if any).
.
 *kuipBrowser_shell.geometry:     +0+485
.
Geometry of the browser(s).
.
 *fontList:                       *-helvetica-bold-r-normal*-120-*
.
Font used by all text areas.
.
 *kxtermTextFont:                 *-courier-medium-r-normal*-120-*
.
Font used in the text areas of Kxterm.
.
 *kxtermFont:                     *-helvetica-bold-r-normal*-120-*
.
Font used by Kxterm.
.
 *dirlist*fontList:               *-courier-bold-r-normal*-120-*
.
Font used for the icon labels in the browser.
.
 *helpFont:                       *-courier-bold-r-normal*-120-*
.
Font used for help windows.
.
 *fontList:                       *-helvetica-bold-r-normal*-120-*
.
Font for the menus, messages and boxes.
.
 *keyboardFocusPolicy:            explicit
.
If "explicit" (default), focus is determined by a mouse or keyboard
command. If "pointer", focus is determined by the mouse pointer
position.
.
 *doubleClickInterval:            250
.
The time span (in milliseconds) within which two button clicks
must occur to be considered a double click rather than two single
clicks.
.
 *dirlist*background:
.
Specify the background color for the iconbox part of the browser.
.
 *dirlist*<object>*iconForeground:          black
.
Specify the foreground color for the icons of type <object>.
.
 *dirlist*<object>*iconBackground:          white
.
Specify the background color for the icons of type <object>.
.
 *dirlist*<object>*iconLabelForeground:     white
.
Specify the foreground color for the labels of the icons of type <object>.
.
 *dirlist*<object>*iconLabelBackground:     black
.
Specify the background color for the labels of the icons of type <object>.
.
 *zoomEffect:                     True
.
Turn zoom effect on or off when going up and down directories in
the browser.
.
 *zoomSpeed:                      10
.
Specify speed of zoom effect in the browser.
.
Currently the following different <object>'s are defined:
.
 Cmd        -- Command
 InvCmd     -- Deactivated command
 Menu       -- Menu tree
 MacFile    -- Macro File
 RwFile     -- Read-write file
 RoFile     -- Readonly file
 NoFile     -- No access file
 ExFile     -- Executable file
 PSFile     -- PostScript file
 EPSFile    -- Encapsulated PostScript file
 DirFile    -- Directory
 DirUpFile  -- Up directory (..)
.
When using a black and white X Server use the following resource
settings to make the icons visible:
.
 *dirlist*<object>*iconForeground:          black
 *dirlist*<object>*iconBackground:          white
 *dirlist*<object>*iconLabelForeground:     black
 *dirlist*<object>*iconLabelBackground:     white

Various resource concerning the application appearance / behaviour:
.
 *scrolledCmdPanel:  auto (default)
                     never
                     always
Control wether the input parameters of command panels are put in a scrolled
window or not. "auto" (for automatic behaviour) means that it is true only
when the number of parameters exceeds 10 (otherwise parameters are in a
fixed-size area). "never" means that the input parameters area is always a
fixed-size and "always" that the input parameters area is always a
scrolled-window. The advantage of one of these possibilities depends
essentially on the font size, and the consecutive window size for
the automaticly generated command panels.


