module shift_left(
  input [63:0] a ,
  output [63:0] b 
);
  assign b ={a[62:0],1'b0};
endmodule