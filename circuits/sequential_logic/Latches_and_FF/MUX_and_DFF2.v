//Consider the n-bit shift register circuit shown below:
//Write a Verilog module named top_module for one stage of this circuit, including both the flip-flop 
//and multiplexers

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @(posedge clk)
        Q <= L ? R : (E ? w : Q);

endmodule