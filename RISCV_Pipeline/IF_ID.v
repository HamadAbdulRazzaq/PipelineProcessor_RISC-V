module IF_ID(
  input clk,
  input reset,
  input [63:0] PC_In,
  input  [31:0] Inst_input,
  output reg [31:0]Inst_output,
  output reg [63:0] PC_Out
);
  
  always @ (posedge clk or posedge reset)
    begin
    if (reset == 1'b1)
      begin
         PC_Out <= 0; 
         Inst_output <= 0;
      end
     else 
       begin
         PC_Out = PC_In;
         Inst_output <= Inst_input;
       end
    end
endmodule
