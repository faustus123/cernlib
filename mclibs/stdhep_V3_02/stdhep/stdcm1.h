/*
** STDHEP begin/end run COMMON block
** See product StDhep
*/
extern struct stdcm1 {
float stdecom;   /*   STDECOM  - center-of-mass energy */
float stdxsec;   /*   STDXSEC  - cross-section */
double stdseed1; /*   STDSEED1 - random number seed */
double stdseed2; /*   STDSEED2 - random number seed */
int nevtreq;     /*   NEVTREQ  - number of events to be generated */
int nevtgen;     /*   NEVTGEN  - number of events actually generated */
int nevtwrt;     /*   NEVTWRT  - number of events written to output file */
} stdcm1_;
