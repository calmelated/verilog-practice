
module nor_latch(
  input S, 
  input R, 
  output Q, 
  output Qb
);
  nor n1(Q, S, Qb);
  nor n2(Qb, R, Q);
endmodule

module nand_latch(
  input S, 
  input R, 
  output Q, 
  output Qb
);
  nand n1(Q, S, Qb);
  nand n2(Qb, R, Q);
endmodule

module main;
  reg S, R;
  wire Q, Qb;

  nand_latch nand_latch(S, R, Q, Qb);
  // nor_latch nor_latch(S, R, Q, Qb);

  initial begin
    S = 0;
    R = 0;
    $dumpfile("srlatch.vcd");
    $dumpvars;
  end

  always #50 begin
    S = S + 1;
  end

  always #300 begin
    R = R + 1;
  end

  initial #1000 $finish;

endmodule