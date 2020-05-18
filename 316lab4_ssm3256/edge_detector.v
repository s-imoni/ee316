`timescale 1ns / 1ps


module edge_detector(
    input clk,
    input SW0,
    output reg LED0
    );
    
    wire fourtyhz;
    clkdiv c1(clk, slow_clk, fourtyhz);
     reg [1:0]current_state = 0;
     reg [1:0]next_state = 0;
    
    always @(*) begin
        case(current_state) // Using the current state, determine the output and next state
        0: begin // State 0
            LED0 <= 0; // Set output - in this case, turn LED off
            if(SW0) next_state <= 1; // If the ON button is pushed, set next state to state 1 where LED is on
            else next_state <= 0; // Else, stay in state 0
            end 
        1: begin // State 1
            LED0 <= 1; // Set output - in this case, turn LED on
            if (SW0) next_state <= 2;
            else next_state <= 0;
            end 
        2: begin // State 2
            LED0 <= 0;
            if (SW0) next_state <= 2; 
            else next_state <= 0;
            end
        default: begin // Default state, in case not all conditions are covered by the above cases
            LED0 = 0;
            next_state = 0;
            end
        endcase
    
    end
    always @(posedge slow_clk) begin
        current_state <= next_state;
    end
endmodule
