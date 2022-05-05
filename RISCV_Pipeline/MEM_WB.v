// Code your design here
module MEM_WB(
  input clk,
  input reset,
  input [63:0] Result_inp,	//ALU
  input [63:0] Read_Data_inp,		//Data Memory
  input [4:0] rd_inp,		//EX-MEM
  input MemtoReg_inp,		//Control_unit
  input RegWrite_inp,
  output reg MemtoReg_out, 
  output reg RegWrite_out,
  output reg [63:0] Result_out,
  output reg [63:0]Read_Data_out,
  output reg [4:0] rd_out
  
);

  
  always @ (posedge clk or posedge reset)
    begin
    if (reset == 1'b1)
      begin
        Result_out <= 0;
        Read_Data_out <= 0;
        rd_out <= 5'b0;
        MemtoReg_out <= 0;
        RegWrite_out <= 0;
      end
     else 
       begin
        Result_out <= Result_inp;
        Read_Data_out <= Read_Data_inp;
        rd_out <= rd_inp;
        MemtoReg_out <= MemtoReg_inp;
        RegWrite_out <= RegWrite_inp;
       end
    end
endmodule