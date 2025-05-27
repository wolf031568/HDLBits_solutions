module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    assign out_both = in[98:0] & in[99:1]; //compares with the bit to its left
    assign out_any = in[99:1] | in[98:0]; //compares with the bit to its right
    assign out_different = in ^ {in, in[99:1]}; 
endmodule