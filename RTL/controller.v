`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 14:57:09
// Design Name: 
// Module Name: controller
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


module controller(LdA,clrA,LdQ,clrQ,sftA,sftQ,clrff,LdM,qm1,q0,addsub,clk,done,start,decr,ldcnt,eqz);
input qm1,q0,start,clk,eqz;

output reg LdA,clrA,LdQ,clrQ,sftA,sftQ,clrff,LdM,addsub,decr,ldcnt,done;
reg [2:0] state;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;
always @(posedge clk)
begin
  case(state)
  s0: if(start) state<=s1;
  s1: state<=s2;
  s2: begin
    #2 if({q0,qm1}==2'b01) state<=s3;
    else if({q0,qm1}==2'b10) state<=s4;
    else state<=s5;
  end
  s3: state<=s5;
  s4: state<=s5;
  s5: begin
    #2 if({q0,qm1}==2'b01 && !eqz) state<=s3; //eqz is 1  means count becomes 0 and the process will stop
    else if({q0,qm1}==2'b10 && !eqz) state<=s4;
    else if(eqz) state<=s6;
    
  end
  s6: state<=s6;
  default: state<=s0;
  endcase
end

always @(state)
begin
  case(state)
  s0: begin
    LdA=0; clrA=0; LdQ=0; clrQ=0; sftA=0; sftQ=0; clrff=0; LdM=0; done=0;
  end
  s1: begin
    clrA = 1;; clrff=1; ldcnt=1; LdM=1; //means clear A,clear the FF,load the count with 16 and load the multiplicand
  end
  s2: begin
    LdQ=1; clrA=0; clrff=0; ldcnt=0; LdM=0; //means load the multiplier to the Q register
  end
  s3: begin
    addsub=1; LdQ=0; LdA=1; sftA=0; sftQ=0; decr=0; // when u are s5 state u shift the bits so in this state only sftA=1 and sftQ=1 and decr=1
  end
  s4: begin
    addsub=0; LdQ=0; LdA=1; sftA=0; sftQ=0; decr=0; // when u are s5 state u shift the bits so in this state only sftA=1 and sftQ=1 and decr=1
  end
  s5: begin
    sftA=1; sftQ=1; decr=1; LdA=0; LdQ=0;
  end
  s6: begin
    done=1;
  end
  default: begin
    LdA=0; clrA=0; LdQ=0; clrQ=0; sftA=0; sftQ=0; clrff=0; LdM=0; done=0;
  end
  endcase
end
endmodule
