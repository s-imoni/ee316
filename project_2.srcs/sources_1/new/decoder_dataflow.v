`timescale 1ns / 1ps

module decoder_dataflow(
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
    
    assign combo0 = ~up & ~left & ~right & enable;
    assign combo1 = ~up & ~left & right & enable;
    assign combo2 = ~up & left & ~right & enable;
    assign combo3 = ~up & left & right & enable;
    assign combo4 = up & ~left & ~right & enable;
    assign combo5 = up & ~left & right & enable;
    assign combo6 = up & left & ~right & enable;
    assign combo7 = up & left & right & enable;
        
endmodule
