module Sequence_detector(reset, clk, x, y);

  input reset, clk, x;  // Inputs: reset signal, clock, and data input x
  output y;           // Output: detection signal y

  wire j1, k1, q1, j2, k2, q2; // Internal wires for JK flip-flops

  // Instantiate the first JK flip-flop (ff1)
  jk_ff ff1(
    .reset(reset),
    .clk(clk),
    .j(j1),
    .k(k1),
    .q(q1)
  );

  // Instantiate the second JK flip-flop (ff2)
  jk_ff ff2(
    .reset(reset),
    .clk(clk),
    .j(j2),
    .k(k2),
    .q(q2)
  );


  // Logic for the output y: Detects the sequence/state
  // y is high when q1 is high, q2 is low, and x is low
  assign y = q1 & ~q2 & ~x;

  // Logic for the J and K inputs of the flip-flops (state transition logic)

  // j1 is high when q2 is high and x is high
  assign j1 = q2 & x;
  
  // k1 is high when q2 is high and x is low OR x is high and q1 is high
  assign k1 = (q2 & ~x) | (x & q1);

  // j2 is high when x is low
  assign j2 = ~x;

  // k2 is high when x is high
  assign k2 = x;

endmodule
