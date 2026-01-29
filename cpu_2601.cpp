#include "cpu_2601_.h"
#include "verilated.h"

int main(int argc, char *argv[]) {
  Verilated::commandArgs(argc, argv);

  cpu_2601_ *top = new cpu_2601_();

  delete top;
  return 0;
}