//Make a decade counter that counts 1 through 10, inclusive. The reset input is synchronous, 
//and should reset the counter to 1.

module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if(reset | q == 10)
            q <= 4'b0001;
        else
            q <= q + 4'b0001;
    end
endmodule

