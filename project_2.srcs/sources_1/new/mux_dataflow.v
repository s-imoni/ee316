`timescale 1ns / 1ps

module mux_dataflow(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input enable,
    input s0,
    input s1,
    output LED0
    );
  
    assign LED0 = (btnU & ~s0 & ~s1 & enable) |
               (btnD & ~s0 & s1 & enable) | 
               (btnL & s0 & ~s1 & enable) | 
               (btnR & s0 & s1 & enable);    
endmodule
