module top_module( 
    input a, b, cin,
    output cout, sum );
assign cout = a&cin | b & cin | a&b;
assign sum = a ^ b ^ cin;
endmodule