module compare_neighbor_tb();

    reg clk;
    reg [7:0] in;
    reg [7:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8;
    reg res_1, res_2, res_3, res_4, res_5, res_6, res_7, res_8;
    wire out;

    compare_neighbor compare_neighbor_1
                   (clk, 
                    in, 
                    in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8,
                    res_1, res_2, res_3, res_4, res_5, res_6, res_7, res_8,
                    out);

    initial begin
        in <= 0;

        in_1 <= 1; in_2 <= 2;
        in_3 <= 3; in_4 <= 4;
        in_5 <= 5; in_6 <= 6;
        in_7 <= 7; in_8 <= 8;
        
        res_1 <= 1; res_2 <= 1;
        res_3 <= 1; res_4 <= 1;
        res_5 <= 1; res_6 <= 1;
        res_7 <= 1; res_8 <= 1;

        #10; in <= 4;
        #10; in <= 8;
        #10; res_8 <= 0;
        #10; in_6 <= 5; in_7 <= 5; in_8 <= 5;
        #10; in <= 5;
        #10; res_8 <= 1;
    end

    initial begin
        clk <= 0;
        forever begin
            #5;
            clk <= !clk;
        end
    end
endmodule