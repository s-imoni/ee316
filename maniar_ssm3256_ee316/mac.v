`timescale 1ns / 1ps

module mac(
         input clk, load, reset,
         input [15:0] sw,
         output done, // dp         
         output [15:0] led,         
         output [3:0] an,         
         output [6:0] seg     
         ); 

wire fsmclk;
clkdiv div(clk, fsmclk);

sevenseg segout(clk, decval, reset, an, seg);

wire [7:0] product;    
wire stop; 
mult mul(clk, startin, sw[7:0], stop, product);

reg [2:0] cs, ns;
reg d, nextd;
assign done = d;
reg startin, nextstartin;
reg [14:0] prod, productin;
reg [14:0] addin, nextaddin;
reg [15:0] decval, nextdecval;
reg loadadd, nextloadadd;
reg overflow, nextoverflow;

wire [14:0] addout;
assign led[14:0] = addout;
assign led[15] = overflow;
wire fin;
rca add(clk, loadadd, addin , prod, 0, addout, fin);

initial begin
    d <= 1;
    nextd <= 1;
    cs <= 3;
    ns <= 0;
    nextstartin <= 0;
    startin <= 0;
    prod <= 0;
    productin <= 0;
    addin <= 0;
    nextaddin <= 0;
    loadadd <= 0;
    nextloadadd <= 0;
    overflow <=0;
    nextoverflow <= overflow;
    decval <= 0; 
    nextdecval <= 0;
end

always @(reset, load, cs, stop, fin) begin
    case(cs)
    0: begin // init
        nextstartin <= 1;
        ns <= 5;
        productin <= 0;
        nextaddin <= addin;
        nextoverflow <= overflow;
        nextloadadd <= 0;
        nextd <= 1;
    end
    5: begin 
        nextstartin <= 0;
        if(stop) ns <= 5;
        else ns <= 1;
        productin <= 0;
        nextloadadd <= 0;
        nextoverflow <= overflow;
        nextaddin <= addin;
        nextd <= 1;
    end
    1: begin // wait for product
        nextstartin <= 0;
        if(stop) ns <=2;
        else ns <= 1;  
        productin <= 0;
        nextloadadd <= 0;
        nextoverflow <= overflow;
        nextaddin <= addin;
        nextd <= 1;
    end
    2: begin // set product
        nextstartin <= 0;
        productin <= product;
        ns <= 6;
        nextloadadd <= 0;
        nextoverflow <= overflow;
        nextaddin <= addin;
        nextd <= 1;       
    end
    6: begin // add
        nextstartin <= 0;
        productin <= product;
        nextaddin <= addin;
        nextloadadd <= 1;
        nextoverflow <= overflow;
        if(fin) ns <= 7;
        else ns <= 6;
        nextd <= 1;
    end
    7: begin
        nextstartin <= 0;
        productin <= product;
        nextaddin <= addout;
        nextd <= 0;
        nextloadadd <= 0;
        if(addout > 9999) begin
            nextdecval <= 16'hFFFF;
            nextoverflow <= 1;
        end
        else begin
            nextdecval[3:0] <= (addout % 10);
            nextdecval[7:4] <= ((addout/10) % 10);
            nextdecval[11:8] <= ((addout/100) % 10);
            nextdecval[15:12] <= ((addout/1000) % 10);
            nextoverflow <= 0;
        end  
        if(load & ~reset) ns <= 0;
        else if(reset & ~load) ns <= 3;
        else ns <= 4;
    end
    3: begin // reset
        nextstartin <= 0;
        productin <= product;
        nextaddin <= sw[15:8];
        nextloadadd <= 0;
        nextoverflow <= 0;
        nextd <= 1;
        if(load & ~reset) ns <= 0;
        else if(reset & ~load) ns <= 3;
        else ns <= 4;
       
    end
    4: begin // do nothing
        nextstartin <= 0;
        productin <= product;
        nextaddin <= addin;
        nextloadadd <= 0;
        nextd <= 1;
        nextoverflow <= overflow;
        if(load & ~reset) ns <= 0;
        else if(reset & ~load) ns <= 3;
        else ns <= 4;
    end
    endcase    
end

always @(posedge fsmclk) begin
    d <= nextd;
    cs <= ns;
    startin <= nextstartin;
    prod <= productin;
    addin <= nextaddin;
    loadadd <= nextloadadd;
    overflow <= nextoverflow;
    decval <= nextdecval;
end     
   
  
  
     
endmodule 


