`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: //spandan_bharadwaj_230102108
// 
// Create Date: 22.09.2025 06:57:37
// Design Name: 
// Module Name: mux3
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


module mux3#(parameter WIDTH=8)(
        input logic [WIDTH-1:0] d0,d1,d2,
        input logic [1:0] s,
        output logic [WIDTH-1:0] y
    );
    
    assign y= s[1] ? d2 : (s[0] ? d1: d0);
endmodule
