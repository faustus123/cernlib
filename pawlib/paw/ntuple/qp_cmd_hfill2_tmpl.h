/*
 *  qp_cmd_hfill2_tmpl.h  --
 *
 *  Original: 16-May-1995 16:50
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 */

{
	register void		*o1;
	register void		*o2;
	register Float32	*o3;
	register int		n = 1, inc_o1, inc_o2, inc_o3;
	static float		w_1 = 1.0;
	float			x, y, w;

	o1 = &stack[frame[framep]];
	if ( frame_size[framep] != 1 ) {
		n = frame_size[framep];
		inc_o1 = 4 * datatype_size[ frame_type[framep] ];
	} else {
		inc_o1 = 0;
	}

	o2 = &stack[frame[framep-1]];
	if ( frame_size[framep-1] != 1 ) {
		n = frame_size[framep-1];
		inc_o2 = 4 * datatype_size[ frame_type[framep-1] ];
	} else {
		inc_o2 = 0;
	}

	o3 = (Float32 *) &stack[frame[framep-2]];
	if ( frame_size[framep-2] == 0 ) {	/* no selection */
		o3 = &w_1;
		inc_o3 = 0;
	} else if ( frame_size[framep-2] != 1 ) {
		inc_o3 = 0;
	} else {
		n = frame_size[framep-2];
		inc_o3 = 1;
	}

	for ( ; n > 0 ; n-- ) {
		if ( *o3 != 0. ) {
			switch( frame_type[framep] ) {
			case D_BOOL:	x = *(bool *) o1; break;
			case D_UINT:	x = *(UInt32 *) o1; break;
			case D_ULONG:	x = *(UInt64 *) o1; break;
			case D_INT:	x = *(Int32 *) o1; break;
			case D_LONG:	x = *(Int64 *) o1; break;
			case D_FLOAT:	x = *(Float32 *) o1; break;
			case D_DOUBLE:	x = *(Float64 *) o1; break;
			default:
				sf_report( "qp_cmd_hfill2_tmpl.h: DataType"
					" (%d) not implemented\n",
					frame_type[framep] );
				*errp = R_INTERNAL_ERROR;
				break;
			}
			o1 = (char *) o1 + inc_o1;

			switch( frame_type[framep-1] ) {
			case D_BOOL:	y = *(bool *) o2; break;
			case D_UINT:	y = *(UInt32 *) o2; break;
			case D_ULONG:	y = *(UInt64 *) o2; break;
			case D_INT:	y = *(Int32 *) o2; break;
			case D_LONG:	y = *(Int64 *) o2; break;
			case D_FLOAT:	y = *(Float32 *) o2; break;
			case D_DOUBLE:	y = *(Float64 *) o2; break;
			default:
				sf_report( "qp_cmd_hfill2_tmpl.h: DataType"
					" (%d) not implemented\n",
					frame_type[framep] );
				*errp = R_INTERNAL_ERROR;
				break;
			}
			o2 = (char *) o2 + inc_o2;

			w = *o3;
			o3 += inc_o3;

			HFILL( qp_hfill_id, x, y, w );
		}
	}
}
