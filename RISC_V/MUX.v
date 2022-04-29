module MUX(
  input [63:0] X,
  input [63:0] Y,
  input S,
  output [63:0] O
);
  assign O = S?Y:X;
endmodule