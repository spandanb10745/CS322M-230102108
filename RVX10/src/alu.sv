`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: //spandan_bharadwaj_230102108
// 
// Create Date: 22.09.2025 06:59:22
// Design Name: 
// Module Name: alu
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


module alu(
    input  logic [31:0] a, b,
    input  logic [3:0]  alucontrol,
    output logic [31:0] result,
    output logic        zero
);

  // Existing signals
  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when add or subtract

  assign condinvb = alucontrol[0] ? ~b : b;
  assign sum      = a + condinvb + alucontrol[0];
  assign isAddSub = ~alucontrol[2] & ~alucontrol[1] |
                    ~alucontrol[1] & alucontrol[0];

  // signed views for MIN/MAX/ABS
  wire signed [31:0] s1 = a;
  wire signed [31:0] s2 = b;

  always_comb
    case (alucontrol)
      // ---- original arithmetic/logic ----
      4'b0000:  result = sum;                 // add
      4'b0001:  result = sum;                 // subtract
      4'b0010:  result = a & b;               // and
      4'b0011:  result = a | b;               // or
      4'b0100:  result = a ^ b;               // xor
      4'b0101:  result = sum[31] ^ v;         // slt

      // ---- new ops starting from 0110 ----
      4'b0110:  result = a & ~b;                                      // ANDN
      4'b0111:  result = a | ~b;                                      // ORN
      4'b1000:  result = ~(a ^ b);                                    // XNOR
      4'b1001:  result = (s1 < s2) ? a : b;                           // MIN
      4'b1010:  result = (s1 > s2) ? a : b;                           // MAX
      4'b1011:  result = (a  < b)  ? a : b;                           // MINU
      4'b1100:  result = (a  > b)  ? a : b;                           // MAXU
      4'b1101: begin                                                 // ROL
                  logic [4:0] sh = b[4:0];
                  result = (sh == 0) ? a : ((a << sh) | (a >> (32 - sh)));
               end
      4'b1110: begin                                                 // ROR
                  logic [4:0] sh = b[4:0];
                  result = (sh == 0) ? a : ((a >> sh) | (a << (32 - sh)));
               end
      4'b1111:  result = (s1 >= 0) ? a : (0 - a);                     // ABS
      default:  result = 32'bx;
    endcase

  assign zero = (result == 32'b0);
  assign v    = ~(alucontrol[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & isAddSub;

endmodule

