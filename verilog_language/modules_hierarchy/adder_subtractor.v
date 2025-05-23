//You are provided with a 16-bit adder module, which you need to instantiate twice:

//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

//Use a 32-bit wide XOR gate to invert the b input whenever sub is 1. (This can also be viewed 
//as b[31:0] XORed with sub replicated 32 times. See replication operator.). Also connect the sub 
//input to the carry-in of the adder.



module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] bout;
    wire cout1, cout2;
    assign bout[31:0] = {32{sub}} ^ b[31:0];
    add16 topadder(a[15:0], bout[15:0], sub, sum[15:0], cout1);
    add16 bottomadder(a[31:16], bout[31:16], cout1, sum[31:16], cout2);

endmodule