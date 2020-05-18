`timescale 1ns / 1ps

module mux(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input s0,
    input s1,
    output LED0
    );
    
    //structural
    wire s0not;
    wire s1not;
    wire o1;
    wire o2;
    wire o3;
    wire o4;
    not n0(s0not, s0);
    not n1(s1not, s1);
    and g0(o1, btnU, s0not, s1not);
    and g1(o2, btnD, s0, s1not);
    and g2(o3, btnL, s0not, s1);
    and g3(o4, btnR, s0, s1);
    or g4(LED0, o1, o2, o3, o4);
    
    //dataflow
//    assign LED0 = (btnU & ~s0 & ~s1) |
//               (btnD & ~s0 & s1) | 
//               (btnL & s0 & ~s1) | 
//               (btnR & s0 & s1);    
    
//    //behavioral
//    reg LED0_buf=0; //  4x1 Mux without Enable Bit
//    assign LED0 = LED0_buf;       
//    always @(*)             
//    begin                   
//        case({s1, s0})          
//        2'b00: LED0_buf=btnU;
//        2'b01: LED0_buf=btnD;
//        2'b10: LED0_buf=btnL;
//        2'b11: LED0_buf=btnR;
//        default: LED0_buf = 0;
//        endcase
//    end 
    
endmodule
