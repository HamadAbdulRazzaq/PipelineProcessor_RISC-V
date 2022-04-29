module registerFile(
  input clk,
  input reset,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [63:0] write_data,
  input reg_write,
  output reg [63:0] readdata1,
  output reg [63:0] readdata2
);
  
  reg [63:0] Registers [31:0];
  initial begin
    	Registers[0] = 64'd0;
        Registers[1] = 64'd1209;
        Registers[2] = 64'd751;
        Registers[3] = 64'd3522;
        Registers[4] = 64'd2971;
        Registers[5] = 64'd72;
        Registers[6] = 64'd1135;
        Registers[7] = 64'd1141;
        Registers[8] = 64'd2919;
        Registers[9] = 64'd2467;
    	Registers[10] = 64'd0;
        Registers[11] = 64'd3033;
        Registers[12] = 64'd3278;
        Registers[13] = 64'd3214;
        Registers[14] = 64'd3656;
        Registers[15] = 64'd1765;
        Registers[16] = 64'd736;
        Registers[17] = 64'd2985;
        Registers[18] = 64'd2717;
        Registers[19] = 64'd863;
        Registers[20] = 64'd1916;
        Registers[21] = 64'd13;
        Registers[22] = 64'd701;
        Registers[23] = 64'd3479;
        Registers[24] = 64'd2489;
        Registers[25] = 64'd1937;
        Registers[26] = 64'd523;
        Registers[27] = 64'd210;
        Registers[28] = 64'd1043;
        Registers[29] = 64'd425;
        Registers[30] = 64'd2434;
        Registers[31] = 64'd988;
  end
  always @(posedge clk) begin
    if (reg_write & rd != 5'd0) begin
    	Registers[rd] <= write_data;
    end
  end
  always @(*) begin
    if (reset) begin
      readdata1 <= 64'b0;
      readdata2 <= 64'b0;
    end
    else begin
      readdata1 <= Registers[rs1];
      readdata2 <= Registers[rs2];
    end
  end
endmodule