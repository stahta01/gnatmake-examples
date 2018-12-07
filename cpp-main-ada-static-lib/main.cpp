#include <cstdlib>
#include <iostream>

extern "C" void elaborateinit();
extern "C" void elaboratefinal();
extern "C" void ada_proc();

int main()
{
  elaborateinit();
  std::cout << "Starting C++ main." << std::endl;
  ada_proc();
  std::cout << "Ending C++ main." << std::endl;
  elaboratefinal();
  return EXIT_SUCCESS;
}
