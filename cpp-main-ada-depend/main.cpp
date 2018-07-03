#include <cstdlib>
#include <iostream>

extern "C" void adainit();
extern "C" void adafinal();
extern "C" void ada_proc();

int main()
{
  std::cout << "Starting C++ main." << std::endl;
  adainit();
  ada_proc();
  adafinal();
  std::cout << "Ending C++ main." << std::endl;
  return EXIT_SUCCESS;
}
