module Hazard_Detection(
    input MemRead_Ex,
    input [4:0] rd_EX,
    input [4:0] rs1_ID,
    input [4:0] rs2_ID,
    output reg IF_ID_Write,
    output reg PC_Write,
    output reg Ctrl
);
always @(*) begin
  if (MemRead_Ex && (rd_EX == rs1_ID || rd_EX == rs2_ID)) begin
    IF_ID_Write <= 1'b0;
    PC_Write <= 1'b0;
    Ctrl <= 1'b1;
  end
  else begin
    IF_ID_Write <= 1'b1;
    PC_Write <= 1'b1;
    Ctrl <= 1'b0;
  end
end

    
endmodule