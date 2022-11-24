module local_maxima_cpu (clk, rst, en, in, out, finish);

    // PORTS
    input clk, rst, en;
    input [7:0] in;
    output out;
    output reg finish;

    // INTERNAL
    reg hold = 0;
    reg [7:0] row = 0, col = 0, count = 0;
    reg [7:0] iteration = 0;

    // INPUT DATAPATH
    wire [7:0] d1_0_8b_out, d1_1_8b_out, d1_2_8b_out, d1_3_8b_out, d1_4_8b_out, d1_5_8b_out;
    wire [7:0] d4_0_8b_out, d4_1_8b_out;
    reg [7:0] d1_0_8b_in;
    delay_8b d1_0_8b  (.clk(clk), .hold(hold), .in(d1_0_8b_in) , .out(d1_0_8b_out));
    delay_8b d1_1_8b  (.clk(clk), .hold(hold), .in(d1_0_8b_out), .out(d1_1_8b_out));
    delay_4_8b d4_0_8b(.clk(clk), .hold(hold), .in(d1_1_8b_out), .out(d4_0_8b_out));
    delay_8b d1_2_8b  (.clk(clk), .hold(hold), .in(d4_0_8b_out), .out(d1_2_8b_out));
    delay_8b d1_3_8b  (.clk(clk), .hold(hold), .in(d1_2_8b_out), .out(d1_3_8b_out));
    delay_4_8b d4_1_8b(.clk(clk), .hold(hold), .in(d1_3_8b_out), .out(d4_1_8b_out));
    delay_8b d1_4_8b  (.clk(clk), .hold(hold), .in(d4_1_8b_out), .out(d1_4_8b_out));
    delay_8b d1_5_8b  (.clk(clk), .hold(hold), .in(d1_4_8b_out), .out(d1_5_8b_out));

    // OUTPUT DATAPATH
    wire d1_0_1b_out, d1_1_1b_out, d1_2_1b_out, d1_3_1b_out, d1_4_1b_out, d1_5_1b_out;
    wire d4_0_1b_out, d4_1_1b_out;
    reg d1_0_1b_in;

    delay_1b d1_0_1b  (.clk(clk), .hold(hold), .in(d1_0_1b_in) , .out(d1_0_1b_out));
    delay_1b d1_1_1b  (.clk(clk), .hold(hold), .in(d1_0_1b_out), .out(d1_1_1b_out));
    delay_4_1b d4_0_1b(.clk(clk), .hold(hold), .in(d1_1_1b_out), .out(d4_0_1b_out));
    delay_1b d1_2_1b  (.clk(clk), .hold(hold), .in(d4_0_1b_out), .out(d1_2_1b_out));
    delay_1b d1_3_1b  (.clk(clk), .hold(hold), .in(d1_2_1b_out), .out(d1_3_1b_out));
    delay_4_1b d4_1_1b(.clk(clk), .hold(hold), .in(d1_3_1b_out), .out(d4_1_1b_out));
    delay_1b d1_4_1b  (.clk(clk), .hold(hold), .in(d4_1_1b_out), .out(d1_4_1b_out));
    delay_1b d1_5_1b  (.clk(clk), .hold(hold), .in(d1_4_1b_out), .out(d1_5_1b_out));

    // NEIGHBOR COMPUTATION
    wire [7:0] in_cmp; wire out_cmp;
    wire [7:0] in_1_cmp, in_2_cmp, in_3_cmp, in_4_cmp, in_5_cmp, in_6_cmp, in_7_cmp, in_8_cmp;
    wire res_1_cmp, res_2_cmp, res_3_cmp, res_4_cmp, res_5_cmp, res_6_cmp, res_7_cmp, res_8_cmp;

    assign in_1_cmp = (col == 1) ? 0 : (row == 1) ? 0 : d1_5_8b_out;
    assign in_2_cmp = (row == 1) ? 0 : d1_4_8b_out;
    assign in_3_cmp = (col == 6) ? 0 : (row == 1) ? 0 : d4_1_8b_out;
    assign in_4_cmp = (col == 1) ? 0 : d1_3_8b_out;
    assign in_cmp   = d1_2_8b_out;
    assign in_5_cmp = (col == 6) ? 0 : d4_0_8b_out;
    assign in_6_cmp = (col == 1) ? 0 : (row == 6) ? 0 : d1_1_8b_out;
    assign in_7_cmp = (row == 6) ? 0 : d1_0_8b_out;
    assign in_8_cmp = (col == 6) ? 0 : (row == 6) ? 0 : d1_0_8b_in ;

    assign res_1_cmp = d1_5_1b_out, res_2_cmp = d1_4_1b_out, res_3_cmp = d4_1_1b_out;
    assign res_4_cmp = d1_3_1b_out, res_cmp   = d1_2_1b_out, res_5_cmp = d4_0_1b_out;
    assign res_6_cmp = d1_1_1b_out, res_7_cmp = d1_0_1b_out, res_8_cmp = d1_0_1b_in ;

    compare_neighbor cmp(
        .clk(clk),
        .in(in_cmp),
        .in_1(in_1_cmp), .in_2(in_2_cmp), .in_3(in_3_cmp), .in_4(in_4_cmp), .in_5(in_5_cmp), .in_6(in_6_cmp), .in_7(in_7_cmp), .in_8(in_8_cmp), 
        .res_1(res_1_cmp), .res_2(res_2_cmp), .res_3(res_3_cmp), .res_4(res_4_cmp), .res_5(res_5_cmp), .res_6(res_6_cmp), .res_7(res_7_cmp), .res_8(res_8_cmp), 
        .out(out_cmp)
    );

    // REGISTER BANKS
    wire [7:0] input_bank_address;
    wire [7:0] output_bank_address;

    wire bank_en_write;
    wire output_bank_data; wire [7:0] input_bank_data;
    regfile_8b input_bank(clk, input_bank_address, bank_en_write, input_bank_data);
    regfile_1b output_bank(clk, output_bank_address, bank_en_write, output_bank_data);

    // assign bank_address = (count == 42) ? 1 : count;
    assign input_bank_address = (iteration == 1) ? count : count + 2;
    assign output_bank_address = (iteration == 1) ? count : count + 7+2;
    assign bank_en_write = (iteration == 1);

    assign input_bank_data = (bank_en_write) ? d1_0_8b_in : 8'bZ;
    assign output_bank_data = bank_en_write ? out_cmp : 1'bZ;

    always @(posedge clk) begin
        if (!rst) begin
            col <= 0;
            row <= 1;
            count <= 0+2;
            iteration <= 1;
        end
        else begin
            d1_0_8b_in <= (count >= 36+2) ? 0 : bank_en_write ? in : input_bank_data;
            d1_0_1b_in <= bank_en_write ? 1  : output_bank_data;
            col <= (count <= 7+2) ? 1 : (col == 6) ? 1 : (count > 36+2) ? col : col+1;
            row <= (count <= 7+2) ? 1 : (col != 6) ? row : (row == 6) ? 1 : (count > 36+2) ? row : row+1;
            count <= (count == 42+2) ? 1 : count+1;
            iteration <= (count == 42+2) ? iteration+1 : iteration;
        end
    end

endmodule