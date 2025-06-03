/*
Create a set of counters suitable for use as a 12-hour clock (with am/pm indicator). Your counters are 
clocked by a fast-running clk, with a pulse on ena whenever your clock should increment (i.e., once per 
second).

reset resets the clock to 12:00 AM. pm is 0 for AM and 1 for PM. hh, mm, and ss are two BCD (Binary-Coded
Decimal) digits each for hours (01-12), minutes (00-59), and seconds (00-59). Reset has higher priority 
than enable, and can occur even when not enabled.

The following timing diagram shows the rollover behaviour from 11:59:59 AM to 12:00:00 PM and the 
synchronous reset and enable behaviour.
*/

module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    wire sec_flag, min_flag;
    counter59 second(clk, reset, ena, ss[7:0], sec_flag); 
    counter59 minute(clk, reset, sec_flag, mm[7:0], min_flag);
    counter12 hour(clk, reset, min_flag, pm, hh[7:0]);
endmodule

module counter59(
    input clk,
    input reset,
    input enable,
    output [7:0] q,
    output flag
);
    reg [3:0] ones;
    reg [3:0] tens;

    assign q = {tens, ones};
    assign flag = enable && (ones == 4'd9) && (tens == 4'd5);  
    always @(posedge clk) begin
        if (reset) begin
            ones <= 4'd0;
            tens <= 4'd0;
        end
        else if (enable) begin
            if (ones == 4'd9) begin
                ones <= 4'd0;
                if (tens == 4'd5)
                    tens <= 4'd0;
                else
                    tens <= tens + 4'd1;
            end
            else begin
                ones <= ones + 4'd1;
            end
        end
    end
endmodule
module counter12(
    input        clk,
    input        reset,
    input        enable,
    output reg   pm,
    output [7:0] q
);
    reg [3:0] ones;
    reg [3:0] tens;
    assign q = {tens, ones};

    always @(posedge clk) begin
        if (reset) begin
            tens <= 4'd1;
            ones <= 4'd2;
            pm   <= 1'b0;
        end
        else if (enable) begin
            if (tens == 4'd1 && ones == 4'd1) begin  
                tens <= 4'd1;
                ones <= 4'd2;
                pm   <= ~pm;
            end
            else if (tens == 4'd1 && ones == 4'd2) begin
                tens <= 4'd0;
                ones <= 4'd1;
            end
            else if (ones == 4'd9) begin 
                ones <= 4'd0;
                tens <= tens + 4'd1;
            end
            else begin
                ones <= ones + 4'd1;
            end
        end
    end
endmodule