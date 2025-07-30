`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 23:02:43
// Design Name: 
// Module Name: mycomparator
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


module mycomparator (
    input A,
    input B,
    output [2:0] Y
);

assign Y[2]=(A>B)?1'b1:1'b0;
assign Y[1]=(A<B)?1'b1:1'b0;
assign Y[0]=(A==B)?1'b1:1'b0;
    
endmodule
