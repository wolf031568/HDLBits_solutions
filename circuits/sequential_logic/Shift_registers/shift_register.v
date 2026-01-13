module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] Q;
    always@(posedge clk) begin
        if(!resetn) begin
            Q[2:0] <= 3'b0;
            out <= 1'b000;
        end
        else begin
            out <= Q[0];
            Q[0] <= Q[1];
            Q[1] <= Q[2];
            Q[2] <= in;
        end
    end
        
        
endmodule