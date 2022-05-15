// Code your design here
module EX_MEM(
  input clk,
  input reset,
  input [4:0] rd_inp,		//ID-EX
  input Branch_inp,			//Control_unit
  input MemWrite_inp, 
  input MemRead_inp, 
  input MemtoReg_inp,
  input RegWrite_inp,
  input [63:0] Adder_B_1,		//Program_Counter
  input [63:0] Result_inp,	//ALU
  input ZERO_inp,
  input [63:0] data_inp,		//Adder
  input [2:0] funct3_Ex,
  output reg [63:0] data_out,
  output reg [63:0] Adder_B_2,
  output reg [4:0] rd_out,
  output reg Branch_out,
  output reg MemWrite_out,
  output reg MemRead_out,
  output reg MemtoReg_out, 
  output reg RegWrite_out,
  output reg [63:0] Result_out,
  output reg ZERO_out,
  output reg [2:0] funct3_MEM
 
);
 
  
  always @ (posedge clk or posedge reset)
     begin 
       if (reset == 1'b1)
         begin
         Adder_B_2<= 0;
         Result_out <=0;
         ZERO_out <= 0;
  		   MemtoReg_out <= 0;
 		     RegWrite_out <= 0;
  		   Branch_out <= 0;
  		   MemWrite_out <= 0;
  		   MemRead_out <= 0;
  		   rd_out <= 0;
  		   data_out <= 0;
         funct3_MEM <= 0;
         end
       else 
         begin
         funct3_MEM <= funct3_Ex;
         Adder_B_2<= Adder_B_1;
         Result_out <= Result_inp;
         ZERO_out <= ZERO_inp ;
  		   MemtoReg_out <= MemtoReg_inp;
 		     RegWrite_out <= RegWrite_inp;
  		   Branch_out <= Branch_inp;
  		   MemWrite_out <= MemWrite_inp;
  		   MemRead_out <= MemRead_inp;
  		   rd_out <= rd_inp;
  		   data_out <= data_inp;
         end
     end
endmodule
      
    
  
  
  
  
  