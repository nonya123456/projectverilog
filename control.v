`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2021 01:03:30 PM
// Design Name: 
// Module Name: control
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


module control(
    input clk,
    input [119:0] in_q,
    input sent,
    output iq_rst,
    output alu_en,
    output out_en,
    output ps
    );
    reg iq_rst, alu_en, out_en;
    reg [1:0] ns, ps;
    initial begin
        ps = 0;
    end
    always @(ps) begin
        case (ps)
            2'b00: begin
                ns = 2'b01;
            end
            2'b01: begin
                if (in_q[7:0] == 8'h0d) begin ns = 2'b10; end
                else begin ns = 2'b01; end
            end
            2'b10: ns = 2'b11;
            2'b11: begin
                if (sent) ns = 2'b00;
                else ns = 2'b11;
            end
        endcase
    end
    always @(posedge clk) begin
        ps = ns;
    end
    always @(ps) begin
        case (ps) 
            2'b00: begin iq_rst = 1; alu_en = 0; out_en = 0; end
            2'b01: begin iq_rst = 0; alu_en = 0; out_en = 0; end
            2'b10: begin iq_rst = 0; alu_en = 1; out_en = 0; end
            2'b11: begin iq_rst = 0; alu_en = 0; out_en = 1; end
        endcase
    end
endmodule
