`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 03:52:54 PM
// Design Name: 
// Module Name: fp_bin2bcd
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


module fp_bin2bcd(
    input fp_bin,
    output fp_bcd
    );
    wire [39:0] fp_bin;
    wire [59:0] bin0;
    wire [39:0] bin1;
    wire [47:0] fp_bcd;
    assign bin0 = fp_bin * 60'd1000000;
    assign bin1 = bin0[19] + bin0[59:20];
    
    reg [51:0] bcd;
    integer i;
    always @(bin1) begin
        bcd = 52'b0;
        for (i = 39; i >= 0; i = i - 1) begin
            if (bcd[51:48] >= 5) bcd[51:48] = bcd[51:48] + 3;
            if (bcd[47:44] >= 5) bcd[47:44] = bcd[47:44] + 3;
            if (bcd[43:40] >= 5) bcd[43:40] = bcd[43:40] + 3;
            if (bcd[39:36] >= 5) bcd[39:36] = bcd[39:36] + 3;
            if (bcd[35:32] >= 5) bcd[35:32] = bcd[35:32] + 3;
            if (bcd[31:28] >= 5) bcd[31:28] = bcd[31:28] + 3;
            if (bcd[27:24] >= 5) bcd[27:24] = bcd[27:24] + 3;
            if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
            if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
        bcd = bcd << 1;
        bcd[0] = bin1[i];
        end
    end
    assign fp_bcd = bcd[47:0];
endmodule
