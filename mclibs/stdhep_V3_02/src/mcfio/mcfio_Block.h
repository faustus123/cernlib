/*******************************************************************************
*									       *
* mcfio_Block.h --  Include file for mcfast Direct i/o layer. 		       *
*									       *
* Copyright (c) 1994 Universities Research Association, Inc.		       *
* All rights reserved.							       *
*									       *
*******************************************************************************/
int mcfioC_Block(int stream, int blkid, 
 bool_t xdr_filtercode(XDR *xdrs, int *blockid, int *ntot, char **version));
