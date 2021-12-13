`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 02:30:39 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input clk,
    input rst,
    input en,
    input [47:0] in_bcd,
    input [2:0] op,
    output [47:0] acc_out,
    output overflow
    );
    // 000 +
    // 001 -
    // 010 *
    // 011 /
    // 100 s
    // 101 c
    reg [79:0] acc; // binary
    wire [39:0] in;
    fp_bcd2bin fb2b(in_bcd, in);
    reg overflow, sqrt_en;
    
    fp_bin2bcd fpb2b(acc[39:0], acc_out);
    
    initial begin
        acc = 0;
    end
    reg last_en;
    always @(posedge clk) begin
        if (rst) begin acc = 0; end
        else if (~last_en & en) begin
            case(op)
                3'b000: begin acc = acc + in; end
                3'b001: begin acc = acc - in; end
                3'b010: begin acc = (acc * in) >> 20; end
                3'b011: begin acc = (acc << 20) / in; end
                3'b100: begin acc = 0; end // TODO
                3'b101: begin acc = 0; end
            endcase
        end
        last_en = en;
    end
    always @(acc) begin
        if (acc > (1 << 40)) begin overflow = 1; end
        else begin overflow = 0; end
    end
    
endmodule
