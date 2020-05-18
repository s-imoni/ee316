`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2020 03:42:38 PM
// Design Name: 
// Module Name: decoder_behavioral
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_behavioral(
    input up,
    input left,
    input right,
    input enable,
    output combo0,
    output combo1,
    output combo2,
    output combo3,
    output combo4,
    output combo5,
    output combo6,
    output combo7
    );
      
    reg combo0_buf = 0;
    assign combo0 = combo0_buf;
    reg combo1_buf = 0;
    assign combo1 = combo1_buf;
    reg combo2_buf = 0;
    assign combo2 = combo2_buf;
    reg combo3_buf = 0;
    assign combo3 = combo3_buf;
    reg combo4_buf = 0;
    assign combo4 = combo4_buf;
    reg combo5_buf = 0;
    assign combo5 = combo5_buf;    
    reg combo6_buf = 0;
    assign combo6 = combo6_buf;    
    reg combo7_buf = 0;
    assign combo7 = combo7_buf;                             
    always @(*)             
    begin
        case({up, left, right, enable})                   
        4'b0000: combo0_buf = 0;  
        4'b0001: combo0_buf = 1;    
        4'b0010: combo1_buf = 0;
        4'b0011: combo1_buf = 1;
        4'b0100: combo2_buf = 0;
        4'b0101: combo2_buf = 1;
        4'b0110: combo3_buf = 0;
        4'b0111: combo3_buf = 1;
        4'b1000: combo4_buf = 0;
        4'b1001: combo4_buf = 1;
        4'b1010: combo5_buf = 0;
        4'b1011: combo5_buf = 1;
        4'b1100: combo6_buf = 0;
        4'b1101: combo6_buf = 1;
        4'b1110: combo7_buf = 0;
        4'b1111: combo7_buf = 1;
        endcase
    end 
endmodule
