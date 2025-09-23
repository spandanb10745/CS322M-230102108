`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: //spandan_bharadwaj_230102108
// 
// Create Date: 22.09.2025 07:20:29
// Design Name: 
// Module Name: imem
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


module imem(
    input logic [31:0] a,
    output logic [31:0] rd
    );
    logic [31:0] RAM [63:0];
    
    initial 
     $readmemh("risctest.mem",RAM);
     
    assign rd= RAM[a[31:2]];// word-aligned
    
endmodule
