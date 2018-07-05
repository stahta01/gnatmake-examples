#include <iostream>

#include "i_am_cpp.hpp"

extern "C" void i_am_adaInterface()
{
  std::cout << "  Calling C++ code from wrapper function with C linkage." << std::endl;
  test::i_am_cpp();
  std::cout << "  Exiting wrapper function with C linkage." << std::endl;
}
