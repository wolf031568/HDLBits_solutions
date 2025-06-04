/*
Build a 4-bit shift register (right shift), with asynchronous reset, synchronous load, and enable.

areset: Resets shift register to zero.
load: Loads shift register with data[3:0] instead of shifting.
ena: Shift right (q[3] becomes zero, q[0] is shifted out and disappears).
q: The contents of the shift register.
If both the load and ena inputs are asserted (1), the load input has higher priority.
*/
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    always @(posedge clk or posedge areset) begin
        	if(areset) begin
            	q <= 4'b0; //reset all outputs
            end
        	else begin
                if(load) begin
                    q <= data; //load all data bits into q
                end
                else if(ena) begin
                    q <= {1'b0, q[3:1]}; //shift the bits to the right
                   //load the msb data bit into the lsb of the register
                    end
            end
    end
                    
              
                
endmodule 