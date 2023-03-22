/*DECK ID>, DATIME. */
/*>    ROUTINE DATIME
  CERN PROGLIB# Z007    DATIME          .VERSION KERNFOR  4.26  910313
*/
#include <sys/types.h>
#include <time.h>

struct tm *tp;

#define slate slate_
//AV struct { int  inum[39]; } slate_;
struct { int  inum[40]; } slate_;
void datime_(id, it)
   int  *id, *it;
{
   time_t tloc = time(0);
   tp = localtime(&tloc);
   slate.inum[0] = tp->tm_year + 1900;
   slate.inum[1] = tp->tm_mon + 1;
   slate.inum[2] = tp->tm_mday;
   slate.inum[3] = tp->tm_hour;
   slate.inum[4] = tp->tm_min;
   slate.inum[5] = tp->tm_sec;
   *id  = tp->tm_year * 10000;
   *id += (tp->tm_mon + 1) * 100;
   *id += tp->tm_mday;
   *it  = tp->tm_hour * 100;
   *it += tp->tm_min;
   return;
}
/*> END <----------------------------------------------------------*/
