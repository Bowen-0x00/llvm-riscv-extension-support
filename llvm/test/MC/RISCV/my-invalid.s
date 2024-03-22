# RUN: not llvm-mc -triple=riscv32 -mattr=madd --show-encoding %s 2>&1 | FileCheck %s
madd a0, a1# CHECK: :[[@LINE]]:1: error: too few operands for instruction
madd a0, a1, 1# CHECK: :[[@LINE]]:14: error: invalid operand for instruction
madd a0, a1, a2, a3# CHECK: :[[@LINE]]:18: error: invalid operand for instruction
