/*
 *  sfcomp.c  --
 *	Implement the kuip action routine for expression
 *	analysis-test
 *
 *  Original: 20-Oct-1994 10:46
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

#include	"../extern/dbmalloc.h"

#include	<stdio.h>
#include	<string.h>

#include	"../util/str.h"	/* placed because of IRIX _INT in stdarg.h */
/*@ignore*/
#include	"cfortran.h"
#include	"../extern/hcflag.h"
#include	"../extern/packlib.h"
/*@end*/

#include	"../extern/quest.h"
#include	"../compile/qp_compile.h"
#include	"../compile/symtab.h"
#include	"../exe/qp_execute.h"
#include	"../util/sf_report.h"
#include	"errors.h"
#include	"qp_query.h"
#include	"qp_command.h"


#define HGETNT(CHPATH) \
	CCALLSFSUB1(HGETNT,hgetnt,STRING,CHPATH)

int	ku_geti( void );
char	*ku_getf( void );

int	sfcompile( char * expr );


static bool	verbose = TRUE;

void
sfcomp_( void )
{
	QuerySrc *	qs;
	QueryExe *	qe;
	char	arg_idn[512];	/* yuck <- make dynamic + check */
	char	expr[512];
	long	ifrom;
	long	inum;
	int	entries;
	char	*p, *s;
	int	r = R_OK;
	int		id, i;
	int		nexpr;
	char *		id_path;
	char *		selection;
	char *		expressions[MAX_EXPRS];

	if ( setjmp( qp_abort_env ) != 0 ) {
		return;	/* we had a serious problem */
	} else {
		qp_abort_env_valid = 1;
	}

	strncpy( arg_idn, ku_getf(), sizeof( arg_idn ) );
	strncpy( expr, ku_getf(), sizeof( expr ) );
	inum = ku_geti();
	ifrom = ku_geti();

	printf( "%s with '%s'\n", arg_idn, expr );

	/* HGETNT(arg_idn);	*/
	r = h_load_nt( arg_idn, &id_path, &id );

	if ( r != R_OK )
		return;
	
	/* the first part is the selection expresion */
	p = strchr( expr, '%' );
	if ( p != 0 ) {
		*p = '\0';
		p += 1;
	} else {
		p = strchr( expr, '\0' );
	}

	if ( strlen( expr ) > 0 ) {
		selection =  str_new( expr );
	} else {
		selection = 0;
	}

	nexpr = 0;
	while ( *p != '\0' ) {
		s = strchr( p, '%' );
		if ( s != 0 ) {
			*s = '\0';
			s += 1;
		} else {
			s = strchr( expr, '\0' );
		}
		if ( strlen( p ) > 0 ) {
			expressions[nexpr] = str_new( p );
			nexpr += 1;
		}
		p = s;
	}

	qs = qp_qs_new( id_path, id, selection, nexpr, expressions );
	str_del( id_path );
	str_del( selection );
	for ( i=0 ; i < nexpr ; i++ ) str_del( expressions[i] );

	qe = qp_compile( qs, &r );
	qp_qs_free( qs );

	if ( r == R_OK ) {

		HNOENT( qe->id, entries );

		if ( ifrom > entries ) {
			sf_report( "Ntuple has only %ld events\n"
				"\tNo events processed\n" );
			inum = 0;
			ifrom = 1;
		} else if ( ifrom + inum - 1 > entries ) {
			inum = entries - ifrom + 1;
			sf_report( "Ntuple has only %ld events\n\tnumber of "
				"events to process reduced to %ld\n",
				entries, inum );
		}

		qp_execute( qe, ifrom, inum, CMD_DUMP, &r );

		qp_qe_free( qe );
	}

	fflush(stdout);
	fflush(stderr);

	/* just to be sure ... we do not want to come back here */
	qp_abort_env_valid = 0;
}
