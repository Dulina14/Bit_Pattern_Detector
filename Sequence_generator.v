module Sequence_generator(reset, clk, seq); 

  localparam init_seq = 4'b1000; 

  input reset, clk;
  output seq;

  reg [($size(init_seq)-1):0] seq_reg; 
  
  assign seq = seq_reg[($size(init_seq)-1)];

  always @(posedge clk, posedge reset) begin
    if (reset) begin
      seq_reg <= init_seq;
    end else begin
      seq_reg <= {seq_reg[($size(init_seq)-2):0], 
                 seq_reg[($size(init_seq)-1)] ^ seq_reg[($size(init_seq)-2)]};
    end
  end

endmodule
