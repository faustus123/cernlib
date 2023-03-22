/*
** Basic COMMON block from STDHEP: the HEPEVT COMMON block 
** See product StDhep
*/
/*  note that to avoid alignment problems, structures and common blocks
    should be in the order: double precision, real, integer.
*/
#define NMXHEP 4000
extern struct hepevt {
int nevhep;		/* The event number */
int nhep;		/* The number of entries in this event */
int isthep[NMXHEP]; 	/* The Particle id */
int idhep[NMXHEP];      /* The particle id */
int jmohep[NMXHEP][2];    /* The position of the mother particle */
int jdahep[NMXHEP][2];    /* Position of the first daughter... */
double phep[NMXHEP][5];    /* 4-Momentum, mass */
double vhep[NMXHEP][4];    /* Vertex information */
} hepevt_;
extern struct hepev2 {
int nmulti;		/* number of interactions in the list */
int jmulti[NMXHEP];     /* multiple interaction number */
} hepev2_;
