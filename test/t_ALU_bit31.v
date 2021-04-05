`timescale 1ns/1ns
`include "../lib/ALU_bit31.v"
`include "../lib/Full_adder.v"

module t_ALU_bit31;
    
    reg a, b, invertA, invertB, carryIn, less;
    reg [1:0] operation;
    wire result, carryOut;

    ALU_bit31 m( result, carryOut, set, a, b, invertA, invertB, operation, carryIn, less); 

    initial begin
        $dumpfile("t_ALU_bit31.vcd");
        $dumpvars(0, t_ALU_bit31);

        less = 1'b0;
        operation = 2'b11;  // slt test
        invertA = 1'b0;
        invertB = 1'b1;
        carryIn = 1'b1;
        a = 1'b0;
        b = 1'b0;
        #20;

        a = 1'b0;
        b = 1'b1;
        #20;

        a = 1'b1;
        b = 1'b0;
        #20;
        
        a = 1'b1;
        b = 1'b1;
        #20;

        $display("end of test.");
    end


endmodule