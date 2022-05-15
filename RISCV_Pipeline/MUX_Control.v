module MUX_Control(
    input Ctrl,
    input [1:0] ALUOp,
    input Branch,
    input MemRead,
    input MemtoReg,
    input MemWrite,
    input ALUSrc,
    input RegWrite,
    output [1:0] ALUOp_Out,
    output Branch_Out,
    output MemRead_Out,
    output MemtoReg_Out,
    output MemWrite_Out,
    output ALUSrc_Out,
    output RegWrite_Out
);
assign ALUOp_Out = Ctrl?2'b0:ALUOp;
assign Branch_Out = Ctrl?1'b0:Branch;
assign MemRead_Out = Ctrl?1'b0:MemRead;
assign MemtoReg_Out = Ctrl?1'b0:MemtoReg;
assign MemWrite_Out = Ctrl?1'b0:MemWrite;
assign ALUSrc_Out = Ctrl?1'b0:ALUSrc;
assign RegWrite_Out = Ctrl?1'b0:RegWrite;

endmodule