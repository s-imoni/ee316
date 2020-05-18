`timescale 1ns / 1ps

module mux_behavioral(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input enable,
    input s0,
    input s1,
    output LED0
        );
    
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
