module jk_ff (
    input reset, clk, j, k,  // Define inputs
    output reg q             // Define output (also a register)
);

// Always block triggered on positive edges of 'clk' or 'reset'
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 0;  // Reset the flip-flop to 0
    end else begin
        if (j == 1 && k == 1) begin
            q <= ~q;  // Toggle the state
        end else if (j == 1 && k == 0) begin
            q <= 1;  // Set the state to 1
        end else if (j == 0 && k == 1) begin
            q <= 0;  // Reset the state to 0
        end
        // No need for an explicit 'else' here since 'q' holds its value by default
    end
end

endmodule
