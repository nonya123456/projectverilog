`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 02:02:16 PM
// Design Name: 
// Module Name: fp_bcd2bin
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


module fp_bcd2bin(
    input fp_bcd,
    output fp_bin
    );
    wire [47:0] fp_bcd;
    wire [39:0] fp_bin;
    
    wire [75:0] s0 = fp_bcd;
    wire [75:0] s1;
    wire [75:0] s2;
    wire [75:0] s3;
    wire [75:0] s4;
    wire [75:0] s5;
    wire [75:0] s6;
    wire [75:0] s7;
    wire [75:0] s8;
    wire [75:0] s9;
    wire [75:0] s10;
    wire [75:0] s11;
    wire [75:0] s12;
    wire [75:0] s13;
    wire [75:0] s14;
    wire [75:0] s15;
    wire [75:0] s16;
    wire [75:0] s17;
    wire [75:0] s18;
    wire [75:0] s19;
    wire [75:0] s20;
    wire [43:0] bin;
    
    bcd_76adder b76a0(s0, s0, s1);
    bcd_76adder b76a1(s1, s1, s2);
    bcd_76adder b76a2(s2, s2, s3);
    bcd_76adder b76a3(s3, s3, s4);
    bcd_76adder b76a4(s4, s4, s5);
    bcd_76adder b76a5(s5, s5, s6);
    bcd_76adder b76a6(s6, s6, s7);
    bcd_76adder b76a7(s7, s7, s8);
    bcd_76adder b76a8(s8, s8, s9);
    bcd_76adder b76a9(s9, s9, s10);
    bcd_76adder b76a10(s10, s10, s11);
    bcd_76adder b76a11(s11, s11, s12);
    bcd_76adder b76a12(s12, s12, s13);
    bcd_76adder b76a13(s13, s13, s14);
    bcd_76adder b76a14(s14, s14, s15);
    bcd_76adder b76a15(s15, s15, s16);
    bcd_76adder b76a16(s16, s16, s17);
    bcd_76adder b76a17(s17, s17, s18);
    bcd_76adder b76a18(s18, s18, s19);
    bcd_76adder b76a19(s19, s19, s20);
    
    wire [75:0] sss;
    bcd_76adder b7620(s20, 76'h1_000000, sss);
    wire [51:0] bcd;
    assign bcd = (s20[23:20] >= 5)? sss[75:24]: s20[75:24];
    bcd2bin b2b(bcd, bin);
    assign fp_bin = bin[39:0];
endmodule
