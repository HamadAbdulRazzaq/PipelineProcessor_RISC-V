module Hazard_Detection(
    input MemRead_Ex,
    input [4:0] rd_EX,
    input [4:0] rs1_ID,
    input [4:0] rs2_ID,
    output reg stall
);
always @(*) begin
  if (MemRead_Ex && (rd_EX == rs1_ID || rd_EX == rs2_ID)) begin
    stall <= 1'b1;
  end
  else begin
    stall <= 1'b0;
  end
end

    
endmodule