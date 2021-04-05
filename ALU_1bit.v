`include "Full_adder.v"

module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;

  // helper
  wire mula;
  wire mulb;
  wire out0, out1, out2, out3;
  
  // your code here
  assign mula = (invertA) ? ~a : a;
  assign mulb = (invertB) ? ~b : b;
  assign out0 = mula & mulb;
  assign out1 = mula | mulb;

  // adder 
  Full_adder add(out2, carryOut, carryIn, mula, mulb);

  // less
  assign out3 = less;

  // Operation multiplexing
  // always @()


  assign result = out2;
  assign carryOut = 0;

endmodule