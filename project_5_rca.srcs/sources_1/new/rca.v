module rca (
    input clk, load,
    input [3:0] a, b,
    input Cin,
    output [4:0] total);
 
 wire w1, w2, w3;
 wire [4:0] data;
 
 adder b0(a[0], b[0], Cin, data[0], w1);
 adder b1(a[1], b[1], w1, data[1], w2);
 adder b2(a[2], b[2], w2, data[2], w3);
 adder b3(a[3], b[3], w3, data[3], data[4]);
    
 loadreg ld(clk, load, data, total);
  
endmodule