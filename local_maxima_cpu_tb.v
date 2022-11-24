module local_maxima_cpu_tb();

    reg clk, rst, en;
    reg [7:0] in;
    wire finish;
    wire out;

    local_maxima_cpu_v2 local_maxima_cpu_1(clk, rst, en, in, out, finish);

    initial begin
        rst <= 0;
        
        #50;

        rst <= 1;
        en <= 1;

        in <= 2; #50; in <= 3; #50; in <= 1; #50; in <= 4; #50; in <= 0; #50; in <= 0; #50; 
        in <= 1; #50; in <= 4; #50; in <= 4; #50; in <= 3; #50; in <= 2; #50; in <= 2; #50; 
        in <= 3; #50; in <= 2; #50; in <= 0; #50; in <= 1; #50; in <= 4; #50; in <= 4; #50; 
        in <= 4; #50; in <= 4; #50; in <= 1; #50; in <= 5; #50; in <= 0; #50; in <= 3; #50; 
        in <= 1; #50; in <= 2; #50; in <= 0; #50; in <= 4; #50; in <= 2; #50; in <= 0; #50; 
        in <= 4; #50; in <= 3; #50; in <= 2; #50; in <= 1; #50; in <= 3; #50; in <= 4; #50; 
    end

    initial begin
        clk <= 1;
        forever begin
            #25; clk <= !clk;
        end
    end
endmodule