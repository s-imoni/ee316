`timescale 1ns / 1ps

module clkdiv(
    input clk,
    output slow_clk,
    output fourtyhz_clk
    );
    
    reg [31:0] count = 0; // Initialize clock cycle counter to 0
    reg [31:0] count2 = 2;
    reg clk_out = 0; // Buffer for output clock
    reg clk2 = 2;
    assign slow_clk = clk_out;
    assign fourtyhz_clk = clk_out | clk2; // Tie buffer to output
    
    // Note that the sensitivity list now contains "posedge clk"
    // This means that the always block will only run when the clk has a rising edge (transitions from 0 to 1)
    always @(posedge clk) begin
        // Increment cycle counter
        count <= count + 1;
        clk_out <= 0;
        // Check if target number of cycles has elapsed for 20MHz slow clock - in this case, 500,000 cycles
        if(count == 4) begin
            clk_out <= 1; // Toggle the output bit that represents the clock
            count <= 0; // Reset the cycle counter to zero
        end
    end
    always @(negedge clk) begin
        // Increment cycle counter
        count2 <= count2 + 1;
        clk2 <= 0;
        // Check if target number of cycles has elapsed for 20MHz slow clock - in this case, 500,000 cycles
        if(count2 == 4) begin
            clk2 <= 1; // Toggle the output bit that represents the clock
            count2 <= 0; // Reset the cycle counter to zero
        end
    end 
endmodule