//Create 16 D flip-flops. It's sometimes useful to only modify parts of a group of flip-flops. 
//The byte-enable inputs control whether each byte of the 16 registers should be written to on that 
//cycle. byteena[1] controls the upper byte d[15:8], while byteena[0] controls the lower byte d[7:0].

//resetn is a synchronous, active-low reset.

//All DFFs should be triggered by the positive edge of clk.

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if(!resetn)
            q <= 16'b0;
        else begin
        if (byteena[1])
            q[15:8] <= d[15:8];
        else 
            q[15:8] <= q[15:8];
        if (byteena[0])
            q[7:0] <= d[7:0];
        else
            q[7:0] <= q[7:0];
    	end
    end
    
endmodule