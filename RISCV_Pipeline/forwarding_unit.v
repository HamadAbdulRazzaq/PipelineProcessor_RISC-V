module forwarding_unit(
    input [4:0] rd_WB,
    input [4:0] rd_MEM,
    input [4:0] rs1,
    input [4:0] rs2,
    input RegWrite_WB,
    input RegWrite_MEM,
    output reg [1:0] Forward_A,
    output reg [1:0] Forward_B
);
    always @(*) begin
      if (rs1 == rd_MEM && RegWrite_MEM) begin
        Forward_A <= 2'b10;
      end
      else if (rs1 == rd_WB && RegWrite_WB) begin
        Forward_A <= 2'b01;
      end
      else begin
        Forward_A <= 2'b00;
      end
      if (rs2 == rd_MEM && RegWrite_MEM) begin
        Forward_B <= 2'b10;
      end
      else if (rs2 == rd_WB && RegWrite_WB) begin
        Forward_B <= 2'b01;
      end
      else begin
        Forward_B <= 2'b00;
      end
    end

endmodule