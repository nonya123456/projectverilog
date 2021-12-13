`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2021 04:30:49 PM
// Design Name: 
// Module Name: sys2
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


module sys2(
    input clk,
    input rst,
    input rx,
    output tx
    );
    wire baud, received;
    reg [111:0] data_out;
    wire sent, iq_rst, alu_en, out_en;
    wire [119:0] in_q;
    wire [111:0] out_q;
    reg ena, alu_ena;
    reg out_sent;
    wire [47:0] acc_out;
    wire [47:0] in_bcd;
    wire [2:0] op;
    wire overflow;
    
    
    baud_rate_gen baudrate_gen(clk, baud);
    receiver2 receiver(baud, rx, received, in_q);
    transmitter2 transmitter(baud, data_out, ena, tx);
    
    output_queue oq(acc_out, out_q);
    decoder2 dc(in_q, in_bcd, op);
    alu alu(clk, rst, alu_ena, in_bcd, op, acc_out, overflow);
    
    reg last_rec;
    initial begin
        ena = 1;
        data_out = out_q;
    end
    always @(posedge baud)
    begin
        if (ena == 1) ena = 0;
        if (alu_ena == 1) begin
            alu_ena = 0;
            ena = 1;
            data_out = out_q;
        end
        if (~last_rec && received) begin
            if (in_q[7:0] == 8'h0d) begin
                alu_ena = 1;
                //ena = 1;
                //data_out = out_q;
            end
        end
        last_rec = received;
    end
    
    
    /*
    integer count = 0;
    initial begin
        out_sent = 1;
    end
    
    always @(posedge baud)
    begin
        if (ena == 1) ena = 0;
        
        if (~last_rec && received) begin
            data_out = out_q[71:64];
            ena = 1;
        end
        last_rec = received;
    end*/
    /*
    always @(posedge baud)
    begin
        if (ena) ena = 0;
        if (out_sent) out_sent = 0;
        if (~sending && out_en) begin
            out_sent = 0;
            sending = 1;
            count = 0;
        end
        if (sending && count < 4'b1110) begin
            ena = 1;
            count = count + 1;
        end else begin
            out_sent = 1;
            count = 4'b1111;
        end
        case (count)
            4'b0000: data_out = out_q[111:104];
            4'b0001: data_out = out_q[103:96];
            4'b0010: data_out = out_q[95:88];
            4'b0011: data_out = out_q[87:80];
            4'b0100: data_out = out_q[79:72];
            4'b0101: data_out = out_q[71:64];
            4'b0110: data_out = out_q[63:56];
            4'b0111: data_out = out_q[55:48];
            4'b1000: data_out = out_q[47:40];
            4'b1001: data_out = out_q[39:32];
            4'b1010: data_out = out_q[31:24];
            4'b1011: data_out = out_q[23:16];
            4'b1100: data_out = out_q[15:8];
            4'b1101: data_out = out_q[7:0];
            default: data_out = 8'b00000000;
        endcase
    end*/
endmodule
