module compare_neighbor(clk, 
                        in, 
                        in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8,
                        res_1, res_2, res_3, res_4, res_5, res_6, res_7, res_8,
						out);
  
  // PORTS
  input clk;
  input [7:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8;
  input res_1, res_2, res_3, res_4, res_5, res_6, res_7, res_8;

  input [7:0] in;
  output reg out;

  // INTERNAL
  wire greater_1 = in_1 > in;
  wire greater_2 = in_2 > in;
  wire greater_3 = in_3 > in;
  wire greater_4 = in_4 > in;
  wire greater_5 = in_5 > in;
  wire greater_6 = in_6 > in;
  wire greater_7 = in_7 > in;
  wire greater_8 = in_8 > in;

  wire same_1 = in_1 == in;
  wire same_2 = in_2 == in;
  wire same_3 = in_3 == in;
  wire same_4 = in_4 == in;
  wire same_5 = in_5 == in;
  wire same_6 = in_6 == in;
  wire same_7 = in_7 == in;
  wire same_8 = in_8 == in;

  always @(*) begin
    if (greater_1|greater_2|greater_3|greater_4|greater_5|greater_6|greater_7|greater_8) out <= 0;
    else begin
        out = 1;
        // if (same_1) out = out & res_1;
        // if (same_2) out = out & res_2;
        // if (same_3) out = out & res_3;
        // if (same_4) out = out & res_4;
        // if (same_5) out = out & res_5;
        // if (same_6) out = out & res_6;
        // if (same_7) out = out & res_7;
        // if (same_8) out = out & res_8;
        out <= (!same_1 | res_1) & (!same_2 | res_2) & (!same_3 | res_3) & (!same_4 | res_4) & 
               (!same_5 | res_5) & (!same_6 | res_6) & (!same_7 | res_7) & (!same_8 | res_8);
    end
  end

endmodule