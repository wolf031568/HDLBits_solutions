module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
   
    wire [3:0] cout;
    fulladder inst0(x[0], y[0], 1'b0, sum[0], cout[0]);
    fulladder inst1(x[1], y[1], cout[0], sum[1], cout[1]);
    fulladder inst2(x[2], y[2], cout[1], sum[2], cout[2]);
    fulladder inst3(x[3], y[3], cout[2], sum[3], cout[3]);
    assign sum[4] = cout[3];
    
endmodule

module fulladder(
    input a, b, cin,
    output sum, cout );
    assign cout = (a&b) | (b & cin) | (a&cin);
    assign sum = a ^ b ^ cin;
    
endmodule