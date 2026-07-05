`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:01:45
// Design Name: 
// Module Name: counter
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


module counter(data_out,clk,decr,ldcnt);
output reg [4:0] data_out;
input clk,decr,ldcnt;
initial
begin
    data_out = 5'b10000;//initialize the counter with 16
end
always @(posedge clk)
begin
  if(ldcnt) data_out<=5'b10000;//means load with 16 and decremneted it 1 by 1 and chekc whether  the result is 0 or not when it is 0 then eqz will be 1 and the process will stop/
  else if(decr) data_out<=data_out-1;
end
endmodule
