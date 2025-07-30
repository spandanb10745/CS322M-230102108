`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 23:25:19
// Design Name: 
// Module Name: equal_four_bit_tb
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


module equal_four_bit_tb(

    );


reg [3:0]a;
reg [3:0]b;
wire y;

equal_four_bit uut(.A(a),.B(b),.Y(y));

initial begin


     a = 4'b1001; b=4'b1101; #10;
     a= 4'b0100; b= 4'b1010; #10;
     a = 4'b1000; b = 4'b1000; #10;
     a = 4'b1100; b = 4'b1011; #10;
     $finish;
end
endmodule
