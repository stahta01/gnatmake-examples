#include <cstdlib>
#include <iostream>

extern "C" void elabinit();
extern "C" void elabfinal();
extern "C" void ada_proc();

int main()
{
  std::cout << "Starting C++ main." << std::endl;
  elabinit();
  ada_proc();
  elabfinal();
  std::cout << "Ending C++ main." << std::endl;
  return EXIT_SUCCESS;
}
