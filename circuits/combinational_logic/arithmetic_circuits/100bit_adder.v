module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [99:0] coutw;
    genvar i; 
    fulladder inst0(a[0], b[0], cin, sum[0], coutw[0]);
    generate
        for(i = 1; i < 100; i += 1) begin : fadd
            fulladder inst(
                a[i], b[i], coutw[i-1], sum[i], coutw[i]);
        end
    endgenerate
    assign cout = coutw[99];
endmodule
module fulladder(
    input a, b, cin,
    output sum, cout );
    assign cout = (a&b) | (b & cin) | (a&cin);
    assign sum = a ^ b ^ cin;
    
endmodule