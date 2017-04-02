// Larbin
// Sebastien Ailleret
// 29-11-99 -> 09-03-02

#include <unistd.h>
#include <iostream>
#include <assert.h>

using namespace std;
#include "global.h"


global::global (int argc, char *argv[]) {
  std::cout <<" HelloWorld \n\n";
  
}

/** Destructor : never used because the program should never end !
 */
global::~global () {
  assert(false);
}

