module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
  output wire[31:0] result;
  output wire zero;
  output reg overflow = 0;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  wire set;
  
  /*your code here*/
  wire inandout[31:0];
  wire les = 0;  
  wire cout31;  // dummy

  // the 31th bit
  ALU_bit31 b31(result[31], cout31, set, aluSrc1[31], aluSrc2[31], invertA, invertB, operation, inandout[30], les);

  genvar i;
  generate
    for (i=0; i <= 30; i=i+1)
    begin: module_gen
      if(i == 0)
      begin
        ALU_1bit b(result[i], inandout[i], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, invertB, set);
      end
      else
      begin
        ALU_1bit b(result[i], inandout[i], aluSrc1[i], aluSrc2[i], invertA, invertB, operation, inandout[i-1], les);
      end
    end  
  endgenerate

  always @(*)
    begin
      if((operation == 2'b10 || operation == 2'b11) && aluSrc1[31] == aluSrc2[31] && result[31] != aluSrc2[31])
        assign overflow = 1'b1;
      else
        assign overflow = 1'b0;
    end
  
  assign zero = (|result) ? 1'b0 : 1'b1;
	  
endmodule