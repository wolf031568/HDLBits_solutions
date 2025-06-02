//Given the finite state machine circuit as shown, assume that the D flip-flops are initially 
//reset to zero before the machine begins.

//Build this circuit

module top_module (
    input clk,
    input x,
    output z
); 
    reg q1, q2, q3;
    initial begin
        q1 = 1'b0;
        q2 = 1'b0;
        q3 = 1'b0;
    end
    always @(posedge clk) begin
        q1 <= x ^ q1;
        q2 <= x & ~q2;
        q3 <= x | ~q3;
    end
    assign z = ~(q1 | q2 | q3);

endmodule