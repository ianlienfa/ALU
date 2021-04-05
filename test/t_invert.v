`timescale 1ns/1ns
`include "../lib/ALU_1bit.v"
`include "../lib/Full_adder.v"

module t_invert;
    
    reg a, b, invertA, invertB, carryIn, less;
    reg [1:0] operation;
    wire result, carryOut;

    ALU_1bit m(result, carryOut, a, b, invertA, invertB, operation, carryIn, less);

    initial begin
        $dumpfile("t_invert.vcd");
        $dumpvars(0, t_invert);

        less = 1'b1;
        operation = 2'b11;  // AND test
        invertA = 1'b0;
        invertB = 1'b0;
        carryIn = 1'b0;
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