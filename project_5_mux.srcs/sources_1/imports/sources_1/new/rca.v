module rca (
    input clk, load,
    input [3:0] a, b,
    input Cin,
    output [7:0] total);
 
 wire w1, w2, w3; 
 adder b0(a[0], b[0], Cin, total[0], w1); 
 adder b1(a[1], b[1], w1, total[1], w2);
 adder b2(a[2], b[2], w2, total[2], w3);
 adder b3(a[3], b[3], w3, total[3], total[4]);
 assign total[7:5] = 3'b000;
  
endmodule