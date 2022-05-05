`include "Program_Counter.v"
`include "Adder.v"
`include "MUX.v"
`include "Instruction_Memory.v"
`include "IF_ID.v"
`include "ID_EX.v"
`include "EX_MEM.v"
`include "MEM_WB.v"
module RISC_V_Pipeline(
    input clk,
    input reset
);
wire [63:0] Init_PC_In;
wire [63:0] Init_PC_Out;
wire [63:0] MUX1_Input1;
wire [63:0] MUX1_Input2;
wire [31:0] Instruction_IF;
wire [31:0] Instruction_ID;
wire [63:0] PC_Out_ID;
wire to_branch;
Program_Counter p1(clk, reset, Init_PC_In, Init_PC_Out);
Adder a1(Init_PC_Out, 64'd4, MUX1_Input1);
MUX m1(MUX1_Input1,MUX1_Input2, to_branch,Init_PC_In);
Instruction_Memory i1(Init_PC_Out, Instruction_IF);
IF_ID i2(clk, reset, Init_PC_Out, Instruction_IF, Instruction_ID, PC_Out_ID);





endmodule