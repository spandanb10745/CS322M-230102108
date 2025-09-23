`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: spandan_bharadwaj_230102108
// 
// Create Date: 22.09.2025 07:11:54
// Design Name: 
// Module Name: dmem
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


module dmem(
    input logic clk,we,
    input logic [31:0] a,wd,
    output logic [31:0] rd
    );
    
   logic [31:0] RAM [63:0];
   
   assign rd= RAM[a[31:2]]; // word-aligned
   
   always_ff @(posedge clk)
   if(we) RAM[a[31:2]]<=wd;
   
endmodule
