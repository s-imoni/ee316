`timescale 1ns / 1ps

module sevenseg(  
    input clk,  
    input [15:0] sw,  
    input reset,  
    output reg [3:0] an,  
    output reg [6:0] seg
); 

    wire [6:0] seg3, seg2, seg1, seg0;
    
    bcd b0(sw[3:0], seg0);
    bcd b1(sw[7:4], seg1);
    bcd b2(sw[11:8],seg2);
    bcd b3(sw[15:12], seg3);
    
    wire slow_clk; // Create a wire for the slow_clk that will be generated from the clock divider
    wire fortyhz_clk;
    clkdiv c1(clk, slow_clk, fortyhz_clk); // Instantiate the clock divider module
    
    reg [1:0]current_state = 0;
    reg [1:0]next_state = 0;

    
    // Combinational logic portion of FSM - calculate outputs based on inputs
    // Note the empty sensitivity list - all combinational always blocks will have an empty sensitivity list.
    always @(*) begin
        case(current_state) // Using the current state, determine the output and next state
        0: begin // State 0
            an = 4'b1110;
            seg = seg0; 
            if(reset) next_state = 0; 
            else next_state = 1; 
            end 
        1: begin // State 1
            an = 4'b1101; 
            seg = seg1;
            if(reset) next_state = 0; 
            else next_state = 2; 
            end
        2: begin // State 2
            an = 4'b1011;
            seg = seg2;
            if(reset) next_state = 0;
            else next_state = 3; 
            end
        3: begin // State 3
            an = 4'b0111;
            seg = seg3;
            if(reset) next_state = 0; 
            else next_state = 0; 
            end 
        default: begin // Default state, in case not all conditions are covered by the above cases
            an = 4'b1110; 
            next_state = 0;
            end
        endcase
    
    end
    
    // Sequential logic portion of FSM - update registers with new state
    // Note that "posedge slow_clk" is now in the sensitivity list of the always block. This means tha the always block
    // will only run on the rising edge of the divided clock signal - 100Hz.
    always @(posedge fortyhz_clk) begin
        current_state <= next_state;
    end
endmodule