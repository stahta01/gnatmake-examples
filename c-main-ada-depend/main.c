#include <stdio.h>
#include <stdlib.h>

extern void adainit();
extern void adafinal();
extern void ada_proc();

int main(int argc, char* argv[])
{
  printf("Starting C main.\n");
  adainit();
  ada_proc();
  adafinal();
  printf("Ending C main.\n");
  return EXIT_SUCCESS;
}
