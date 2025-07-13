/*
Write the Verilog code for this sequential circuit (Submodules are ok, but the top-level must be 
named top_module). Assume that you are going to implement the circuit on the DE1-SoC board. Connect 
the R inputs to the SW switches, connect Clock to KEY[0], and L to KEY[1]. Connect the Q outputs to 
the red lights LEDR.
*/


module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    always @(posedge KEY[0]) begin
        LEDR[0] <= KEY[1] ? SW[0] : LEDR[2]; 
        LEDR[1] <= KEY[1] ? SW[1] : LEDR[0];
        LEDR[2] <= KEY[1] ? SW[2] : (LEDR[1] ^ LEDR[2]);
    end
endmodule