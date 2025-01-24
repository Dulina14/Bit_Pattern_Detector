`timescale 10ns/1ns // Timing information for the simulator.
// 10ns − means #1 corresponds to 10 nano seconds.
// 1ns − means the accuracy should be upto 1 nano second.
module tb_sequence_detector(); // Module definition start.
// Just another ordinary module, but without
// any inputs/outputs.
reg reset, clk; // Registers to hold the values for ’clk’ and ’reset’
wire x, y; // Wires to connect inputs and outputs of the modules being tested.

Sequence_generator sg( 
.reset(reset), // Connect the reset signal
.clk(clk), // Connect the clock signal
.seq(x) // Connect the sequence signal
);

Sequence_detector sd(
.reset(reset), // Connect the reset signal
.clk(clk), // Connect the clock signal
.x(x), // Connect the input signal x
.y(y) // Connect the output signal y
);

// Testbench
initial begin // Triggered at the very beginning. This is not synthesizeable.
clk = 0; // Initialize ’clk’ to zero
reset = 0; // Initialize ’reset’ to zero
// All the modules need to be reset to start from a definite internal state.
// Hence, we need to generate a ’reset’ posedge in the beginnig.
#1 reset = 1; // After 10ns, make ’reset’ high
#1 reset = 0; // After another 10ns, make ’reset’ low
end
always #1 clk <= ~clk; // Triggered at each 10ns period.
// Each time, the state of ’clk’ will be inverted, causing
// it to act as a clock signal. Note that the
// delay operator ’#’ is not synthesizable.

initial begin
    $dumpfile("dump.vcd"); // Specify the VCD file name
    $dumpvars(0, tb_sequence_detector); // Dump all signals in the testbench
end


endmodule // Module definition end
