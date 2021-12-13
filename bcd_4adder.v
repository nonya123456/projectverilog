`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 12:53:24 PM
// Design Name: 
// Module Name: bcd_4adder
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


module bcd_4adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output s,
    output cout
    );
    reg [3:0] s;
    reg cout;
    reg [3:0] x;
    reg cx;
    always @(a, b, cin) begin
        {cx, x} = a + b + cin;
        if (x >= 4'b1010 || cx) begin
            cout = 1'b1;
            s = x + 4'b0110;
        end else begin
            cout = 1'b0;
            s = x;
        end
    end
endmodule
