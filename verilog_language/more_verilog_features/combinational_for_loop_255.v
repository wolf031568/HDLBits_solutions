module top_module( 
    input [254:0] in,
    output [7:0] out );
integer i;
    always @(*) begin
        out = 8'd0; //default the output so no accidental latches form
        for(i = 0; i < 255; i += 1) begin
            if (in[i] == 1) //if the current input bit is a 1
                out += 1'b1; //add 1 bit each incidence trigger
        end
    end
endmodule