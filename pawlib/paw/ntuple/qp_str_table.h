/*
 *  qp_str_table.h  --
 *	Declare a fast sorted string with fast lookup
 *
 *  Original:  6-Nov-1995 11:37
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

#ifndef CERN_QP_STR_TABLE
#define CERN_QP_STR_TABLE


typedef struct _str_tab_ {
	int		n;	/* number of entries in the table */
} StrTab;


StrTab *
qp_strtab_new(
	int	size
	);

void
qp_strtab_free(
	StrTab *	strtab
	);

#endif	/*	CERN_QP_STR_TABLE	*/
