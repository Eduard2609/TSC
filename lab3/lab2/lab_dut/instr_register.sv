/***********************************************************************
 * A SystemVerilog RTL model of an instruction regisgter
 *
 * An error can be injected into the design by invoking compilation with
 * the option:  +define+FORCE_LOAD_ERROR
 *
 **********************************************************************/

module instr_register
import instr_register_pkg::*;  // user-defined types are defined in instr_register_pkg.sv
(input  logic          clk,
 input  logic          load_en,
 input  logic          reset_n,
 input  operand_t      operand_a,
 input  operand_t      operand_b,
 input  opcode_t       opcode,
 input  address_t      write_pointer,
 input  address_t      read_pointer,
 output instruction_t  instruction_word
);
  timeunit 1ns/1ns;

  instruction_t  iw_reg [0:31];  // an array of instruction_word structures
  result_t res;

  // Write to the register
  always @(posedge clk, negedge reset_n) 
    if (!reset_n) begin
      foreach (iw_reg[i]) 
        iw_reg[i] = '{opc:ZERO, op_a:0, op_b:0, rezultat:0};
    end
    else if (load_en) begin
      case (opcode)
        ADD: rezultat = operand_a + operand_b;
        SUB: rezultat = operand_a - operand_b;
        MULT: rezultat = operand_a * operand_b;
        PASSA: rezultat = operand_a;
        PASSB: rezultat = operand_b;
        DIV: rezultat = operand_a / operand_b;
        MOD: rezultat = operand_a % operand_b;
		ZERO: rezultat = 0; 
      endcase     
      iw_reg[write_pointer] = '{opcode,operand_a,operand_b, rezultat};
      end

//  always@(*) begin
//     unique case (opcode)
//       PASSA: res = operand_a;
//       PASSB: res = operand_b;
//       ADD:   res = operand_a + operand_b;
//       SUB:   res = operand_a - operand_b;
//       MULT:   res = operand_a * operand_b;
//       DIV:   res = operand_a / operand_b;
//       MOD:   res = operand_a % operand_b;
//       default: res = 0;
//     endcase
//   end

  // read from the register
  assign instruction_word = iw_reg[read_pointer];  // continuously read from register

// compile with +define+FORCE_LOAD_ERROR to inject a functional bug for verification to catch
`ifdef FORCE_LOAD_ERROR
initial begin
  force operand_b = operand_a; // cause wrong value to be loaded into operand_b
end
`endif

endmodule: instr_register
