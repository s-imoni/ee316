`timescale 1ns / 1ps
module loadreg(
    input clk, load,     
    input [14:0]D,     
    output reg [15:0]Q,
    output reg fin
    ); 
    
    reg fin; 
    initial begin 
        Q = 0;
        fin = 0;
    end
    
    always @(posedge clk) begin     
        if(load) begin
            Q <= D; 
            fin <= 1;
        end
        else fin <= 0;
    end 
        
    endmodule 
