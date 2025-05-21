module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire and_a, and_b;
	assign and_a = a & b; //AND 1
    assign and_b = c & d; //AND 2
    assign out = and_a | and_b; //OR the AND outputs, assign to module output
    assign out_n = !out; //inverted output
endmodule