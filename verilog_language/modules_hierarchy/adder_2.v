//Like module_add, you are given a module add16 that performs a 16-bit addition. You must instantiate 
//two of them to create a 32-bit adder. One add16 module computes the lower 16 bits of the addition 
//result, while the second add16 module computes the upper 16 bits of the result. Your 32-bit adder does 
//not need to handle carry-in (assume 0) or carry-out (ignored).

//Connect the add16 modules together as shown in the diagram below. The provided module add16 has the 
//following declaration:

//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

//Within each add16, 16 full adders (module add1, not provided) are instantiated to actually perform 
//the addition. You must write the full adder module that has the following declaration:

//module add1 ( input a, input b, input cin, output sum, output cout );

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] c;
    wire cout1, cout2;
    add16 topadder(a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 lowadder(a[31:16], b[31:16], cout1, sum[31:16], cout2);
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = a ^ b ^ cin;
    assign cout = (a^b)&cin | (a&b);
endmodule