`include "RISC_V_Pipeline.v"
module tb();
  reg dclk;
  reg dreset;
  
  RISC_V_Pipeline r1(dclk, dreset);
  initial begin
    dclk = 1'b0;
  end
  always begin
    #5
    dclk = ~dclk;
  end
  initial begin
    dreset = 1'b1;
    #10
    dreset = 1'b0;
    #4500
    dreset = 1'b1;
    $finish;
  end
  
  initial begin
    $dumpfile("tests.vcd");
    $dumpvars(3,tb);
  end
endmodule