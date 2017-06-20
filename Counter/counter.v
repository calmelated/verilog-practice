
module counter(
  input clk, 
  input rst, 
  output reg [2:0] out
);
  always @(posedge clk or rst) begin
      if (rst) out = 3'b000;
      else out = out + 1;
      // out = out + 1;
  end    
endmodule

module main;
  reg clk;
  reg rst;
  wire [2:0] out;

  counter DUT (clk, rst, out);

  initial begin
    clk = 0;
    rst = 1;
    $dumpfile("counter.vcd");
    $dumpvars;    
  end

  initial #100 rst = 0;  
  always #50 clk = clk + 1;
  initial #500 rst = 1;
  initial #525 rst = 0;

  initial #2000 $finish;

endmodule

