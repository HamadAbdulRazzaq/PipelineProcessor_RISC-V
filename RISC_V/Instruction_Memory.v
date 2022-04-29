module Instruction_Memory(
  input [63:0] Inst_Address,
  output [31:0] Instruction
);
  reg [7:0] IMem [19:0] ;
  initial begin
    IMem[19]  = 8'b00000010;
    IMem[18]  = 8'b10000101;
    IMem[17]  = 8'b00110100;
    IMem[16]  = 8'b10000011;
    IMem[15] = 8'b00000010;
    IMem[14] = 8'b10010101;
    IMem[13] = 8'b00110100;
    IMem[12] = 8'b00100011;
    IMem[11] = 8'b00000000;
    IMem[10] = 8'b00010100;
    IMem[9]  = 8'b10000100;
    IMem[8]  = 8'b10010011;
    IMem[7]  = 8'b00000000;
    IMem[6]  = 8'b10011010;
    IMem[5]  = 8'b10000100;
    IMem[4]  = 8'b10110011;
    IMem[3]  = 8'b00000010;
    IMem[2]  = 8'b10000101;
    IMem[1]  = 8'b00110100;
    IMem[0]  = 8'b10000011;
  end
  assign Instruction[31:0] = {IMem[Inst_Address+2'b11], IMem[Inst_Address+2'b10], IMem[Inst_Address+1'b1], IMem[Inst_Address]};
  
endmodule