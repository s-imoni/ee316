`timescale 1ns / 1ps


module tb_mult(

    );
    
    reg clk = 0;
    reg start  = 0;
    wire stop;
    reg [7:0] sw;
    wire [7:0] product;
    mult uut(clk, start, sw, stop, product); 
    
    always #5 clk = ~clk;
    
    initial begin
    sw[3:0] = 1;
    sw[7:4] = 0;
    start = 1;
    #10
    start = 0;
    #150
    sw[3:0] = 0;
    sw[7:4] = 1;
    start = 1;
    #10
    start = 0;
    #150
    sw[3:0] = 10;
    sw[7:4] = 1;
    start = 1;
    #10
    start = 0;
    #150   
    sw[3:0] = 5;
    sw[7:4] = 2;
    start = 1;
    #10
    start = 0;
    #150
    sw[3:0] = 9;
    sw[7:4] = 7;
    start = 1;
    #10
    start = 0;
    #150
    sw[3:0] = 15;
    sw[7:4] = 15;
    start = 1;
    #10
    start = 0;
    #150
    sw[3:0] = 10;
    sw[7:4] = 15;
    start = 1;
    #10
    start = 0;
    #150
    start = 0;
    
    end
    
endmodule