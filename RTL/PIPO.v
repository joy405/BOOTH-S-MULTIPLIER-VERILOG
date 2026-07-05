`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:00:28
// Design Name: 
// Module Name: PIPO
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


module PIPO(data_in,data_out,ld,clk);
input signed [15:0] data_in;
output reg signed [15:0] data_out;
input ld,clk;
initial
begin
    data_out = 0;
end
always @(posedge clk)
begin
  if(ld) data_out<=data_in;
end

endmodule
