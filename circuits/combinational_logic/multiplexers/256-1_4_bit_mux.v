module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out = in[sel*4 +: 4]; //+: operator will grab every 4 bits left-wise. sel*4 indexes each 4 bits
endmodule