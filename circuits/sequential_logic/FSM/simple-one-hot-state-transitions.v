module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //
	parameter A = 0, B = 1, C = 2, D = 3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = ((state[A]) && (in == 0)) || ((state[C]) && (in == 0));
    assign next_state[B] = ((state[A]) || (state[B]) || (state[D])) && (in == 1);
    assign next_state[C] = ((state[B]) || (state[D])) && (in == 0);
    assign next_state[D] = (state[C]) && (in == 1);

    // Output logic: 
    assign out = (state[D]) ;

endmodule
