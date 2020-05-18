`timescale 1ns / 1ps

module cla (     
    input clk, load,
    input [3:0] a, b,
    input Cin,     
    output [7:0] total);
    
    wire [3:0] G, P;
    wire [4:0] sum, C; 

    assign G[0] = a[0] & b[0];
    assign G[1] = a[1] & b[1];
    assign G[2] = a[2] & b[2];
    assign G[3] = a[3] & b[3];
    
    assign P[0] = a[0] ^ b[0];
    assign P[1] = a[1] ^ b[1];
    assign P[2] = a[2] ^ b[2];
    assign P[3] = a[3] ^ b[3];
    
    assign C[0] = Cin;
    assign C[1] = (P[0] & C[0]) | G[0];
    assign C[2] = (P[1] & P[0] & C[0]) | (P[1] & G[0]) | G[1];
    assign C[3] = (P[2] & P[1] & P[0] & C[0]) | (P[2] & P[1] & G[0]) | (P[2] & G[1]) | G[2];
    assign C[4] = (P[3] & P[2] & P[1] & P[0] & C[0]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & G[1]) | (P[3] & G[2]) | G[3];
    
    assign total[0] = P[0] ^ C[0];
    assign total[1] = P[1] ^ C[1];
    assign total[2] = P[2] ^ C[2];
    assign total[3] = P[3] ^ C[3];
    assign total[4] = C[4];
    assign total[7:5] = 3'b000;
    
endmodule
