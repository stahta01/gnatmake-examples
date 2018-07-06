#include <iostream>

#include "i_am_c.h"
#include "i_am_cpp.hpp"

extern "C" void adainit();
extern "C" void adafinal();
extern "C" void ada_procedure();
extern "C" void ada_procedure_too();

int main()
{
  std::cout << "Starting C++ main." << std::endl;
  adainit();
  std::cout << "Calling external C++ code from C++ main." << std::endl;
  test::i_am_cpp();
  std::cout << "Calling external C code from C++ main." << std::endl;
  i_am_c();
  std::cout << "Calling external Ada code from C++ main." << std::endl;
  ada_procedure();
  ada_procedure_too();
  adafinal();
  std::cout << "Exiting C++ main." << std::endl;
}
