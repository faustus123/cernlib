/*DECK ID>, ISHFT. */
unsigned int ishft_(arg,len)
unsigned int *arg;
int *len;
{
/*
  Profides the value of the argument ARG with the bits shifted.
  Bits shifted out to the left or right are lost, and zeros are shifted
  in from the opposite end.      CNL 210
*/
     return((*len > 0)? *arg << *len: *arg >> (-*len));
}
