
module fulladder(input a, b, c_in, output sum, c_out);
  wire s1, c1, c2;

  xor g1(s1, a, b);
  xor g2(sum, s1, c_in);
  and g3(c1, a, b);
  and g4(c2, s1, c_in) ;
  or  g5(c_out, c2, c1) ;
  
endmodule

module main;
  reg a, b, c_in;
  wire sum, c_out;

  fulladder fa(a, b, c_in, sum, c_out);

  always #50 begin
    a = a + 1;
    $monitor("%4dns monitor: a=%d b=%d c_in=%d sum=%d c_out=%d", $stime, a, b, c_in, sum, c_out);
  end

  always #100 begin
    b = b + 1;
  end

  always #200 begin
    c_in = c_in + 1;
  end

  initial begin
    a = 0;
    b = 0;
    c_in = 0;

    $dumpfile("fulladder.vcd");
    $dumpvars;
  end

  initial #2000 $finish;

endmodule