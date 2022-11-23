module delay_8b(clk, hold, in, out);
  
  input clk, hold;
  input [7:0] in;
  output reg [7:0] out;
  
  always @(posedge clk) begin
    if (!hold) out <= in;
  end

endmodule

module delay_1b(clk, hold, in, out);
  
  input clk, hold;
  input in;
  output reg out;
  
  always @(posedge clk) begin
   if (!hold) out <= in;
  end

endmodule