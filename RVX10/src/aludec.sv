`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: spandan_bharadwaj_230102108
// 
// Create Date: 22.09.2025 07:34:27
// Design Name: 
// Module Name: maindec
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
module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5, 
              input  logic [1:0] funct7_2b,
              input  logic [1:0] ALUOp,
              output logic [3:0] ALUControl);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction

  always_comb
    case(ALUOp)
      2'b00:                ALUControl = 4'b0000; // addition
      2'b01:                ALUControl = 4'b0001; // subtraction
      2'b10: case(funct3) // R-type or I-type ALU
                 3'b000:  if (RtypeSub) 
                            ALUControl = 4'b0001; // sub
                          else          
                            ALUControl = 4'b0000; // add, addi
                 3'b010:    ALUControl = 4'b0101; // slt, slti
                 3'b110:    ALUControl = 4'b0011; // or, ori
                 3'b111:    ALUControl = 4'b0010; // and, andi
                 default:   ALUControl = 4'bxxxx; // ???
               endcase
       2'b11: case(funct7_2b)  //RVX10 cases
                2'b00:  case (funct3)
                          3'b000: ALUControl = 4'b0110; //andn
                          3'b001: ALUControl = 4'b0111; //orn
                          3'b010: ALUControl = 4'b1000; //xorn
                        default: ALUControl = 4'bxxxx; // ???
                        endcase
                2'b01:  case (funct3)
                          3'b000: ALUControl = 4'b1001; //min
                          3'b001: ALUControl = 4'b1010; //max
                          3'b010: ALUControl = 4'b1011; //minu
                          3'b011: ALUControl = 4'b1100; //maxu
                        default: ALUControl = 4'bxxxx; // ???
                        endcase
                2'b010:  case (funct3)
                          3'b000: ALUControl = 4'b1101; //rol
                          3'b001: ALUControl = 4'b1110; //ror
                        default: ALUControl = 4'bxxxx; // ???
                        endcase
                2'b011:  case (funct3)
                          3'b000: ALUControl = 4'b1111; //abs
                        default: ALUControl = 4'bxxxx; // ???
                        endcase
               default: ALUControl = 4'bxxxx; // ???
             endcase
       default: ALUControl = 4'bxxxx; // ???
    endcase
endmodule
