`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 01:05:39 PM
// Design Name: 
// Module Name: bcd_76adder
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


module bcd_76adder(
    input a,
    input b,
    output s
    );
    wire [75:0] a;
    wire [75:0] b;
    wire [75:0] s;
    wire [18:0] cin;
    wire cout;
    assign cin[0] = 0;
    
    genvar c;
    generate for(c = 0; c < 18; c = c + 1)
        begin
            bcd_4adder b4a(a[4*c + 3: 4*c], b[4*c + 3: 4*c], cin[c], s[4*c + 3: 4*c], cin[c + 1]);
        end
    endgenerate
    bcd_4adder b4a(a[75:72], b[75:72], cin[18], s[75:72], cout);
endmodule
