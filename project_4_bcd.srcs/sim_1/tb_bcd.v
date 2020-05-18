`timescale 1ns / 1ps

module tb_bcd;

reg [3:0]sw;
wire [3:0]an;
wire [6:0]seg;
wire dp;

bcd uut( .sw(sw), .an(an), .seg(seg), .dp(dp));

initial begin
    sw[3:0] = 4'b0000; 
    #10
    sw[3:0] = 4'b0001;
    #10
    sw[3:0] = 4'b0010;
    #10
    sw[3:0] = 4'b0011;
    #10
    sw[3:0] = 4'b0100;
    #10
    sw[3:0] = 4'b0101;
    #10
    sw[3:0] = 4'b0110;
    #10
    sw[3:0] = 4'b0111;
    #10
    sw[3:0] = 4'b1000;
    #10
    sw[3:0] = 4'b1001;
    #10
    sw[3:0] = 4'b1010;
    #10
    sw[3:0] = 4'b1011;
    #10
    sw[3:0] = 4'b1100;
    #10
    sw[3:0] = 4'b1101;
    #10
    sw[3:0] = 4'b1110;
    #10
    sw[3:0] = 4'b1111;
    #10
   
end
   
endmodule
