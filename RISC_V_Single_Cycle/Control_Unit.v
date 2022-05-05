module Control_Unit(
  input [6:0] opcode,
  output reg [1:0] ALUOp,
  output reg Branch,
  output reg MemRead,
  output reg MemtoReg,
  output reg MemWrite,
  output reg ALUSrc,
  output reg RegWrite
);
  always@(*) begin
    case (opcode)
    7'b0110011: begin
      ALUOp = 2'b10;
      Branch = 1'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      RegWrite = 1'b1;
      MemtoReg = 1'b0;
      ALUSrc = 1'b0;
    end
    7'b0000011: begin
      ALUOp = 2'b00;
      Branch = 1'b0;
      MemWrite = 1'b0;
      MemRead = 1'b1;
      RegWrite = 1'b1;
      MemtoReg = 1'b1;
      ALUSrc = 1'b1;
    end
    7'b0100011: begin
      ALUOp = 2'b00;
      Branch = 1'b0;
      MemWrite = 1'b1;
      MemRead = 1'b0;
      RegWrite = 1'b0;
      MemtoReg = 1'bx;
      ALUSrc = 1'b1;
    end
    7'b1100011: begin
      ALUOp = 2'b01;
      Branch = 1'b1;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      RegWrite = 1'b0;
      MemtoReg = 1'bx;
      ALUSrc = 1'b0;
    end
    7'b0010011: begin
      ALUOp = 2'b00;
      Branch = 1'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      RegWrite = 1'b1;
      MemtoReg = 1'b0;
      ALUSrc = 1'b1;
    end
    default: begin
      ALUOp = 2'b00;
      Branch = 1'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      RegWrite = 1'b0;
      MemtoReg = 1'b0;
      ALUSrc = 1'b0;
    end
    endcase
      
  end
  
      
endmodule