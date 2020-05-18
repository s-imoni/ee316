`timescale 1ns / 1ps

module tb_datapath;
reg clk = 0;
reg load, sel, Cin;
reg [15:0] sw;
wire [15:0] led;
always #5 clk = ~clk;

datapath uut(.clk(clk),
             .load(load),
             .sel(sel),
             .Cin(Cin),
             .sw(sw),
             .led(led));
             
initial begin;
load = 1;
sel = 0;
Cin = 0;
sw = 16'b0000000000000000;
#20
Cin = 1;
sw = 16'b0000000100000000;
#20
Cin = 0;
sw = 16'b0000010100010101;
#20
Cin = 0;
sw = 16'b0101011101110111;
#20
Cin = 1;
sw = 16'b1000011110000101;
#20
Cin = 0;
sw = 16'b1000010011000100;
#20
Cin = 1;
sw = 16'b1000100010000000;
#20
Cin = 1;
sw = 16'b1000101010011010;
#20
Cin = 0;
sw = 16'b1111111111101111;
#20
load = 1;
sel = 1;
Cin = 0;
sw = 16'b0000000000001000;
#20
Cin = 1;
sw = 16'b0100000100000001;
#20
Cin = 0;
sw = 16'b0001110100010101;
#20
Cin = 0;
sw = 16'b0111011101111111;
#20
Cin = 1;
sw = 16'b1010011110000111;
#20
Cin = 0;
sw = 16'b1100010011000100;
#20
Cin = 1;
sw = 16'b1000000010001000;
#20
Cin = 1;
sw = 16'b1000101010011010;
#20
Cin = 0;
sw = 16'b1111111111111011;
end

endmodule
