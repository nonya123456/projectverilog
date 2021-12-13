`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 07:24:12 PM
// Design Name: 
// Module Name: num2ASCII
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


module num2ASCII(
    input bcd,
    output ascii
    );
    wire [3:0] bcd;
    wire [7:0] ascii;
    assign ascii = bcd + 8'b00110000;
endmodule
