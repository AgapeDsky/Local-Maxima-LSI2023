module local_maxima_cpu_tb();

    reg clk, rst, en;
    reg [7:0] in;
    wire finish;
    wire out;

    local_maxima_cpu_v2 local_maxima_cpu_1(clk, rst, en, in, out, finish);

    initial begin
        rst <= 0;
        
        #10;

        rst <= 1;
        en <= 1;

        in <= 2; #10; in <= 3; #10; in <= 1; #10; in <= 4; #10; in <= 0; #10; in <= 0; #10; 
        in <= 1; #10; in <= 4; #10; in <= 4; #10; in <= 3; #10; in <= 2; #10; in <= 2; #10; 
        in <= 3; #10; in <= 2; #10; in <= 0; #10; in <= 1; #10; in <= 4; #10; in <= 4; #10; 
        in <= 4; #10; in <= 4; #10; in <= 1; #10; in <= 5; #10; in <= 0; #10; in <= 3; #10; 
        in <= 1; #10; in <= 2; #10; in <= 0; #10; in <= 4; #10; in <= 2; #10; in <= 0; #10; 
        in <= 4; #10; in <= 3; #10; in <= 2; #10; in <= 1; #10; in <= 3; #10; in <= 4; #10; 
    end

    initial begin
        clk <= 1;
        forever begin
            #5; clk <= !clk;
        end
    end
endmodule