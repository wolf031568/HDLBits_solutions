module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    add1 init(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout[0])); //first fulladder to get next cin
	generate //generate all instances of fulladders
        for(i = 1; i < 100; i = i+1) begin: fa
            add1 inst(
                .a(a[i]), .b(b[i]), .cin(cout[i-1]), .sum(sum[i]), .cout(cout[i])
            );
        end
    endgenerate
endmodule     
module add1 ( input a, input b, input cin,   output sum, output cout ); //fulladder module
    assign sum = a ^ b ^ cin;
    assign cout = (a^b)&cin | (a&b);
endmodule