# RUN: llvm-mc %s -triple=riscv32 -mattr=madd --show-encoding | FileCheck %s
madd a0, a1, a2 # CHECK: madd a0, a1, a2 # encoding: [0x0b,0x85,0xc5,0x02]
madd a3, a4, a5 # CHECK: madd a3, a4, a5 # encoding: [0x8b,0x06,0xf7,0x02]

