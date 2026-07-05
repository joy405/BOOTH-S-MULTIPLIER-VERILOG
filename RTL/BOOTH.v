`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 14:56:30
// Design Name: 
// Module Name: BOOTH
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


module BOOTH (addsub,LdA,clrA,LdQ,clrQ,sftA,sftQ,clrff,LdM,clk,multiplicand, multiplier,qm1,q0,eqz,decr,ldcnt);
//define the input signals..
input clk,addsub,LdA,clrA,LdQ,clrQ,sftA,sftQ,clrff,LdM,decr,ldcnt;
input [15:0] multiplicand, multiplier;
//define the outputs signals.....
output qm1,q0,eqz;//eqz is the last bit of the multiplier and qm1 is the previous bit of the multiplier



wire signed [15:0] A,M,Z,Q;
wire [4:0] count;//initialize the counter with 16 means 16 bit number 



//now to check whther the count is 0 or not 
assign eqz=~|count;//means eqz is 1 only when  all the bits are 0 means when it is 00000;
assign q0=Q[0];//output the LSB of Q register

//instantiating the modules with input,output and control signals
shiftreg AR(A,Z,A[15],clk,LdA,clrA,sftA);//first is the outpt ,then input then shift in bit then clk and then control signals
shiftreg QR(Q,multiplier,A[0],clk,LdQ,clrQ,sftQ);//similarly as of AR
dff QM1(Q[0],qm1,clk,clrff);//Q[0] is the input ,qm1 is the output 
PIPO MR(multiplicand,M,LdM,clk);//it is the multiplicand 
ALU AS(Z,A,M,addsub);
counter CN(count,clk,decr,ldcnt);//count is the output of the counter and decr is the control signal to decrement the counter and Ldcnt is the control signal to load the counter with 16

endmodule