module ALU_64_bit(
  input [63:0] a,
  input [63:0] b,
  input [3:0]ALUOp,
  output reg Zero,
  output reg [63:0] Result,
  output reg Pos
);
  
  always @(*) begin
    if (ALUOp == 4'b0000) begin
     Result = a & b;
  end
    else if (ALUOp == 4'b0001) begin
     Result = a | b;
  end
    else if (ALUOp == 4'b0010) begin
     Result = a + b;
  end
    else if (ALUOp == 4'b0110) begin
     Result = a - b;
  end
    else if (ALUOp == 4'b1100) begin
      Result = ~(a|b);
  end
    if (Result == 0)
      Zero = 1;
    else
      Zero = 0;
    Pos <= ~Result[63];
  end
endmodule