`timescale 1ns / 1ps


module tb_adders;
reg [8:0] sw;
wire [4:0] ledCLA;
wire [4:0] ledRCA;
reg btnC = 0;
reg clk = 0;
always #5 clk = ~clk;
rca uuv(.a(sw[7:4]), .b(sw[3:0]), .Cin(sw[8]), .total(ledRCA), .load(btnC), .clk(clk));
cla uut(.a(sw[7:4]), .b(sw[3:0]), .Cin(sw[8]), .total(ledCLA), .load(btnC), .clk(clk));

initial begin;
btnC = 1;
sw = 9'b000000000;
btnC = 0;
#20
btnC = 1;
sw = 9'b100000001;
#20
sw = 9'b000010101;
#20
sw = 9'b001110111;
#20
sw = 9'b110000111;
#20
sw = 9'b011000100;
#20
sw = 9'b110001000;
#20
sw = 9'b110011010;
#20
sw = 9'b011111111;
end

endmodule
