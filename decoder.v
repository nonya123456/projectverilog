`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 07:56:00 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input in_q,
    output in_bcd,
    output op
    );
    wire [119:0] in_q;
    reg [47:0] in_bcd;
    reg [2:0] op;
    
    always @(in_q) begin
            case(in_q[119:112])
                8'b00101011: op=3'b000;
                8'b00101101: op=3'b001;
                8'b00101010: op=3'b010;
                8'b00101111: op=3'b011;
            endcase
            in_bcd[47:44] = in_q[111:104] - 8'b00110000;
            in_bcd[43:40] = in_q[103:96] - 8'b00110000;
            in_bcd[39:36] = in_q[95:88] - 8'b00110000;
            in_bcd[35:32] = in_q[87:80] - 8'b00110000;
            in_bcd[31:28] = in_q[79:72] - 8'b00110000;
            in_bcd[27:24] = in_q[71:64] - 8'b00110000;
            
            in_bcd[23:20] = in_q[55:48] - 8'b00110000;
            in_bcd[19:16] = in_q[47:40] - 8'b00110000;
            in_bcd[15:12] = in_q[39:32] - 8'b00110000;
            in_bcd[11:8] = in_q[31:24] - 8'b00110000;
            in_bcd[7:4] = in_q[23:16] - 8'b00110000;
            in_bcd[3:0] = in_q[15:8] - 8'b00110000;
    end
endmodule
