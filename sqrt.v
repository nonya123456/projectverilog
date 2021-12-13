`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2021 12:28:49 AM
// Design Name: 
// Module Name: sqrt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sqrt(
    input clk,
    input start,
    output reg busy,
    output reg valid,
    input wire [63:0] rad,
    output reg [63:0] root,
    output reg [63:0] rem
    );
    reg [63:0] x, x_next;    // radicand copy
    reg [63:0] q, q_next;    // intermediate root (quotient)
    reg [65:0] ac, ac_next;  // accumulator (2 bits wider)
    reg [65:0] test_res;     // sign test result (2 bits wider)
    
    parameter ITER = 48;  // iterations are half radicand+fbits width
    reg [5:0] i;            // iteration counter
    
    always @* begin
        test_res = ac - {q, 2'b01};
        if (test_res[65] == 0) begin  // test_res ?0? (check MSB)
            {ac_next, x_next} = {test_res[63:0], x, 2'b0};
            q_next = {q[62:0], 1'b1};
        end else begin
            {ac_next, x_next} = {ac[63:0], x, 2'b0};
            q_next = q << 1;
        end
    end
    always @(posedge clk) begin
        if (start) begin
            busy <= 1;
            valid <= 0;
            i <= 0;
            q <= 0;
            {ac, x} <= {64'b0, rad, 2'b0};
        end else if (busy) begin
            if (i == ITER-1) begin  // we're done
                busy <= 0;
                valid <= 1;
                root <= q_next;
                rem <= ac_next[65:2];  // undo final shift
            end else begin  // next iteration
                i <= i + 1;
                x <= x_next;
                ac <= ac_next;
                q <= q_next;
            end
        end
    end
endmodule
