module Program_Counter(
  input clk,
  input reset,
  input [63:0] PC_In,
  input stall,
  output reg [63:0] PC_Out
);
  always @(posedge clk or posedge reset)
    begin
      if (reset) begin
        PC_Out <= 64'd0; 
      end
      else if (stall != 1'b1) begin
        PC_Out <= PC_In;
      end
      else begin
        PC_Out <= PC_Out // The most useless line I have ever written
      end
    end
endmodule