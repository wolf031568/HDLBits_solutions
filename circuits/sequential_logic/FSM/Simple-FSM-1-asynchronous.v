module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            B: if(in) begin
                out = 1;
                next_state = B;
            end
            else begin //in==0
                out = 1;
                next_state = A; 
            end
            A: if(in) begin
                  out = 0;
                  next_state = A;
               end
               else begin
                  out = 0;
                  next_state = B;
               end
        endcase 
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset == 1) begin // State flip-flops with asynchronous reset
            state <= 1'b1; 
        end
        else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);

endmodule