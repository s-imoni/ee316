`timescale 1ns / 1ps

module tb_mac(

    );
    
    reg clk = 0;
    reg load, reset;
    reg [15:0] sw;
    wire done;
    wire [15:0] led;
    wire [3:0] an;
    wire [6:0] seg;
    
    mac m(clk, load, reset, sw, done, led, an ,seg);
    always #5 clk = ~clk;
    
    initial begin
    sw = 16'h0000;
    reset = 0;
    load = 1;
    #5000
    load = 0;
    reset = 0;
    #200
    reset = 1;
    #200
    reset = 0;
    load = 1;
    #5000
    load = 0;
    end
endmodule
