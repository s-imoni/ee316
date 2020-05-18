`timescale 1ns / 1ps

module mux(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input enable,
    input s0,
    input s1,
    wire s0not,
    wire s1not,
    wire o1,
    wire o2,
    wire o3,
    wire o4,
    output LED0
    );
    
    //structural
    not n0(s0not, s0);
    not n1(s1not, s1);
    and g0(o1, btnU, s0not, s1not, enable);
    and g1(o2, btnD, s0not, s1not, enable);
    and g2(o3, btnL, s0not, s1not, enable);
    and g3(o4, btnR, s0not, s1not, enable);
    or g4(LED0, o1, o2, o3, o4);
    
    //dataflow
    assign LED0 = (btnU & ~s0 & ~s1 & enable) |
               (btnD & ~s0 & s1 & enable) | 
               (btnL & s0 & ~s1 & enable) | 
               (btnR & s0 & s1 & enable);    
    
    //behavioral
    reg LED0_buf=0; //  4x1 Mux with Enable Bit
    assign LED0 = LED0_buf;       
    always @(*)             
    begin                   
        case({s0, s1, enable})        
        3'b000: LED0_buf=0;    
        3'b001: LED0_buf=btnU;
        3'b010: LED0_buf=0;
        3'b011: LED0_buf=btnD;
        3'b100: LED0_buf=0;
        3'b101: LED0_buf=btnL;
        3'b110: LED0_buf=0;
        3'b111: LED0_buf=btnR;
        default: LED0_buf = 0;
        endcase
    end 
    
endmodule
