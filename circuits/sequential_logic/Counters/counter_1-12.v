/*
Design a 1-12 counter with the following inputs and outputs:

- Reset Synchronous active-high reset that forces the counter to 1
- Enable Set high for the counter to run
- Clk Positive edge-triggered clock input
- Q[3:0] The output of the counter
- c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation 
can be verified.

You have the following components available:
 - the 4-bit binary counter (count4) below, which has Enable and synchronous parallel-load inputs 
(load has higher priority than enable). The count4 module is provided to you. Instantiate it in your 
circuit.
 - logic gates

The c_enable, c_load, and c_d outputs are the signals that go to the internal counter's enable, load, 
and d inputs, respectively. Their purpose is to allow these signals to be checked for correctness.


*/

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output reg c_enable,
    output reg c_load,
    output reg [3:0] c_d
); //
    count4 the_counter (clk, c_enable, c_load, c_d[3:0], Q[3:0]);

    always @(*) begin
        c_load = 0;
        c_enable = 0;
        if(reset || (Q == 12 && enable) || (c_d == 0)) begin
            c_load = 1;
            c_d = 4'b0001;
        end
        else if(enable)
            c_enable = 1;
    end

endmodule
