`timescale 1ns / 1ps
  
module datapath (     
     input clk, load, sel, Cin,
     input [15:0] sw,
     output [15:0] led); 

wire [15:0] data;
wire [7:0] rip;
wire [7:0] c;

rca ripple(clk, load, sw[7:4], sw[3:0], Cin, rip);
cla carry(clk, load, sw[15:12], sw[11:8], Cin, c);


assign data[15:8] = sel ? c : 8'b00000000;
assign data[7:0] = sel ? 8'b00000000 : rip;

loadreg ld(clk, load, data, led);

endmodule
