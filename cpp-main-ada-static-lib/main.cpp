#include <cstdlib>
#include <iostream>

extern "C" void adaStaticinit();
extern "C" void adaStaticfinal();
extern "C" void ada_proc();

int main()
{
  adaStaticinit();
  std::cout << "Starting C++ main." << std::endl;
  ada_proc();
  std::cout << "Ending C++ main." << std::endl;
  adaStaticfinal();
  return EXIT_SUCCESS;
}
