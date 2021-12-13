`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 01:46:37 PM
// Design Name: 
// Module Name: bcd2bin
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


module bcd2bin(
    input [51:0] bcd,
    output [43:0] bin
    );
    assign bin = bcd[51:48] * 44'd1000_000_000_000 +
        bcd[47:44] * 44'd1000_000_000_00 +
        bcd[43:40] * 44'd1000_000_000_0 +
        bcd[39:36] * 44'd1000_000_000 +
        bcd[35:32] * 44'd1000_000_00 +
        bcd[31:28] * 44'd1000_000_0 +
        bcd[27:24] * 44'd1000_000 +
        bcd[23:20] * 44'd1000_00 +
        bcd[19:16] * 44'd1000_0 +
        bcd[15:12] * 44'd1000 +
        bcd[11:8] * 44'd100 +
        bcd[7:4] * 44'd10 +
        bcd[3:0] * 44'd1;
endmodule
