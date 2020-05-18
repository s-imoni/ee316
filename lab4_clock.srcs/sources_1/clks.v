`timescale 1ns / 1ps

module clks(
    input clk,    
    output [15:0] led
    );
    
    reg [11:0] div2ncount;
    assign led[0] = div2ncount[0];
    assign led[1] = div2ncount[1];
    assign led[2] = div2ncount[2];
    assign led[3] = div2ncount[3];
    assign led[4] = div2ncount[4];
    assign led[5] = div2ncount[5];
    assign led[6] = div2ncount[6];
    assign led[7] = div2ncount[7];
    assign led[8] = div2ncount[8];
    assign led[9] = div2ncount[9];
    assign led[10] = div2ncount[10];
    assign led[11] = div2ncount[11];
//    reg [3:0] count12 = 0;
//    reg [6:0] count13 = 0;
//    reg [9:0] count14 = 0;
//    reg [13:0] count15 = 0;
//    assign led[12] = count12[3];
//    assign led[13] = count13[6];
//    assign led[14] = count14[9];
//    assign led[15] = count15[13]; 
    //Declare and initialize up-counter register      
    //Divide-by-3 clock (33.3MHz on Basys3)
    always @(posedge clk) begin  
        div2ncount = div2ncount + 1; 
        //12
//        if(count12 == 9) count12 = 0;
//        else count12 = count12 + 1;
//        //13
//        if(count13 == 99) count13 = 0;
//        else count13 = count13 + 1;
//        //14
//        if(count14 == 999) count14 = 0;
//        else count14 = count14 + 1;
//        //15
//        if(count15 == 9999) count15 = 0;
//        else count14 = count14 + 1;
        end
    
endmodule
