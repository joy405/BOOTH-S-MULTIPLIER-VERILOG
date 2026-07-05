`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:01:03
// Design Name: 
// Module Name: ALU
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


module ALU(out,in1,in2,addsub);
output reg signed[15:0] out;
input signed[15:0] in1,in2;
input addsub;
always @(*)
begin
  if(addsub==0) out=in1-in2;
  else out=in1+in2;
end
endmodule
