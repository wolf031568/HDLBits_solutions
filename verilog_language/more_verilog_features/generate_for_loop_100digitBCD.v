/*
You are provided with a BCD one-digit adder named bcd_fadd that adds two BCD digits and carry-in,
and produces a sum and carry-out.

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder. Your adder 
should add two 100-digit BCD numbers (packed into 400-bit vectors) and a carry-in to produce a 100-digit 
sum and carry out.
*/




module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    genvar i;
    wire [100:0] cout1;
    assign cout1[0] = cin;
    assign cout = cout1[100];
generate //generate all instances of fulladders
    for(i = 0; i < 100; i += 1) begin: fadd
        wire [3:0] ai = a[i*4 +: 4];
        wire [3:0] bi = b[i*4 +: 4];
        wire [3:0] sumi;
        wire carryout;
        
        bcd_fadd inst(
            .a(ai), .b(bi), .cin(cout1[i]), .sum(sumi), .cout(carryout)
            );
        assign sum[i*4 +: 4] = sumi;
        assign cout1[1+i] = carryout;
    end                                 
    endgenerate
endmodule