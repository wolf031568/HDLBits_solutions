module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 
    wire [7:0] Q;
    my_DFF dff0(.clk(clk), .enable(enable), .D(S), .Q(Q[0]));
    my_DFF dff1(.clk(clk), .enable(enable), .D(Q[0]), .Q(Q[1]));
    my_DFF dff2(.clk(clk), .enable(enable), .D(Q[1]), .Q(Q[2]));
    my_DFF dff3(.clk(clk), .enable(enable), .D(Q[2]), .Q(Q[3]));
    my_DFF dff4(.clk(clk), .enable(enable), .D(Q[3]), .Q(Q[4]));
    my_DFF dff5(.clk(clk), .enable(enable), .D(Q[4]), .Q(Q[5]));
    my_DFF dff6(.clk(clk), .enable(enable), .D(Q[5]), .Q(Q[6]));
    my_DFF dff7(.clk(clk), .enable(enable), .D(Q[6]), .Q(Q[7]));
    always@(*) begin
    case({A,B,C}) 
        3'b000: Z = Q[0];
        3'b001: Z = Q[1];
        3'b010: Z = Q[2];
        3'b011: Z = Q[3];
        3'b100: Z = Q[4];
        3'b101: Z = Q[5];
        3'b110: Z = Q[6];
        3'b111: Z = Q[7];
        default: Z = 1'b0;
        endcase
    end
endmodule

module my_DFF (input clk, input enable, input D, output reg Q);
    always@(posedge clk) begin
        if(enable)
            Q <= D;
        else
            Q <= Q;
    end
endmodule