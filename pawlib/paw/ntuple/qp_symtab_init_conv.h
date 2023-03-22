/*
 *  qp_symtab_init_conv.h  --
 *
 *  Original: 23-Apr-1996 20:21
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 *  $Id$
 *
 *  $Log$
 *  Revision 1.3  1996/04/23 18:39:04  maartenb
 *  - Add RCS keywords
 *
 *
 */

{ "B_2_B", FC_B_2_B, &d_u_bool, 1, {&d_u_bool,} },
{ "BOOL", FC_B_2_B, &d_u_bool, 1, {&d_u_bool,} },
{ "LOGICAL", FC_B_2_B, &d_u_bool, 1, {&d_u_bool,} },
{ "B_2_U", FC_B_2_U, &d_u_UInt32, 1, {&d_u_bool,} },
{ "UINT", FC_B_2_U, &d_u_UInt32, 1, {&d_u_bool,} },
{ "B_2_LU", FC_B_2_LU, &d_u_UInt64, 1, {&d_u_bool,} },
{ "ULONG", FC_B_2_LU, &d_u_UInt64, 1, {&d_u_bool,} },
{ "B_2_I", FC_B_2_I, &d_u_Int32, 1, {&d_u_bool,} },
{ "INT", FC_B_2_I, &d_u_Int32, 1, {&d_u_bool,} },
{ "B_2_LI", FC_B_2_LI, &d_u_Int64, 1, {&d_u_bool,} },
{ "LONG", FC_B_2_LI, &d_u_Int64, 1, {&d_u_bool,} },
{ "B_2_F", FC_B_2_F, &d_u_Float32, 1, {&d_u_bool,} },
{ "REAL", FC_B_2_F, &d_u_Float32, 1, {&d_u_bool,} },
{ "FLOAT", FC_B_2_F, &d_u_Float32, 1, {&d_u_bool,} },
{ "B_2_LF", FC_B_2_LF, &d_u_Float64, 1, {&d_u_bool,} },
{ "DOUBLE", FC_B_2_LF, &d_u_Float64, 1, {&d_u_bool,} },
{ "U_2_B", FC_U_2_B, &d_u_bool, 1, {&d_u_UInt32,} },
{ "BOOL", FC_U_2_B, &d_u_bool, 1, {&d_u_UInt32,} },
{ "LOGICAL", FC_U_2_B, &d_u_bool, 1, {&d_u_UInt32,} },
{ "U_2_U", FC_U_2_U, &d_u_UInt32, 1, {&d_u_UInt32,} },
{ "UINT", FC_U_2_U, &d_u_UInt32, 1, {&d_u_UInt32,} },
{ "U_2_LU", FC_U_2_LU, &d_u_UInt64, 1, {&d_u_UInt32,} },
{ "ULONG", FC_U_2_LU, &d_u_UInt64, 1, {&d_u_UInt32,} },
{ "U_2_I", FC_U_2_I, &d_u_Int32, 1, {&d_u_UInt32,} },
{ "INT", FC_U_2_I, &d_u_Int32, 1, {&d_u_UInt32,} },
{ "U_2_LI", FC_U_2_LI, &d_u_Int64, 1, {&d_u_UInt32,} },
{ "LONG", FC_U_2_LI, &d_u_Int64, 1, {&d_u_UInt32,} },
{ "U_2_F", FC_U_2_F, &d_u_Float32, 1, {&d_u_UInt32,} },
{ "REAL", FC_U_2_F, &d_u_Float32, 1, {&d_u_UInt32,} },
{ "FLOAT", FC_U_2_F, &d_u_Float32, 1, {&d_u_UInt32,} },
{ "U_2_LF", FC_U_2_LF, &d_u_Float64, 1, {&d_u_UInt32,} },
{ "DOUBLE", FC_U_2_LF, &d_u_Float64, 1, {&d_u_UInt32,} },
{ "LU_2_B", FC_LU_2_B, &d_u_bool, 1, {&d_u_UInt64,} },
{ "BOOL", FC_LU_2_B, &d_u_bool, 1, {&d_u_UInt64,} },
{ "LOGICAL", FC_LU_2_B, &d_u_bool, 1, {&d_u_UInt64,} },
{ "LU_2_U", FC_LU_2_U, &d_u_UInt32, 1, {&d_u_UInt64,} },
{ "UINT", FC_LU_2_U, &d_u_UInt32, 1, {&d_u_UInt64,} },
{ "LU_2_LU", FC_LU_2_LU, &d_u_UInt64, 1, {&d_u_UInt64,} },
{ "ULONG", FC_LU_2_LU, &d_u_UInt64, 1, {&d_u_UInt64,} },
{ "LU_2_I", FC_LU_2_I, &d_u_Int32, 1, {&d_u_UInt64,} },
{ "INT", FC_LU_2_I, &d_u_Int32, 1, {&d_u_UInt64,} },
{ "LU_2_LI", FC_LU_2_LI, &d_u_Int64, 1, {&d_u_UInt64,} },
{ "LONG", FC_LU_2_LI, &d_u_Int64, 1, {&d_u_UInt64,} },
{ "LU_2_F", FC_LU_2_F, &d_u_Float32, 1, {&d_u_UInt64,} },
{ "REAL", FC_LU_2_F, &d_u_Float32, 1, {&d_u_UInt64,} },
{ "FLOAT", FC_LU_2_F, &d_u_Float32, 1, {&d_u_UInt64,} },
{ "LU_2_LF", FC_LU_2_LF, &d_u_Float64, 1, {&d_u_UInt64,} },
{ "DOUBLE", FC_LU_2_LF, &d_u_Float64, 1, {&d_u_UInt64,} },
{ "I_2_B", FC_I_2_B, &d_u_bool, 1, {&d_u_Int32,} },
{ "BOOL", FC_I_2_B, &d_u_bool, 1, {&d_u_Int32,} },
{ "LOGICAL", FC_I_2_B, &d_u_bool, 1, {&d_u_Int32,} },
{ "I_2_U", FC_I_2_U, &d_u_UInt32, 1, {&d_u_Int32,} },
{ "UINT", FC_I_2_U, &d_u_UInt32, 1, {&d_u_Int32,} },
{ "I_2_LU", FC_I_2_LU, &d_u_UInt64, 1, {&d_u_Int32,} },
{ "ULONG", FC_I_2_LU, &d_u_UInt64, 1, {&d_u_Int32,} },
{ "I_2_I", FC_I_2_I, &d_u_Int32, 1, {&d_u_Int32,} },
{ "INT", FC_I_2_I, &d_u_Int32, 1, {&d_u_Int32,} },
{ "I_2_LI", FC_I_2_LI, &d_u_Int64, 1, {&d_u_Int32,} },
{ "LONG", FC_I_2_LI, &d_u_Int64, 1, {&d_u_Int32,} },
{ "I_2_F", FC_I_2_F, &d_u_Float32, 1, {&d_u_Int32,} },
{ "REAL", FC_I_2_F, &d_u_Float32, 1, {&d_u_Int32,} },
{ "FLOAT", FC_I_2_F, &d_u_Float32, 1, {&d_u_Int32,} },
{ "I_2_LF", FC_I_2_LF, &d_u_Float64, 1, {&d_u_Int32,} },
{ "DOUBLE", FC_I_2_LF, &d_u_Float64, 1, {&d_u_Int32,} },
{ "LI_2_B", FC_LI_2_B, &d_u_bool, 1, {&d_u_Int64,} },
{ "BOOL", FC_LI_2_B, &d_u_bool, 1, {&d_u_Int64,} },
{ "LOGICAL", FC_LI_2_B, &d_u_bool, 1, {&d_u_Int64,} },
{ "LI_2_U", FC_LI_2_U, &d_u_UInt32, 1, {&d_u_Int64,} },
{ "UINT", FC_LI_2_U, &d_u_UInt32, 1, {&d_u_Int64,} },
{ "LI_2_LU", FC_LI_2_LU, &d_u_UInt64, 1, {&d_u_Int64,} },
{ "ULONG", FC_LI_2_LU, &d_u_UInt64, 1, {&d_u_Int64,} },
{ "LI_2_I", FC_LI_2_I, &d_u_Int32, 1, {&d_u_Int64,} },
{ "INT", FC_LI_2_I, &d_u_Int32, 1, {&d_u_Int64,} },
{ "LI_2_LI", FC_LI_2_LI, &d_u_Int64, 1, {&d_u_Int64,} },
{ "LONG", FC_LI_2_LI, &d_u_Int64, 1, {&d_u_Int64,} },
{ "LI_2_F", FC_LI_2_F, &d_u_Float32, 1, {&d_u_Int64,} },
{ "REAL", FC_LI_2_F, &d_u_Float32, 1, {&d_u_Int64,} },
{ "FLOAT", FC_LI_2_F, &d_u_Float32, 1, {&d_u_Int64,} },
{ "LI_2_LF", FC_LI_2_LF, &d_u_Float64, 1, {&d_u_Int64,} },
{ "DOUBLE", FC_LI_2_LF, &d_u_Float64, 1, {&d_u_Int64,} },
{ "F_2_B", FC_F_2_B, &d_u_bool, 1, {&d_u_Float32,} },
{ "BOOL", FC_F_2_B, &d_u_bool, 1, {&d_u_Float32,} },
{ "LOGICAL", FC_F_2_B, &d_u_bool, 1, {&d_u_Float32,} },
{ "F_2_U", FC_F_2_U, &d_u_UInt32, 1, {&d_u_Float32,} },
{ "UINT", FC_F_2_U, &d_u_UInt32, 1, {&d_u_Float32,} },
{ "F_2_LU", FC_F_2_LU, &d_u_UInt64, 1, {&d_u_Float32,} },
{ "ULONG", FC_F_2_LU, &d_u_UInt64, 1, {&d_u_Float32,} },
{ "F_2_I", FC_F_2_I, &d_u_Int32, 1, {&d_u_Float32,} },
{ "INT", FC_F_2_I, &d_u_Int32, 1, {&d_u_Float32,} },
{ "F_2_LI", FC_F_2_LI, &d_u_Int64, 1, {&d_u_Float32,} },
{ "LONG", FC_F_2_LI, &d_u_Int64, 1, {&d_u_Float32,} },
{ "F_2_F", FC_F_2_F, &d_u_Float32, 1, {&d_u_Float32,} },
{ "REAL", FC_F_2_F, &d_u_Float32, 1, {&d_u_Float32,} },
{ "FLOAT", FC_F_2_F, &d_u_Float32, 1, {&d_u_Float32,} },
{ "F_2_LF", FC_F_2_LF, &d_u_Float64, 1, {&d_u_Float32,} },
{ "DOUBLE", FC_F_2_LF, &d_u_Float64, 1, {&d_u_Float32,} },
{ "LF_2_B", FC_LF_2_B, &d_u_bool, 1, {&d_u_Float64,} },
{ "BOOL", FC_LF_2_B, &d_u_bool, 1, {&d_u_Float64,} },
{ "LOGICAL", FC_LF_2_B, &d_u_bool, 1, {&d_u_Float64,} },
{ "LF_2_U", FC_LF_2_U, &d_u_UInt32, 1, {&d_u_Float64,} },
{ "UINT", FC_LF_2_U, &d_u_UInt32, 1, {&d_u_Float64,} },
{ "LF_2_LU", FC_LF_2_LU, &d_u_UInt64, 1, {&d_u_Float64,} },
{ "ULONG", FC_LF_2_LU, &d_u_UInt64, 1, {&d_u_Float64,} },
{ "LF_2_I", FC_LF_2_I, &d_u_Int32, 1, {&d_u_Float64,} },
{ "INT", FC_LF_2_I, &d_u_Int32, 1, {&d_u_Float64,} },
{ "LF_2_LI", FC_LF_2_LI, &d_u_Int64, 1, {&d_u_Float64,} },
{ "LONG", FC_LF_2_LI, &d_u_Int64, 1, {&d_u_Float64,} },
{ "LF_2_F", FC_LF_2_F, &d_u_Float32, 1, {&d_u_Float64,} },
{ "REAL", FC_LF_2_F, &d_u_Float32, 1, {&d_u_Float64,} },
{ "FLOAT", FC_LF_2_F, &d_u_Float32, 1, {&d_u_Float64,} },
{ "LF_2_LF", FC_LF_2_LF, &d_u_Float64, 1, {&d_u_Float64,} },
{ "DOUBLE", FC_LF_2_LF, &d_u_Float64, 1, {&d_u_Float64,} },
