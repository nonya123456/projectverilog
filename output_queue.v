`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 07:12:31 PM
// Design Name: 
// Module Name: output_queue
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


module output_queue(
    input data_out,
    output out_q
    );
    wire [47:0] data_out;
    wire [111:0] out_q;
    
    num2ASCII n2a0(data_out[47:44], out_q[111:104]);
    num2ASCII n2a1(data_out[43:40], out_q[103:96]);
    num2ASCII n2a2(data_out[39:36], out_q[95:88]);
    num2ASCII n2a3(data_out[35:32], out_q[87:80]);
    num2ASCII n2a4(data_out[31:28], out_q[79:72]);
    num2ASCII n2a5(data_out[27:24], out_q[71:64]);
    
    assign out_q[63:56] = 8'b00101110;
    
    num2ASCII n2a6(data_out[23:20], out_q[55:48]);
    num2ASCII n2a7(data_out[19:16], out_q[47:40]);
    num2ASCII n2a8(data_out[15:12], out_q[39:32]);
    num2ASCII n2a9(data_out[11:8], out_q[31:24]);
    num2ASCII n2a10(data_out[7:4], out_q[23:16]);
    num2ASCII n2a11(data_out[3:0], out_q[15:8]);
    
    assign out_q[7:0] = 8'b00111110;
endmodule
