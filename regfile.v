module regfile_8b(input clock, input [7:0] address, input en_write, inout [7:0] data);

// Register file storage
reg [7:0] registers [63:0];
reg [7:0] out_val;

// Read and write from register file
always @(posedge clock) begin
    if (en_write)
        registers[address] <= data;
    else
        out_val <= registers[address];
end

// Output data if not writing. If we are writing,
// do not drive output pins. This is denoted
// by assigning 'z' to the output pins.
assign data = en_write ? 8'bz : out_val;

endmodule

module regfile_1b(input clock, input [7:0] address, input en_write, inout data);

// Register file storage
reg registers[63:0];
reg out_val;

// Read and write from register file
always @(posedge clock) begin
    if (en_write)
        registers[address] <= data;
    else
        out_val <= registers[address];
end

// Output data if not writing. If we are writing,
// do not drive output pins. This is denoted
// by assigning 'z' to the output pins.
assign data = en_write ? 1'bz : out_val;

endmodule