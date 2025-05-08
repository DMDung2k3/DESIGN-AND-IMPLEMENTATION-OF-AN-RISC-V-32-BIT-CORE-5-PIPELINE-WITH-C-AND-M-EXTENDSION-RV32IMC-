//--------------------------module instantiation--------------------------
/*
riscv_core_32bit_adder
#(
  .XLEN ()
)
u_riscv_core_32bit_adder
(
  .i_32bit_adder_srcA   ()
  ,.i_32bit_adder_srcB  ()
  ,.o_32bit_adder_result()
);
*/
//////////////////////////////////////////////////////////////////////////
module riscv_core_32bit_adder
#(
  parameter XLEN = 32
)
(
  input  logic [XLEN-1:0] i_32bit_adder_srcA,
  input  logic [XLEN-1:0] i_32bit_adder_srcB,
  output logic [XLEN-1:0] o_32bit_adder_result
);

assign o_32bit_adder_result = i_32bit_adder_srcA + i_32bit_adder_srcB;
endmodule