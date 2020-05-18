`timescale 1ns / 1ps

module mult(     
     input clk,   // Use input clock - no need for clock divider
     input start, // Center button     
     input [7:0] sw,  // Multiplicands - sw[7:4], sw[3:0]     
     output stop,     // Stop signal - LED[15]     
     output reg [7:0] product     // Product - LED[7:0]     
     );
     
     reg stopreg;  
     reg [2:0] cs, ns; // cs = current state, ns = next state
     reg [8:0] nextproduct, productreg;
     reg nextstop;
     reg [2:0] count, nextcount;
     reg loadcmd, nextloadcmd;
     reg addcmd, nextaddcmd;
     reg shiftcmd, nextshiftcmd;
     initial begin
        product <= 0;
        productreg <= 0;
        nextproduct <= 0;
        nextloadcmd <= 0;
        loadcmd <= 0;
        nextaddcmd <= 0;
        addcmd <= 0;
        nextstop <= 0;
        shiftcmd <= 0;
        nextshiftcmd <= 0;
        stopreg <= 0;
        count <= 0;
        nextcount <= 0;
        cs <= 0;
        ns <= 0;
    end
    
    
     
   always @(sw, productreg, cs, start, loadcmd, addcmd, shiftcmd, stopreg, count) begin
         case(cs)
            0: begin // idle
                nextstop <= 1;
                nextloadcmd <= 0;
                nextaddcmd <= 0;
                nextshiftcmd <= 0;
                nextproduct <= product;
                nextcount <= 0;
                if(start) ns <= 1; // init
                else ns <= 0;
            end
            1: begin // init
                nextstop <= 0;
                nextloadcmd <= 1;
                nextaddcmd <= 0;
                nextshiftcmd <= 0;
                nextcount <= count;
                nextproduct <= sw[3:0];
                ns <= 2; // test
            end
            2: begin // test
                nextstop <= 0;
                nextloadcmd <= 0;
                nextaddcmd <= 0;
                nextshiftcmd <= 0;
                nextcount <= count;
                nextproduct <= productreg; 
                if(productreg[0]) ns <= 3;
                else ns <= 4;
            end
            3: begin // add
                nextstop <= 0;
                nextloadcmd <= 0;
                nextaddcmd <= 1;
                nextproduct <= (productreg + (sw[7:4]<<4));
                nextcount <= count;
                nextshiftcmd <= 0;
                ns <= 4;
            end
            4: begin // shift
                if(count < 3) ns <= 2;
                else ns <= 0;
                nextstop <= 0;
                nextloadcmd <= 0;
                nextaddcmd <= 0;
                nextcount <= count + 1;
                nextshiftcmd <= 1;
                nextproduct <= productreg>>1;
            end
         endcase
     end
     
     always @(posedge clk) begin
        cs <= ns;
        productreg <= nextproduct;
        product <= nextproduct[7:0];
        stopreg <= nextstop;
        loadcmd <= nextloadcmd;
        addcmd <= nextaddcmd;
        shiftcmd <= nextshiftcmd;
        count <= nextcount;
     end
     
     assign stop = stopreg; 
      
endmodule