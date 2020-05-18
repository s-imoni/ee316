`timescale 1ns / 1ps

module adder(
     input a, b, Cin,
     output S, Cout);
     
 assign S = (~a & ~b & Cin) | 
            (~a & b & ~Cin) |
            (a & ~b & ~Cin) |
            (a & b & Cin);
            
 assign Cout = (~a & b & Cin) |
               (a & ~b & Cin) |
               (a & b & ~Cin) |
               (a & b & Cin);
     
endmodule