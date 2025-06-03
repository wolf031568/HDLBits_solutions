Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 
4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. For digits [3:1], also output an 
enable signal indicating when each of the upper three digits should be incremented.

You may want to instantiate or modify some one-digit decade counters.

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    decade_counter ones(clk, reset, 1'b1, q[3:0]);
    decade_counter tens(clk, reset, ena[1], q[7:4]);
    decade_counter hundreds(clk, reset, ena[2], q[11:8]);
    decade_counter thousands(clk, reset, ena[3], q[15:12]);
    assign ena[1] = (q[3:0] == 4'd9) ? 1'b1 : 1'b0;
    assign ena[2] = ((q[7:4] == 4'd9) && ena[1]) ? 1'b1 : 1'b0;
    assign ena[3] = ((q[11:8] == 4'd9) && ena[2]) ? 1'b1 : 1'b0;
    
endmodule

module decade_counter (
    input clk,
    input reset,
    input enable,
    output [3:0] q
);
     always @(posedge clk) begin
         if(reset | (q==9 && enable))
            q<=4'b0000;
         else if(enable)
        	q <= q + 4'b0001;
    end
endmodule