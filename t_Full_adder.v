`timescale 1ns/1ns
`include "Full_adder.v"

module t_Full_adder;

// initiate wires for input
reg in1, in2, cin;
wire cout, sum;

// create full adder module instance
Full_adder adder(sum, cout, cin, in1, in2);

// initialize input signal
initial begin
    $dumpfile("t_Full_adder.vcd");
    $dumpvars(0, t_Full_adder);

    cin = 1'b0;
    in1 = 1'b0;
    in2 = 1'b0;
    #20;
    in1 = 1'b1;
    in2 = 1'b0;
    #20;
    in1 = 1'b0;
    in2 = 1'b1;
    #20;
    in1 = 1'b1;
    in2 = 1'b1;
    #20;

    $display("end of test.");
end

endmodule