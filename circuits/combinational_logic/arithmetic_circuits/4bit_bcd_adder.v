module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0] coutw;
    assign cout = coutw[3];
    bcd_fadd inst0(a[3:0], b[3:0], cin, coutw[0], sum[3:0]);
    bcd_fadd inst1(a[7:4], b[7:4], coutw[0], coutw[1], sum[7:4]);
    bcd_fadd inst2(a[11:8], b[11:8], coutw[1], coutw[2], sum[11:8]);
    bcd_fadd inst3(a[15:12], b[15:12], coutw[2], coutw[3], sum[15:12]);
endmodule