#include <cstdlib>
#include <iostream>

extern "C" void adaStaticinit();
extern "C" void adaStaticfinal();
extern "C" void ada_proc();

int main()
{
  std::cout << "Starting C++ main." << std::endl;
  adaStaticinit();
  ada_proc();
  adaStaticfinal();
  std::cout << "Ending C++ main." << std::endl;
  return EXIT_SUCCESS;
}
