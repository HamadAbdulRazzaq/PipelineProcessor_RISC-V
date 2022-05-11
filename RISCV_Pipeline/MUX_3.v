module MUX_3(
    input [63:0] a,
    input [63:0] b,
    input [63:0] c,
    input [1:0] s,
    output [63:0] out
);
assign out = s[1]?(s[0]?64'bx:c):(s[0]?b:a);

endmodule