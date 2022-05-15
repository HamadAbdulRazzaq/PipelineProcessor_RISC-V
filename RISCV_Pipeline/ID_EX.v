module ID_EX(
  input clk,
  input reset,
  input [3:0] Funct_inp,		//ALU_Control
  input [1:0] ALUOp_inp,
  input MemtoReg_inp,		//Control_Unit
  input RegWrite_inp,
  input Branch_inp,
  input MemWrite_inp, 
  input MemRead_inp,
  input ALUSrc_inp,
  input [63:0] ReadData1_inp,		//registerFile
  input [63:0]ReadData2_inp,
  input [4:0] rd_inp,			 //Instruction_Parser
  input [4:0] rs1_in,
  input [4:0] rs2_in,
  input [63:0] imm_data_inp,		//ImmediateDataExtractor
  input [63:0] PC_In,		//Program_Counter
  input [2:0] f3_ID,
  output reg [63:0] PC_Out,
  output reg [3:0] Funct_out,
  output reg [1:0] ALUOp_out,
  output reg MemtoReg_out, 
  output reg RegWrite_out,
  output reg Branch_out,
  output reg MemWrite_out, 
  output reg MemRead_out,
  output reg ALUSrc_out,
  output reg [63:0] ReadData1_out,
  output reg [63:0]ReadData2_out,
  output reg [4:0] rs1_out,
  output reg [4:0] rs2_out,
  output reg [4:0] rd_out,
  output reg [63:0] imm_data_out,
  output reg [2:0] f3_EX
 
);
	
   always @ (posedge clk or posedge reset)
     begin 
       if (reset == 1'b1)
         begin
           PC_Out<= 0;
           Funct_out <= 0;
           ALUOp_out <= 0;
  		   MemtoReg_out <= 0;
 		   RegWrite_out <= 0;
  		   Branch_out <= 0;
  		   MemWrite_out <= 0;
  		   MemRead_out <= 0;
 		   ALUSrc_out <= 0;
   		   ReadData1_out <= 0;
  		   ReadData2_out <= 0; 
  		   rs1_out <= 0;
  		   rs2_out <= 0;
  		   rd_out <= 0;
  		   imm_data_out <= 0;
         f3_EX <= 0;
         end
       else 
         begin
           f3_EX <= f3_ID;
           PC_Out<= PC_In;
           Funct_out <= Funct_inp ;
           ALUOp_out <= ALUOp_inp;
  		   MemtoReg_out <= MemtoReg_inp;
 		   RegWrite_out <= RegWrite_inp;
  		   Branch_out <= Branch_inp;
  		   MemWrite_out <= MemWrite_inp;
  		   MemRead_out <= MemRead_inp;
 		   ALUSrc_out <= ALUSrc_inp;
   		   ReadData1_out <=  ReadData1_inp;
  		   ReadData2_out <=  ReadData2_inp; 
  		   rs1_out <= rs1_in;
  		   rs2_out <= rs2_in;
  		   rd_out <= rd_inp;
  		   imm_data_out <= imm_data_inp;
         end
     end
endmodule
      