`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 23:24:09
// Design Name: 
// Module Name: equal_four_bit
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


module equal_four_bit(
    input [3:0] A,B,
    output Y
    );
    
    assign Y=(A==B)?1'b1:1'b0;
    
endmodule
