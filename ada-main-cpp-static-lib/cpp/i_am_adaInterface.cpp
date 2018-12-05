#include <stdio.h>

#include "i_am_cpp.hpp"

extern "C" void i_am_adaInterface()
{
  printf("  Calling C++ code from wrapper function with C linkage.\n");
  test::i_am_cpp();
  printf("  Exiting wrapper function with C linkage.\n");
}
