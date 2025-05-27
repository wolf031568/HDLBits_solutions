/*
Row	    Inputs	    Outputs
number	x3	x2	x1	f
0	    0	0	0	0
1	    0	0	1	0
2	    0	1	0	1
3	    0	1	1	1
4	    1	0	0	0
5	    1	0	1	1
6	    1	1	0	0
7	    1	1	1	1

derived boolean expression: (x2 * ~x3) + (x3*x1)  ~(kmap)

*/



module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f = (x2 & ~x3) | (x3 & x1);
endmodule