`timescale 1ns/100ps

module mux4_1(
  input [3:0] in, 
  input [1:0] sel, 
  output out
);
  // method 1
  assign out = in[sel];

  // method 2
  // always @(in or sel) begin
  //   case(sel)
  //     2'b00: out = in[0];
  //     2'b01: out = in[1];
  //     2'b10: out = in[2];
  //     2'b11: out = in[3];
  //   endcase    
  // end
endmodule

module main;
  output out;
  reg [3:0] in; 
  reg [1:0] sel; 
  
  mux4_1 m41(in, sel, out);

  integer i;
  initial begin
    for(i = 0; i < 20; i = i + 1) begin
      in = i;
      #10;
    end
  end

  initial begin
    #0  sel = 2'b00;
    #40 sel = 2'b01;
    #40 sel = 2'b10;
    #40 sel = 2'b11;
    #40 sel = 2'b00;
    #40 $finish;
  end

  initial begin
    $dumpfile("mux4_1.vcd");
    $dumpvars;
  end

endmodule
