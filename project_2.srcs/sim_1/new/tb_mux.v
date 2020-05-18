`timescale 1ns / 1ps

module tb_mux;


reg btnU, btnD, btnR, btnL, enable, s0, s1;
wire LED0;

// Instantiate module under test here

mux uut( .btnU(btnU), .btnD(btnD), .btnR(btnR), .btnL(btnL), .enable(enable), .s0(s0), .s1(s1));

initial begin
    btnU = 0; btnD = 0; btnR = 0; btnL = 1; // 10
    s0 = 0; s1 = 1;
    enable = 1;
    #10
    btnU = 0; btnD = 0; btnR = 0; btnL = 1; // 10
    s0 = 1; s1 = 0;
    enable = 1;
    #10
    btnU = 0; btnD = 0; btnR = 1; btnL = 0; // 11
    s0 = 0; s1 = 0;
    enable = 1;
    #10
    btnU = 0; btnD = 0; btnR = 1; btnL = 0; // 11
    s0 = 1; s1 = 1;
    enable = 1;
    #10
    btnU = 0; btnD = 1; btnR = 0; btnL = 0; // 01
    s0 = 0; s1 = 0;
    enable = 1;
    #10
    btnU = 0; btnD = 1; btnR = 0; btnL = 0; // 01
    s0 = 0; s1 = 1;
    enable = 1;
    #10
    btnU = 1; btnD = 0; btnR = 0; btnL = 0; // 00
    s0 = 1; s1 = 1;
    enable = 1;
    #10
    btnU = 1; btnD = 0; btnR = 0; btnL = 0; // 00
    s0 = 0; s1 = 0;
    enable = 1;
    #10
   
end
   
endmodule
