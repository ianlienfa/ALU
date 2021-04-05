
module ALU_bit31( result, carryOut, set, a, b, invertA, invertB, operation, carryIn, less); 
  
  output reg result;
  output wire carryOut;
  output wire set;
  
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

  // for bit 31
  assign set = out2;

  // less
  assign out3 = less;

  // Operation multiplexing
  always @(*) begin
    case(operation)
      2'b00: result = out0;
      2'b01: result = out1;
      2'b10: result = out2;
      2'b11: result = out3;
    endcase
  end

endmodule