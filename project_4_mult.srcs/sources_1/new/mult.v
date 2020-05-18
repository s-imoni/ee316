`timescale 1ns / 1ps

module mult(
   input [3:0] sw,
   output [3:0] an,
   output [6:0] seg,
   output dp
    );

wire [3:0]s;

assign s[3] = sw[3] & sw[2] & sw[1] & sw[0];

assign s[2] = (sw[3] & sw[2] & sw[1] & ~sw[0]) 
            | (sw[3] & ~sw[2] & sw[1] & sw[0])
            | (sw[3] & ~sw[2] & sw[1] & ~sw[0]);

assign s[1] = (~sw[3] & sw[2] & sw[1] & ~sw[0]) |
              (~sw[3] & sw[2] & sw[1] & sw[0]) |
              (sw[3] & ~sw[2] & ~sw[1] & sw[0]) |
              (sw[3] & ~sw[2] & sw[1] & sw[0]) |
              (sw[3] & sw[2] & ~sw[1] & sw[0]) |
              (sw[3] & sw[2] & sw[1] & ~sw[0]);

assign s[0] = (~sw[3] & sw[2] & ~sw[1] & sw[0])
            | (~sw[3] & sw[2] & sw[1] & sw[0])
            | (sw[3] & sw[2] & ~sw[1] & sw[0]) 
            | (sw[3] & sw[2] & sw[1] & sw[0]);
            
bcd uut( .sw(s), .an(an), .seg(seg), .dp(dp));

endmodule
