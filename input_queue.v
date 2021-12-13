`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 06:45:09 PM
// Design Name: 
// Module Name: input_queue
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


module input_queue(
    input clk,
    input rst,
    input data_in,
    input received,
    output in_q,
    output last_data
    );
    wire [7:0] data_in;
    reg [119:0] in_q;
    wire received;
    reg last_rec;
    
    assign last_data = in_q[7:0];
    
    always @(posedge clk) begin
        if (rst) begin
            in_q = 0;
        end else
        if (~last_rec & received) begin
            in_q = in_q << 8;
            in_q[7:0] = data_in;
        end
        last_rec = received;
    end
    
endmodule
