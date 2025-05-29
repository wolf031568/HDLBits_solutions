module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
    adder3 inst0(a[0], b[0], cin, cout[0], sum[0]);
    adder3 inst1(a[1], b[1], cout[0], cout[1], sum[1]);
    adder3 inst2(a[2], b[2], cout[1], cout[2], sum[2]);
    
 
endmodule

module adder3(
    input a, b, cin,
    output cout, sum );
    assign cout = a&cin | b & cin | a&b;
    assign sum = a ^ b ^ cin;
    
endmodule