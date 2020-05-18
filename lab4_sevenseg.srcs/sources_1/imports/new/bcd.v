`timescale 1ns / 1ps

module bcd(
   input [3:0] sw,
   //output [3:0] an,
   output [6:0] seg
   //output dp
    );
    
    //assign an = 4'b1110; // Enable rightmost anode, an0
    //assign dp = 1; // Disable decimal point since we aren't using it in this lab

    //structural
    wire swnot[3:0];
    not n0(swnot[0], sw[0]);
    not n1(swnot[1], sw[1]);
    not n2(swnot[2], sw[2]);
    not n3(swnot[3], sw[3]);
    wire a[3:0];
    and ag1(a[0], swnot[3], swnot[2], swnot[1], sw[0]);
    and ag2(a[1], sw[3], sw[2], swnot[1], sw[0]);
    and ag3(a[2], swnot[3], sw[2], swnot[1], swnot[0]);
    and ag4(a[3], sw[3], swnot[2], sw[1], sw[0]);
    or or1(seg[0], a[0], a[1], a[2], a[3]);
    wire b[3:0];
    and bg1(b[0], swnot[3], sw[2], swnot[1], sw[0]);
    and bg2(b[1], sw[3], sw[1], sw[0]);
    and bg3(b[2], sw[2], sw[1], swnot[0]);
    and bg4(b[3], sw[3], sw[2], swnot[0]);
    or or2(seg[1], b[0], b[1], b[2], b[3]);
    wire c[2:0];
    and cg1(c[0], sw[3], sw[2], swnot[0]);
    and cg2(c[1], swnot[3], swnot[2], sw[1], swnot[0]);
    and cg3(c[2], sw[3], sw[2], sw[1]);
    or or3(seg[2], c[0], c[1], c[2]);
    wire d[3:0];
    and dg1(d[0], sw[2], sw[1], sw[0]);
    and dg2(d[1], sw[3], swnot[2], sw[1], swnot[0]);
    and dg3(d[2], swnot[3], sw[2], swnot[1], swnot[0]);
    and dg4(d[3], swnot[3], swnot[2], swnot[1], sw[0]);
    or or4(seg[3], d[0], d[1], d[2], d[3]);
    wire e[2:0];
    and eg1(e[0], swnot[2], swnot[1], sw[0]);
    and eg2(e[1], swnot[3], sw[2], swnot[1]);
    and eg3(e[2], swnot[3], sw[0]);
    or or5(seg[4], e[0], e[1], e[2]);
    wire f[3:0];
    and fg1(f[0], sw[3], sw[2], swnot[1], sw[0]);
    and fg2(f[1], swnot[3], swnot[2], sw[0]);
    and fg3(f[2], swnot[3], swnot[2], sw[1]);
    and fg4(f[3], swnot[3], sw[1], sw[0]);
    or or6(seg[5], f[0], f[1], f[2], f[3]);
    wire g[2:0];
    and gg1(g[0], swnot[3], swnot[2], swnot[1]);
    and gg2(g[1], swnot[3], sw[2], sw[1], sw[0]);
    and gg3(g[2], sw[3], sw[2], swnot[1], swnot[0]);
    or or7(seg[6], g[0], g[1], g[2]);
    
    
    //dataflow
//    assign seg[0] = (~sw[3] & ~sw[2] & ~sw[1] & sw[0]) |  
//                    (sw[3] & sw[2] & ~sw[1] & sw[0]) |
//                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |  
//                    (sw[3] & ~sw[2] & sw[1] & sw[0]);  // a
//    assign seg[1] = (~sw[3] & sw[2] & ~sw[1] & sw[0]) |  
//                    (sw[3] & sw[1] & sw[0]) |
//                    (sw[2] & sw[1] & ~sw[0]) |  
//                    (sw[3] & sw[2] & ~sw[0]); // b
//    assign seg[2] = (sw[3] & sw[2] & ~sw[0]) |  
//                    (~sw[3] & ~sw[2] & sw[1] & !sw[0]) |
//                    (sw[3] & sw[2] & sw[1]); // c
//    assign seg[3] = (sw[2] & sw[1] & sw[0]) |  
//                    (sw[3] & ~sw[2] & sw[1] & ~sw[0]) |
//                    (~sw[3] & sw[2] & ~sw[1] & ~sw[0]) |  
//                    (~sw[3] & ~sw[2] & ~sw[1] & sw[0]); // d
//    assign seg[4] = (~sw[2] & ~sw[1] & sw[0]) |  
//                    (~sw[3] & sw[2] & ~sw[1]) |
//                    (~sw[3] & sw[0]); // e
//    assign seg[5] = (sw[3] & sw[2] & ~sw[1] & sw[0]) |  
//                    (~sw[3] & ~sw[2] & sw[0]) |
//                    (~sw[3] & ~sw[2] & sw[1]) |  
//                    (~sw[3] & sw[1] & sw[0]);
//    assign seg[6] = (~sw[3] & ~sw[2] & ~sw[1]) |  
//                    (~sw[3] & sw[2] & sw[1] & sw[0]) |
//                    (sw[3] & sw[2] & ~sw[1] & ~sw[0]);
    
      //behavioral
//    reg [6:0]seg_buf = 7'b0000000; //  4x1 Mux without Enable Bit
//    assign seg[6:0] = seg_buf[6:0];       
//    always @(*)             
//    begin                   
//        case({sw[3:0]})          
//        4'b0000: seg_buf[6:0] = 7'b1000000; // 0
//        4'b0001: seg_buf[6:0] = 7'b1111001; // 1
//        4'b0010: seg_buf[6:0] = 7'b0100100; // 2
//        4'b0011: seg_buf[6:0] = 7'b0110000; // 3
//        4'b0100: seg_buf[6:0] = 7'b0011001; // 4
//        4'b0101: seg_buf[6:0] = 7'b0010010; // 5
//        4'b0110: seg_buf[6:0] = 7'b0000010; // 6
//        4'b0111: seg_buf[6:0] = 7'b1111000; // 7
//        4'b1000: seg_buf[6:0] = 7'b0000000; // 8
//        4'b1001: seg_buf[6:0] = 7'b0010000; // 9
//        4'b1010: seg_buf[6:0] = 7'b0001000; // A
//        4'b1011: seg_buf[6:0] = 7'b0000011; // b
//        4'b1100: seg_buf[6:0] = 7'b1000110; // C
//        4'b1101: seg_buf[6:0] = 7'b0100001; // d
//        4'b1110: seg_buf[6:0] = 7'b0000110; // E
//        4'b1111: seg_buf[6:0] = 7'b0001110; // F
//        default: seg_buf[6:0] = 7'b1111111;
//        endcase
//    end 
    
endmodule
