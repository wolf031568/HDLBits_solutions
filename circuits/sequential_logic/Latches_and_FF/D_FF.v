module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//
    always @(posedge clk) begin
    // Use a clocked always block
    //   copy d to q at every positive edge of clk
        q <= d;
    //   Clocked always blocks should use non-blocking assignments
    end

endmodule