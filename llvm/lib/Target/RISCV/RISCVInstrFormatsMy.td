//===-- RISCVInstrFormatsMy.td - RISC-V custom formats -------*- tablegen -*-===//
//===----------------------------------------------------------------------===//
//
// This file describes the custom instruction formats
// Author: Bowen
//
//===----------------------------------------------------------------------===//

//Bowen+
def OPCODE_CUSTOM0  : RISCVOpcode<"CUSTOM0", 0b0001011>;//custom-0 opcode
// def OPCODE_CUSTOM1  : RISCVOpcode<0b0101011>;//custom-1 

// 0000001 rs2 rs1 000 rd CUSTOM0
//0000001 00011 00010 000 00001 0001011   0231008B
//0000001 01100 01011 000 01010 0001011   02C5850B    
//0000001 01111 01110 000 01101 0001011   02F7068B    
let hasSideEffects = 1, mayLoad = 0, mayStore = 0 in {//for R instruction, not need access mem
  class RVInstMyR<bits<7> func7, bits<3> func3, RISCVOpcode opcode,//my R instruction, similar to multiply instruction
                dag outs, dag ins, string opcodestr, string argstr, list<dag> pattern>
      : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {

    bits<5> rs1;
    bits<5> rs2;
    bits<5> rd;

    let Inst{31-25} = func7;
    let Inst{24-20} = rs2;
    
    let Inst{19-15} = rs1;
    let Inst{14-12} = func3;
    let Inst{11-7}  = rd;
    let Opcode = opcode.Value;
  }

  class RVInstMy_rrr<bits<7> func7, bits<3> func3, string opcodestr>
    : RVInstMyR<func7, func3, OPCODE_CUSTOM0, (outs GPR:$rd), (ins GPR:$rs3, GPR:$rs1, GPR:$rs2),
              opcodestr, "$rd, $rs1, $rs2", []>{
      let Constraints = "$rd = $rs3";//to add $rs3 avoid same name error          
    }
}



