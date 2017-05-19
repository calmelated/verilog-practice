`timescale 1ns/100ps

module deco2_4(input a, input b, output [3:0] y);
  assign y[0] = ({a, b} == 2'b00);
  assign y[1] = ({a, b} == 2'b01);
  assign y[2] = ({a, b} == 2'b10);
  assign y[3] = ({a, b} == 2'b11);
endmodule

module main;
  reg a, b;
  wire [3:0] y;

  deco2_4 d24(a, b, y);//對應example.v檔案內第一行的module宣告

  integer i;
  initial begin
    for(i = 0; i <= 16; i = i + 1) begin
      {a, b} = i;
      #10;
    end
  end

  initial begin
    $dumpfile("deco2_4.vcd");
    $dumpvars;
  end

endmodule