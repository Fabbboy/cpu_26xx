#include "Vcpu_2601.h"
#include "verilated.h"

int main(int argc, char *argv[]) {
  Verilated::commandArgs(argc, argv);

  Vcpu_2601 *top = new Vcpu_2601;
  while (!Verilated::gotFinish()) {
    top->clk = !top->clk;
    top->eval();
  }
  delete top;
  return 0;
}