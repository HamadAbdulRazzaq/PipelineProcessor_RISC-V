`include "Program_Counter.v"
`include "Adder.v"
`include "MUX.v"
`include "Instruction_Memory.v"
`include "IF_ID.v"
`include "ID_EX.v"
`include "EX_MEM.v"
`include "MEM_WB.v"
`include "instruction.v"
`include "imm_data_gen.v"
`include "registerFile.v"
`include "Control_Unit.v"
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
wire [6:0] opcode_ID;
wire [4:0] rd_ID;
wire [2:0] f3_ID;
wire [4:0] rs1_ID;
wire [4:0] rs2_ID;
wire [6:0] f7_ID;
wire [63:0] imm_data_ID;
wire [63:0] MUX5_Out;
wire [4:0] rd_WB;
wire [63:0] Read_Data_1_ID;
wire [63:0] Read_Data_2_ID;
wire RegWrite_WB;
wire [1:0] ALUOp_ID;
wire Branch_ID;
wire MemRead_ID;
wire MemtoReg_ID;
wire MemWrite_ID;
wire ALUSrc_ID;
wire RegWrite_ID;
wire Branch_EX;
wire MemRead_EX;
wire MemtoReg_EX;
wire MemWrite_EX;
wire ALUSrc_EX;
wire RegWrite_EX;
wire [63:0] Read_Data_1_EX;
wire [63:0] Read_Data_2_EX;
wire [63:0] PC_Out_EX;
wire [1:0] ALUOp_EX;
wire [63:0] imm_data_EX;
wire [3:0] Funct_EX;
wire [4:0] rs1_EX;
wire [4:0] rs2_EX;
wire [4:0] rd_EX;
Program_Counter p1(clk, reset, Init_PC_In, Init_PC_Out);
Adder a1(Init_PC_Out, 64'd4, MUX1_Input1);
MUX m1(MUX1_Input1,MUX1_Input2, to_branch,Init_PC_In);
Instruction_Memory i1(Init_PC_Out, Instruction_IF);
IF_ID i2(clk, reset, Init_PC_Out, Instruction_IF, Instruction_ID, PC_Out_ID);
instruction i3(Instruction_ID, opcode_ID, rd_ID, f3_ID, rs1_ID, rs2_ID, f7_ID);
imm_data_gen i4(Instruction_ID, imm_data_ID);
registerFile r1(clk, reset, rs1_ID, rs2_ID, rd_WB, MUX5_Out, RegWrite_WB, Read_Data_1_ID, Read_Data_2_ID);
Control_Unit c1(opcode_ID, ALUOp_ID, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID);
ID_EX i5(clk, reset, {Instruction_ID[30], Instruction_ID[14:12]}, ALUOp_ID, MemtoReg_ID, RegWrite_ID, Branch_ID, MemWrite_ID, MemRead_ID, ALUSrc_ID, Read_Data_1_ID, Read_Data_2_ID, rd_ID, rs1_ID, rs2_ID, imm_data_ID, PC_Out_ID, PC_Out_EX, Funct_EX, ALUOp_EX, MemtoReg_EX, RegWrite_EX, Branch_EX, MemWrite_EX, MemRead_EX, ALUSrc_EX, Read_Data_1_EX, Read_Data_2_EX, rs1_EX, rs2_EX, rd_EX, imm_data_EX);







endmodule