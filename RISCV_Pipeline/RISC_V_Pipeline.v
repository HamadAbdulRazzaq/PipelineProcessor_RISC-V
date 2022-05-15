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
`include "ALU_64_bit.v"
`include "ALU_Control.v"
`include "shift_left.v"
`include "branch_module.v"
`include "Data_Memory.v"
`include "MUX_3.v"
`include "forwarding_unit.v"
`include "Hazard_Detection.v"
`include "MUX_Control.v"
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
// wire to_branch;
wire IF_ID_Write;
wire PC_Write;
wire Ctrl;
wire [1:0] ALUOp_Out;
wire Branch_Out;
wire MemRead_Out;
wire MemtoReg_Out;
wire MemWrite_Out;
wire ALUSrc_Out;
wire RegWrite_Out;
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
wire [2:0] f3_EX;
wire [4:0] rs1_EX;
wire [4:0] rs2_EX;
wire [4:0] rd_EX;
wire [3:0] Operation_EX;
wire [63:0] shift_Left_out;
wire [63:0] Branch_Adder_Out_EX;
wire [63:0] MUX_out_EX;
wire [63:0] Result_EX;
wire Zero_EX;
wire pos_EX;
wire RegWrite_MEM;
wire MemtoReg_MEM;
wire MemWrite_MEM;
wire MemRead_MEM;
wire Branch_MEM;
wire Zero_MEM;
wire [63:0] Result_MEM;
wire [63:0] Branch_Adder_Out_MEM;
wire [63:0] Read_Data_2_MEM;
wire [4:0] rd_MEM;
wire pos_MEM;
wire to_branch_MEM;
wire blt_MEM;
wire bge_MEM;
wire bne_MEM;
wire beq_MEM;
wire [2:0] funct3_MEM;
wire [63:0] Read_Data_MEM;
wire MemtoReg_WB;
wire [63:0] Read_Data_WB;
wire [63:0]Result_WB;
wire [63:0] MUX_A_Out_EX;
wire [63:0] MUX_B_Out_EX;
wire [1:0] F_A;
wire [1:0] F_B;
wire [63:0] Index_0;
wire [63:0] Index_1;
wire [63:0] Index_2;
wire [63:0] Index_3;
wire [63:0] Index_4;
wire [63:0] Index_5;
wire [63:0] Index_6;
wire [63:0] Index_7;
wire [63:0] Index_8;
wire [63:0] Index_9;
Program_Counter p1(clk, reset, Init_PC_In, PC_Write, Init_PC_Out);
Adder a1(Init_PC_Out, 64'd4, MUX1_Input1);
MUX m1(MUX1_Input1,MUX1_Input2, to_branch_MEM,Init_PC_In);
Instruction_Memory i1(Init_PC_Out, Instruction_IF);
IF_ID i2(clk, reset, Init_PC_Out, Instruction_IF, IF_ID_Write, to_branch_MEM, Instruction_ID, PC_Out_ID);
Hazard_Detection h1(MemRead_EX, rd_EX, rs1_ID, rs2_ID, IF_ID_Write, PC_Write, Ctrl);
instruction i3(Instruction_ID, opcode_ID, rd_ID, f3_ID, rs1_ID, rs2_ID, f7_ID);
imm_data_gen i4(Instruction_ID, imm_data_ID);   
registerFile r1(clk, reset, rs1_ID, rs2_ID, rd_WB, MUX5_Out, RegWrite_WB, Read_Data_1_ID, Read_Data_2_ID);
Control_Unit c1(opcode_ID, ALUOp_ID, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID);
MUX_Control m6(Ctrl, ALUOp_ID, Branch_ID, MemRead_ID, MemtoReg_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID, ALUOp_Out, Branch_Out, MemRead_Out, MemtoReg_Out, MemWrite_Out, ALUSrc_Out, RegWrite_Out);
ID_EX i5(clk, reset, {Instruction_ID[30], Instruction_ID[14:12]}, ALUOp_Out, MemtoReg_Out, RegWrite_Out, Branch_Out, MemWrite_Out, MemRead_Out, ALUSrc_Out, Read_Data_1_ID, Read_Data_2_ID, rd_ID, rs1_ID, rs2_ID, imm_data_ID, PC_Out_ID, f3_ID, to_branch_MEM, PC_Out_EX, Funct_EX, ALUOp_EX, MemtoReg_EX, RegWrite_EX, Branch_EX, MemWrite_EX, MemRead_EX, ALUSrc_EX, Read_Data_1_EX, Read_Data_2_EX, rs1_EX, rs2_EX, rd_EX, imm_data_EX, f3_EX);
ALU_Control a2(ALUOp_EX, Funct_EX, Operation_EX);
shift_left s1(imm_data_EX, shift_Left_out);
Adder a3(PC_Out_EX, shift_Left_out, Branch_Adder_Out_EX);
forwarding_unit f1(rd_WB, rd_MEM, rs1_EX, rs2_EX, RegWrite_WB, RegWrite_MEM, F_A, F_B);
MUX_3 m3(Read_Data_1_EX, MUX5_Out, Result_MEM, F_A, MUX_A_Out_EX);
MUX_3 m4(Read_Data_2_EX, MUX5_Out, Result_MEM, F_B, MUX_B_Out_EX);
MUX m2(MUX_B_Out_EX, imm_data_EX, ALUSrc_EX, MUX_out_EX);
ALU_64_bit a4(MUX_A_Out_EX, MUX_out_EX, Operation_EX, Zero_EX, Result_EX, pos_EX);
EX_MEM e1(clk, reset, rd_EX, Branch_EX, MemWrite_EX, MemRead_EX, MemtoReg_EX, RegWrite_EX, Branch_Adder_Out_EX, Result_EX, Zero_EX, MUX_B_Out_EX, f3_EX, pos_EX, to_branch_MEM,  Read_Data_2_MEM, Branch_Adder_Out_MEM, rd_MEM, Branch_MEM, MemWrite_MEM, MemRead_MEM, MemtoReg_MEM, RegWrite_MEM, Result_MEM, Zero_MEM, funct3_MEM, pos_MEM);
// Stage 4
branch_module b1(Zero_MEM, pos_MEM, Branch_MEM, funct3_MEM, bne_MEM, beq_MEM, bge_MEM, blt_MEM, to_branch_MEM);
Data_Memory d1(clk, Result_MEM, Read_Data_2_MEM, MemWrite_MEM, MemRead_MEM, Read_Data_MEM, Index_0, Index_1, Index_2, Index_3, Index_4, Index_5, Index_6, Index_7, Index_8, Index_9, funct3_MEM);
MEM_WB m0(clk, reset, Result_MEM, Read_Data_MEM, rd_MEM, MemtoReg_MEM, RegWrite_MEM, MemtoReg_WB, RegWrite_WB, Result_WB, Read_Data_WB, rd_WB);
MUX m5(Result_WB, Read_Data_WB, MemtoReg_WB, MUX5_Out);

endmodule