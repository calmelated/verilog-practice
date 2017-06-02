
module fulladder (
  input  a, b, c_in, 
  output sum, c_out
);
  wire s1, c1, c2;
  xor g1(s1, a, b);
  xor g2(sum, s1, c_in);
  and g3(c1, a, b);
  and g4(c2, s1, c_in);
  or  g5(c_out, c2, c1);
endmodule

module not4 (input  [3:0] x, output [3:0] y);
  assign y = ~x;
endmodule

module xor4 (input  [3:0] a, input  [3:0] b, output [3:0] y);
  assign y = a ^ b;
endmodule

module add4 (
  input c_in, 
  input [3:0] a, 
  input [3:0] b, 
  output [3:0] sum, 
  output c_out
);
  wire [3:0] c;
  fulladder fa1(a[0],b[0], c_in, sum[0], c[1]) ;
  fulladder fa2(a[1],b[1], c[1], sum[1], c[2]) ;
  fulladder fa3(a[2],b[2], c[2], sum[2], c[3]) ;
  fulladder fa4(a[3],b[3], c[3], sum[3], c_out) ;
endmodule

module sub4 (
  input  op, 
  input  [3:0] a, 
  input  [3:0] b, 
  output [3:0] sum, 
  output c_out
);
  wire [3:0] bnot;
  not4 n1(b, bnot);
  add4 a1(op, a, bnot, sum, c_out);
endmodule

module addSub4 (
  input  op, 
  input  [3:0] a, 
  input  [3:0] b, 
  output [3:0] sum, 
  output c_out
);
  wire [3:0] bop;
  xor4 x1(b, {op, op, op, op}, bop);
  add4 a1(op, a, bop, sum, c_out);
endmodule

module main;
  reg  signed [3:0] a;
  reg  signed [3:0] b;
  wire signed [3:0] sum;
  reg  op;
  wire c_out;

  addSub4 as(op, a, b, sum, c_out);
  // add4 a4(op, a, b, sum, c_out);
  // sub4 s4(op, a, b, sum, c_out);

  initial begin
    a  = 4'b0101;
    b  = 4'b0000;
    op = 1'b0;

    $dumpfile("fulladder.vcd");
    $dumpvars;
  end

  always #1600 begin
    op = op + 1;
    $monitor("%dns monitor: op=%d a=%d b=%d sum=%d", $stime, op, a, b, sum);
  end

  always #100 begin
    b = b + 1;
  end

  initial #3000 $finish;

endmodule