/// Cuibin
/// author:cuipengyu
/// create-time:20170402

#include <iostream>
#include <signal.h>

#include "global.h"


static void cron();

///////////////////////////////////
#ifdef PROF
static bool stop=false;
static void handler(int i)
{
    stop=true;
}
#endif // PROF

int main(int argc,char *args[]){
    struct global glob(argc,args);
#ifdef PROF
    signal(2,handler);
#endif // PROF

    // cout << "HelloWorld\n\n";
    return 0;
}
