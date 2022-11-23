module delay_4_8b_tb();

    reg [7:0] in;
    reg clk;
    wire [7:0] out;

    delay_4_8b delay_4_1 (.in(in), .hold(0), .clk(clk), .out(out));

    initial begin
        in <= 1;
        forever begin
            #10; in <= in + 1;
        end
    end

    initial begin
        clk <= 0;
        forever begin
            #10; clk <= !clk;
        end
    end

endmodule
