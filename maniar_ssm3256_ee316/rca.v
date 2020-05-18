module rca (
    input clk, load,
    input [14:0] a, b,
    input Cin,
    output [15:0] total,
    output fin
    );
 
 wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;
 wire [15:0] data;
 
 adder b0(a[0], b[0], Cin, data[0], w1);
 adder b1(a[1], b[1], w1, data[1], w2);
 adder b2(a[2], b[2], w2, data[2], w3);
 adder b3(a[3], b[3], w3, data[3], w4);
 adder b4(a[4], b[4], w4, data[4], w5);
 adder b5(a[5], b[5], w5, data[5], w6);
 adder b6(a[6], b[6], w6, data[6], w7);
 adder b7(a[7], b[7], w7, data[7], w8);
 adder b8(a[8], b[8], w8, data[8], w9);
 adder b9(a[9], b[9], w9, data[9], w10);
 adder b10(a[10], b[10], w10, data[10], w11);
 adder b11(a[11], b[11], w11, data[11], w12);
 adder b12(a[12], b[12], w12, data[12], w13);
 adder b13(a[13], b[13], w13, data[13], w14);
 adder b14(a[14], b[14], w14, data[14], data[15]);
    
 loadreg ld(clk, load, data, total, fin);
  
endmodule