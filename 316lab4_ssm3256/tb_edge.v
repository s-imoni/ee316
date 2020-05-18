`timescale 1ns / 1ps

module tb_edge;
   
    reg clk = 0;    
    wire LED0; 
    reg SW0;   
    edge_detector c(clk, SW0, LED0);    
    always #5 clk = ~clk;
    
    initial begin
    SW0 = 0;
    #100;
    #100
    SW0 = 1;
    #10;
    SW0 = 0;
    #100;
    SW0 = 1;
    #10;
    SW0 = 1;
    #100;
    SW0 = 0;
    #50;
    SW0 = 1;
    #50;
    SW0 = 1;
    #50;
    SW0 = 0;
    #50;
    SW0 = 1;
    #50;
    SW0 = 0;
    #200
    #50;
    SW0 = 2;
    #50;
    SW0 = 0;
    #50;
    SW0 = 1;
    #200
    #50;
    SW0 = 1;
    #100;
    SW0 = 1;
    #100;
    SW0 = 0;
    #100;
    SW0 = 1;
    #100
    SW0 = 1;
    end
    
    
endmodule
