`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:02:41
// Design Name: 
// Module Name: BOOTH_test
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


module BOOTH_test;

reg signed [15:0] multiplicand;
reg signed [15:0] multiplier;

reg clk;
reg start;

wire LdA;
wire clrA;

wire LdQ;
wire clrQ;

wire sftA;
wire sftQ;

wire clrff;

wire LdM;

wire addsub;

wire decr;
wire ldcnt;
//status signals
wire qm1;
wire q0;
wire eqz;

wire done;

// INSTANTIATE DATAPATH
BOOTH DP(addsub,
    LdA,
    clrA,
    LdQ,
    clrQ,
    sftA,
    sftQ,
    clrff,
    LdM,
    clk,
    multiplicand,
    multiplier,
    qm1,
    q0,
    eqz,
    decr,
    ldcnt
    

);
// INSTANTIATE CONTROLLER
controller CON(LdA,clrA,LdQ,clrQ,sftA,sftQ,clrff,LdM,qm1,q0,addsub,clk,done,start,decr,ldcnt,eqz);
// CLOCK GENERATION
always #5 clk = ~clk;
// INITIAL BLOCK
initial
begin
    clk = 1'b0;
    start = 0;
    multiplicand = 0;
    multiplier = 0;
    #3 start = 1'b1;
    #220 $finish;
end
initial
begin
    // FIRST INPUT
    // MULTIPLICAND = 17
    #17 multiplicand = -16'sd31;
    // SECOND INPUT
    // MULTIPLIER = 5
    #10 multiplier = 16'sd28;
end
// MONITOR
initial
$monitor(
"TIME=%0t  A=%d   Q=%d   COUNT=%d  q0=%b  qm1=%b     done=%b",
$time,
DP.A,
DP.Q,
DP.count,
q0,
qm1,
done
);
// DUMP FILE
initial
begin
    $dumpfile("booth.vcd");
    $dumpvars(0,BOOTH_test);
end
endmodule
