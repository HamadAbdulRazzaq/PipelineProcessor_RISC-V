module Data_Memory(
  input clk,
  input [63:0] Mem_Addr,
  input [63:0] Write_Data,
  input MemWrite,
  input MemRead,
  output reg [63:0] Read_Data
);
  reg [7:0] DMem [63:0];
  initial begin
        DMem[0] = 8'b11101011;
        DMem[1] = 8'b10010;
        DMem[2] = 8'b1111000;
        DMem[3] = 8'b1001111;
        DMem[4] = 8'b1001000;
        DMem[5] = 8'b10110110;
        DMem[6] = 8'b1000101;
        DMem[7] = 8'b11111110;
        DMem[8] = 8'b110000;
        DMem[9] = 8'b10000;
        DMem[10] = 8'b10001;
        DMem[11] = 8'b101;
        DMem[12] = 8'b11000010;
        DMem[13] = 8'b11011111;
        DMem[14] = 8'b1100010;
        DMem[15] = 8'b10000111;
        DMem[16] = 8'b110101;
        DMem[17] = 8'b111011;
        DMem[18] = 8'b1010001;
        DMem[19] = 8'b1011111;
        DMem[20] = 8'b111001;
        DMem[21] = 8'b1111101;
        DMem[22] = 8'b10100110;
        DMem[23] = 8'b101;
        DMem[24] = 8'b100011;
        DMem[25] = 8'b10000;
        DMem[26] = 8'b1110111;
        DMem[27] = 8'b10111001;
        DMem[28] = 8'b11111;
        DMem[29] = 8'b100000;
        DMem[30] = 8'b11000010;
        DMem[31] = 8'b101011;
        DMem[32] = 8'b100100;
        DMem[33] = 8'b1010;
        DMem[34] = 8'b1101011;
        DMem[35] = 8'b11000011;
        DMem[36] = 8'b11000010;
        DMem[37] = 8'b1001100;
        DMem[38] = 8'b1101010;
        DMem[39] = 8'b1000101;
        DMem[40] = 8'b1001;
        DMem[41] = 8'b0;
        DMem[42] = 8'b0;
        DMem[43] = 8'b0;
        DMem[44] = 8'b0;
        DMem[45] = 8'b0;
        DMem[46] = 8'b0;
        DMem[47] = 8'b0;
        DMem[48] = 8'b11111000;
        DMem[49] = 8'b10101010;
        DMem[50] = 8'b11101001;
        DMem[51] = 8'b10010011;
        DMem[52] = 8'b10010110;
        DMem[53] = 8'b11010110;
        DMem[54] = 8'b11111001;
    	  DMem[55] = 8'b10000000;
        DMem[56] = 8'b1101011;
        DMem[57] = 8'b1101;
        DMem[58] = 8'b1101000;
        DMem[59] = 8'b11111;
        DMem[60] = 8'b11111100;
        DMem[61] = 8'b1000011;
        DMem[62] = 8'b101101;
        DMem[63] = 8'b11100;
  end
  always @(posedge clk) begin
    if (MemWrite) begin
      DMem[Mem_Addr] = Write_Data[7:0];
      DMem[Mem_Addr+1] = Write_Data[15:8];
      DMem[Mem_Addr+2] = Write_Data[23:16];
      DMem[Mem_Addr+3] = Write_Data[31:24];
      DMem[Mem_Addr+4] = Write_Data[39:32];
      DMem[Mem_Addr+5] = Write_Data[47:40];
      DMem[Mem_Addr+6] = Write_Data[55:48];
      DMem[Mem_Addr+7] = Write_Data[63:56];
    end
  end
  always @(*) begin
    if (MemRead) begin
      Read_Data = {DMem[Mem_Addr + 7], DMem[Mem_Addr + 6], DMem[Mem_Addr + 5], DMem[Mem_Addr + 4], DMem[Mem_Addr + 3], DMem[Mem_Addr + 2], DMem[Mem_Addr + 1], DMem[Mem_Addr]};
    end
  end
endmodule
/////////