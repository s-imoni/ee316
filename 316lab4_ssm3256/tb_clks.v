`timescale 1ns / 1ps

module tb_clks;    
    reg clk = 0;    
    wire [15:0] led;    
    clks c(clk, led);    
    always #5 clk = ~clk;
endmodule
