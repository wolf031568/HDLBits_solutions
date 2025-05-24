//Build an AND gate using both an assign statement and a combinational always block.
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    always@(*) out_alwaysblock = a & b;
    assign out_assign = a & b;
    
endmodule   