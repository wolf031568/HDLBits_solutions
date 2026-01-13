//Build a 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1.

module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    always@(posedge clk) begin
        if(reset)
            q <= 32'h1;
        else begin
            if(q[0]) begin 
                q <= (q >> 1) ^ 32'h8020_0003; //1000 0000 0010 0000 0000 0000 0011
            end
            else begin
                q <= (q >> 1);
            end
        end
    end
            
                
endmodule