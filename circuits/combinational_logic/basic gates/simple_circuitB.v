//Circuit B can be described by the following simulation waveform:


module top_module ( input x, input y, output z );
//when x is 0 and y is 0, z is 1
//when x is 1 and y is 1, z is 1
//else was, z was 0
//this is showing a xnor truth table
    assign z = ~(x ^ y);
endmodule