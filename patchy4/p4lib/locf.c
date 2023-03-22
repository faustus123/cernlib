/*DECK ID>, LOCF. */
/*>    ROUTINE LOCF
  CERN PROGLIB# N100    LOCF            .VERSION KERNFOR  4.26  910313
*/
#define NADUPW 4   /* Number of ADdress Units Per Word */
#define LADUPW 2   /* Logarithm base 2 of ADdress Units Per Word */
unsigned long locf_(iadr)
   char *iadr;
{
   return( ((unsigned long int) iadr) >> LADUPW );
}
/*> END <----------------------------------------------------------*/
