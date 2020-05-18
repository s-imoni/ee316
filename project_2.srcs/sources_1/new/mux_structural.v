`timescale 1ns / 1ps

module mux_structural(
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
    
    not n0(s0not, s0);
    not n1(s1not, s1);
    and g0(o1, btnU, s0not, s1not, enable);
    and g1(o2, btnD, s0not, s1not, enable);
    and g2(o3, btnL, s0not, s1not, enable);
    and g3(o4, btnR, s0not, s1not, enable);
    or g4(LED0, o1, o2, o3, o4);
    
endmodule
