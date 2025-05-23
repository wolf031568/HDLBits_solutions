//You are given a module my_dff8 with two inputs and one output (that implements a set of 8 D flip-flops). 
//Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3. 
//In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output depending 
//on sel[1:0]: The value at the input d, after the first, after the second, or after the third D flip-flop.
//(Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)
//
//The module provided to you is: module my_dff8 ( input clk, input [7:0] d, output [7:0] q );

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
    );
    wire [7:0] out1, out2, out3;
        
    my_dff8 inst1(clk, d, out1);
    my_dff8 inst2(clk, out1, out2);
    my_dff8 inst3(clk, out2, out3);
    always @(*) begin
        case(sel)
            2'b00: q = d;
            2'b01: q = out1;
            2'b10: q = out2;
            2'b11: q = out3;
            default q = 8'b00000000;
        endcase
    end
endmodule