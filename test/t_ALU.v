`timescale 1ns/1ns
`include "../lib/ALU_1bit.v"
`include "../lib/ALU.v"
`include "../lib/Full_adder.v"
`include "../lib/ALU_bit31.v"

module t_ALU;
    
    reg [0:31] aluSrc1, aluSrc2;
    reg invertA, invertB, carryIn, less;
    reg [1:0] operation;
    wire [0:31] result;
    wire zero;

    ALU m(result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation);

    initial begin
        $dumpfile("t_ALU.vcd");
        $dumpvars(0, t_ALU);

        operation = 2'b10;  // AND test
        invertA = 1'b0;
        invertB = 1'b0;
        aluSrc1 = 32'b0;
        aluSrc2 = 32'b0;
        #20;

        aluSrc1 = 32'b10;
        aluSrc2 = 32'b10;
        #20;

        aluSrc1 = 32'b01;
        aluSrc2 = 32'b10;
        #20;

        
        $display("end of test.");
    end


endmodule