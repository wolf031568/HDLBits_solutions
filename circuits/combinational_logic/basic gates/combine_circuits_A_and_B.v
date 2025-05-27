//See mt2015_q4a and mt2015_q4b for the submodules used here. The top-level design consists of 
//two instantiations each of subcircuits A and B, as shown below.

module top_module (input x, input y, output z);
    wire z1, z2, z3, z4;
    q4a inst1(x, y, z1);
    q4b inst2(x, y, z2);
    q4a inst3(x, y, z3);
    q4b inst4(x, y, z4);
    assign z = (z1 | z2) ^ (z3 & z4);
endmodule

module q4a (input x, input y, output z);
    assign z = (x^y) & x;
endmodule
module q4b ( input x, input y, output z );
//when x is 0 and y is 0, z is 1
//when x is 1 and y is 1, z is 1
//this is showing a xnor truth table
    assign z = ~(x ^ y);
endmodule