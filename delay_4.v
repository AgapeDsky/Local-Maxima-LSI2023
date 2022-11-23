module delay_4_8b(clk, hold, in, out);

  input clk, hold;
  input [7:0] in;
  output [7:0] out;

  wire [7:0] out_1, out_2, out_3, out_4;
  
  delay_8b delay_1 (.clk(clk), .hold(hold), .in(in), .out(out_1));
  delay_8b delay_2 (.clk(clk), .hold(hold), .in(out_1), .out(out_2));
  delay_8b delay_3 (.clk(clk), .hold(hold), .in(out_2), .out(out_3));
  delay_8b delay_4 (.clk(clk), .hold(hold), .in(out_3), .out(out_4));
  
  assign out = out_4;
  
endmodule

module delay_4_1b(clk, hold, in, out);

  input clk, hold;
  input in;
  output out;

  wire out_1, out_2, out_3, out_4;
  
  delay_1b delay_1 (.clk(clk), .hold(hold), .in(in), .out(out_1));
  delay_1b delay_2 (.clk(clk), .hold(hold), .in(out_1), .out(out_2));
  delay_1b delay_3 (.clk(clk), .hold(hold), .in(out_2), .out(out_3));
  delay_1b delay_4 (.clk(clk), .hold(hold), .in(out_3), .out(out_4));
  
  assign out = out_4;
  
endmodule