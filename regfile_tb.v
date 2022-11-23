module regfile_tb();

    reg clock;
    reg [7:0] address;
    reg en_write;

    reg [7:0] data_in;
    wire [7:0] data_out;
    wire [7:0] data;

    regfile_8b regfile_8b_1(clock, address, en_write, data);

    initial begin
        // write seq
        en_write <= 1; address <= 0; data_in <= 2; #10;
        en_write <= 1; address <= 2; data_in <= 3; #10;
        en_write <= 1; address <= 4; data_in <= 4; #10;
        en_write <= 1; address <= 20; data_in <= 5; #10;
        // read seq
        if (1) begin en_write = 0; address = 0;  end #10;
        if (1) begin en_write = 0; address = 2;  end #10;
        if (1) begin en_write = 0; address = 4;  end #10;
        if (1) begin en_write = 0; address = 20; end #10;
    end

    initial begin
        clock <= 1;
        forever begin
            #5;
            clock <= !clock;
        end
    end

    assign data_out = en_write ? 8'bZ : data;
    assign data = en_write ? data_in : 8'bZ;

endmodule