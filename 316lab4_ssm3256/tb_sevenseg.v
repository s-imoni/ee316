`timescale 1ns / 1ps


module tb_sevenseg;
    reg [15:0]sw;  
    reg reset;  
    wire [3:0] an;  
    wire [6:0] seg;
    reg clk = 0;     
    always #5 clk = ~clk;
    sevenseg mod(clk, sw, reset, an, seg);
    
    initial begin
    reset = 1;
    sw = 'h1111;
    #100;
    reset = 0;
    sw = 'h2222;
    #100;
    sw = 'h3333;
    #100;
    sw = 'h4444;
    #100;
    sw = 'h5555;
    #100;
    sw = 'h6666;
    #100;
    reset = 0;
    sw = 'h9999;
    #100;
    reset = 0;
    sw = 'h8888;
    #100;
    reset = 0;
    sw = 'h9999;
    #100;
    sw = 'h0000;
    #100;
    sw = 'h9999;
    #100;
    reset = 0;
    sw = 'h8888;
    #100;
    reset = 1;
    sw = 'h9999;
    #100;
    sw = 'h0000;
    #100;
    sw = 'h9999;
    #100;
    reset = 0;
    sw = 'h8723;
    #100;
    reset = 0;
    sw = 'h0248;
    #100;
    sw = 'h0990;
    #100;
    
    
     end
       
endmodule
