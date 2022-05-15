module Program_Counter(
  input clk,
  input reset,
  input [63:0] PC_In,
  input PC_Write,
  output reg [63:0] PC_Out
);
  always @(posedge clk or posedge reset)
    begin
      if (reset) begin
        PC_Out <= 64'd0; 
      end
      else if (PC_Write != 1'b0) begin
        PC_Out <= PC_In;
      end
      else begin
        PC_Out <= PC_Out; // The most useless line I have ever written
      end
    end
endmodule