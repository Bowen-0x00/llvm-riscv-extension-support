//===-- RISCVInstrInfoMadd.td - RISC-V custom0 'madd' instructions -------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// This file describes the custom madd instruction
// Author: Bowen
//
//===----------------------------------------------------------------------===//

//Bowen+
include "RISCVInstrFormatsMy.td"//instruction format

let Predicates = [HasMultiAdd] in {//this instruction valid when support madd feature
   def MADD : RVInstMy_rrr<0b0000001, 0b000, "madd">;
   def : Pat<  (add GPR:$rd, (mul GPR:$rs1, GPR:$rs2)),//pattern to match:  (a add b * c)
               (MADD GPR:$rd, GPR:$rs1, GPR:$rs2)>;//instruction to generate
}