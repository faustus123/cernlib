/*
 *  qp_exe_dyn_str.h  --
 *
 *  Original:  7-Feb-1996 15:45
 *
 *  Author:   Maarten Ballintijn <Maarten.Ballintijn@cern.ch>
 *
 *  $Id$
 *
 *  $Log$
 *  Revision 1.3  1996/04/29 11:42:30  maartenb
 *  - Small cleanup.
 *
 *  Revision 1.2  1996/04/23 18:38:26  maartenb
 *  - Add RCS keywords
 *
 *
 */

/* 1 dimensional case */
case FC_CWN_DYN_BOOL + (OP_BASE):
		{
			int	i, stride, start, end, max;
			OP_TYPE	*ptr;

			stride = *pc++;	/* stride is always one for 1 dim */
					/* but we leave it in for regularity */
			max = *pc++;
			if ( max <= 0 ) {
				/* variable length, get index variable */
				max = *CWNBlock[-max].p;
			}

			start = *pc++;
			if ( start == 0 ) {
				/* pop */
				start = stack[frame[framep]];
				POP_FRAME(1);
			}

			end = *pc++;
			if ( end == -1 ) {
				end = start;
			} else if ( end == -2 ) {
				end = max;
			} else if ( end == 0 ) {
				/* pop */
				end = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start ) {
				sf_report( "Evt %ld: Index out of range,"
					" start(%d) < 1\n", ievt, start );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end > max ) {
				sf_report( "Evt %ld: Index out of range,"
					" end(%d) > max(%d)\n",
					ievt, end, max );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}

			if ( start <= end ) {
				/* put on stack */
				NEW_FRAME( OP_DTYPE, end - start + 1, ptr );
				for ( i=start-1 ; i < end ; i++ ) {
					*ptr++ = ((OP_TYPE *) np->p)[ i ];

				}

				if ( info_flag ) {
					SHAPE_PUSH_1( end - start + 1 );
				}
			} else {
				/* put empty frame on stack */
				NEW_FRAME( OP_DTYPE, 0, ptr );
				if ( info_flag ) {
					SHAPE_PUSH_1( 0 );
				}
			}
		}
		break;

/* 2 dimensional case */
case FC_CWN_DYN_BOOL + (OP_BASE) + 16:
		{
			int		i, j, info_mask;
			int		stride1, start1, end1, max1;
			int		stride2, start2, end2, max2;
			OP_TYPE		*ptr;

			info_mask = 0;
			stride1 = *pc++;/* stride is always one for 1 dim */
					/* but we leave it in for regularity */
			max1 = *pc++;
			if ( max1 <= 0 ) {
				/* variable length, get index variable */
				max1 = *CWNBlock[-max1].p;
			}

			start1 = *pc++;
			if ( start1 == 0 ) {
				/* pop */
				start1 = stack[frame[framep]];
				POP_FRAME(1);
			}

			end1 = *pc++;
			if ( end1 == -1 ) {
				end1 = start1;
				info_mask |= 1;
			} else if ( end1 == -2 ) {
				end1 = max1;
			} else if ( end1 == 0 ) {
				/* pop */
				end1 = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start1 ) {
				sf_report( "Evt %ld: Index 1 out of range,"
					" start(%d) < 1\n", ievt, start1 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end1 > max1 ) {
				sf_report( "Evt %ld: Index 1 out of range,"
					" end(%d) > max(%d)\n",
					ievt, end1, max1 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}


			stride2 = *pc++;/* stride is always one for 1 dim */
					/* but we leave it in for regularity */
			max2 = *pc++;
			if ( max2 <= 0 ) {
				/* variable length, get index variable */
				max2 = *CWNBlock[-max2].p;
			}

			start2 = *pc++;
			if ( start2 == 0 ) {
				/* pop */
				start2 = stack[frame[framep]];
				POP_FRAME(1);
			}

			end2 = *pc++;
			if ( end2 == -1 ) {
				end2 = start2;
				info_mask |= 2;
			} else if ( end2 == -2 ) {
				end2 = max2;
			} else if ( end2 == 0 ) {
				/* pop */
				end2 = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start2 ) {
				sf_report( "Evt %ld: Index 2 out of range,"
					" start(%d) < 1\n", ievt, start2 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end2 > max2 ) {
				sf_report( "Evt %ld: Index 2 out of range,"
					" end(%d) > max(%d)\n",
					ievt, end2, max2 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}

			if ( (start1<=end1) && max2 != 0 && (start2<=end2) ) {
				/* put on stack */
				NEW_FRAME( OP_DTYPE, (end1-start1+1)*(end2-start2+1), ptr );
				for ( j=start2-1 ; j < end2 ; j++ ) {
					for ( i=start1-1 ; i < end1 ; i++ ) {
						*ptr++ = ((OP_TYPE *) np->p)[ i + j * stride2 ];
					}
				}
			} else {
				/* put empty frame on stack */
				NEW_FRAME( OP_DTYPE, 0, ptr );
			}

			if ( info_flag ) {
				int		r1, r2;

				r1 = start1<=end1 ? end1-start1+1 : 0 ;
				r2 = start2<=end2 ? end2-start2+1 : 0 ;

				switch ( info_mask ) {
				case 0:
					SHAPE_PUSH_2( r1, r2 ); break;
				case 1:
					SHAPE_PUSH_1( r2 ); break;
				case 2:
					SHAPE_PUSH_1( r1 ); break;
				case 3:
					qp_abort( "scalar does have shape\n" );
					break;
				}
			}
		}
		break;

/* 3 dimensional case */
case FC_CWN_DYN_BOOL + (OP_BASE) + 32:
		{
			int		i, j, k, info_mask;
			int		stride1, start1, end1, max1;
			int		stride2, start2, end2, max2;
			int		stride3, start3, end3, max3;
			OP_TYPE		*ptr;

			info_mask = 0;
			stride1 = *pc++;/* stride is always one for 1 dim */
					/* but we leave it in for regularity */
			max1 = *pc++;
			if ( max1 <= 0 ) {
				/* variable length, get index variable */
				max1 = *CWNBlock[-max1].p;
			}

			start1 = *pc++;
			if ( start1 == 0 ) {
				/* pop */
				start1 = stack[frame[framep]];
				POP_FRAME(1);
			}

			end1 = *pc++;
			if ( end1 == -1 ) {
				end1 = start1;
				info_mask |= 1;
			} else if ( end1 == -2 ) {
				end1 = max1;
			} else if ( end1 == 0 ) {
				/* pop */
				end1 = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start1 ) {
				sf_report( "Evt %ld: Index 1 out of range,"
					" start(%d) < 1\n", ievt, start1 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end1 > max1 ) {
				sf_report( "Evt %ld: Index 1 out of range,"
					" end(%d) > max(%d)\n",
					ievt, end1, max1 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}


			stride2 = *pc++;

			max2 = *pc++;
			if ( max2 <= 0 ) {
				/* variable length, get index variable */
				max2 = *CWNBlock[-max2].p;
			}

			start2 = *pc++;
			if ( start2 == 0 ) {
				/* pop */
				start2 = stack[frame[framep]];
				POP_FRAME(1);
			}

			end2 = *pc++;
			if ( end2 == -1 ) {
				end2 = start2;
				info_mask |= 2;
			} else if ( end2 == -2 ) {
				end2 = max2;
			} else if ( end2 == 0 ) {
				/* pop */
				end2 = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start2 ) {
				sf_report( "Evt %ld: Index 2 out of range,"
					" start(%d) < 1\n", ievt, start2 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end2 > max2 ) {
				sf_report( "Evt %ld: Index 2 out of range,"
					" end(%d) > max(%d)\n",
					ievt, end2, max2 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}


			stride3 = *pc++;
			max3 = *pc++;
			if ( max3 <= 0 ) {
				/* variable length, get index variable */
				max3 = *CWNBlock[-max3].p;
			}

			start3 = *pc++;
			if ( start3 == 0 ) {
				/* pop */
				start3 = stack[frame[framep]];
				POP_FRAME(1);
			}

			end3 = *pc++;
			if ( end3 == -1 ) {
				end3 = start3;
				info_mask |= 4;
			} else if ( end3 == -2 ) {
				end3 = max3;
			} else if ( end3 == 0 ) {
				/* pop */
				end3 = stack[frame[framep]];
				POP_FRAME(1);
			}

			/* now check consistency */

			if ( 1 > start3 ) {
				sf_report( "Evt %ld: Index 3 out of range,"
					" start(%d) < 1\n", ievt, start3 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}
			if ( end3 > max3 ) {
				sf_report( "Evt %ld: Index 3 out of range,"
					" end(%3) > max(%3)\n",
					ievt, end3, max3 );
				*errp = R_MATH_ERROR;
				running = FALSE;
				break;
			}

			if ( (start1<=end1) && (start2<=end2) &&
				max3 != 0 && (start3<=end3) ) {
				/* put on stack */
				NEW_FRAME( OP_DTYPE, (end1-start1+1)*(end2-start2+1)*(end3-start3+1), ptr );
				for ( k=start3-1 ; k < end3 ; k++ ) {
					for ( j=start2-1 ; j < end2 ; j++ ) {
						for ( i=start1-1 ; i < end1 ; i++ ) {
							*ptr++ =((OP_TYPE *)np->p)[ i + j * stride2 + k * stride3 ];
						}
					}
				}
			} else {
				/* put empty frame on stack */
				NEW_FRAME( OP_DTYPE, 0, ptr );
			}

			if ( info_flag ) {
				int		r1, r2, r3;

				r1 = start1<=end1 ? end1-start1+1 : 0 ;
				r2 = start2<=end2 ? end2-start2+1 : 0 ;
				r3 = start3<=end3 ? end3-start3+1 : 0 ;

				switch ( info_mask ) {
				case 0:
					SHAPE_PUSH_3( r1, r2, r3 ); break;
				case 1:
					SHAPE_PUSH_2( r2, r3 ); break;
				case 2:
					SHAPE_PUSH_2( r1, r3 ); break;
				case 3:
					SHAPE_PUSH_1( r3 ); break;
				case 4:
					SHAPE_PUSH_2( r1, r2 ); break;
				case 5:
					SHAPE_PUSH_1( r2 ); break;
				case 6:
					SHAPE_PUSH_1( r1 ); break;
				case 7:
					qp_abort( "scalar does have shape\n" );
					break;
				}
			}
		}
		break;
