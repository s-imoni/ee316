`timescale 1ns / 1ps

module decoder(
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
    
    
    // structural
    wire upnot;
    wire leftnot;
    wire rightnot;
    not n0(upnot, up);
    not n1(leftnot, left);
    not n2(rightnot, right);
    and a0(combo0, upnot, leftnot, rightnot, enable);
    and a1(combo1, upnot, leftnot, right, enable);
    and a2(combo2, upnot, left, rightnot, enable);
    and a3(combo3, upnot, left, right, enable);
    and a4(combo4, up, leftnot, rightnot, enable);
    and a5(combo5, up, leftnot, right, enable);
    and a6(combo6, up, left, rightnot, enable);
    and a7(combo7, up, left, right, enable);
    
    // dataflow
//    assign combo0 = ~up & ~left & ~right & enable;
//    assign combo1 = ~up & ~left & right & enable;
//    assign combo2 = ~up & left & ~right & enable;
//    assign combo3 = ~up & left & right & enable;
//    assign combo4 = up & ~left & ~right & enable;
//    assign combo5 = up & ~left & right & enable;
//    assign combo6 = up & left & ~right & enable;
//    assign combo7 = up & left & right & enable;
    
    // behavioral
//    reg combo0_buf = 0;
//    assign combo0 = combo0_buf;
//    reg combo1_buf = 0;
//    assign combo1 = combo1_buf;
//    reg combo2_buf = 0;
//    assign combo2 = combo2_buf;
//    reg combo3_buf = 0;
//    assign combo3 = combo3_buf;
//    reg combo4_buf = 0;
//    assign combo4 = combo4_buf;
//    reg combo5_buf = 0;
//    assign combo5 = combo5_buf;    
//    reg combo6_buf = 0;
//    assign combo6 = combo6_buf;    
//    reg combo7_buf = 0;
//    assign combo7 = combo7_buf;                             
//    always @(*)             
//    begin
//        combo0_buf = 0; 
//        combo1_buf = 0; 
//        combo2_buf = 0; 
//        combo3_buf = 0; 
//        combo4_buf = 0; 
//        combo5_buf = 0;
//        combo6_buf = 0;
//        combo7_buf = 0;
//        case({up, left, right, enable})                   
//        4'b0000: combo0_buf = 0;
//        4'b0001: combo0_buf = 1;    
//        4'b0010: combo1_buf = 0;
//        4'b0011: combo1_buf = 1;
//        4'b0100: combo2_buf = 0;
//        4'b0101: combo2_buf = 1;
//        4'b0110: combo3_buf = 0;
//        4'b0111: combo3_buf = 1;
//        4'b1000: combo4_buf = 0;
//        4'b1001: combo4_buf = 1;
//        4'b1010: combo5_buf = 0;
//        4'b1011: combo5_buf = 1;
//        4'b1100: combo6_buf = 0;
//        4'b1101: combo6_buf = 1;
//        4'b1110: combo7_buf = 0;
//        4'b1111: combo7_buf = 1;
//        default: combo0_buf = 0; 
//        endcase
//    end 
    
    
endmodule
