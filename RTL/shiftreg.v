`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 14:57:47
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(data_out,data_in,s_in,clk,ld,clr,sft);
input sft,clk,clr,ld,s_in;
input signed [15:0] data_in;
output reg signed [15:0] data_out;
initial
begin
    data_out = 0;
end
always @(posedge clk)
begin
  if(clr) data_out<=0;//when clr is 1 then data_out=0
  else if(ld)//when ld is 1 load the data_in to the data_out
  data_out<=data_in;
  else if(sft)//when sftis 1 then shift the data_out to right and load the s_in to the leftmost bit of data_out
  data_out<={s_in,data_out[15:1]};
end
endmodule
