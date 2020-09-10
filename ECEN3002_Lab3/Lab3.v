/*
This design takes 3 8 bit inputs, registers the inputs, adds the 3 values together,
and registers the sum.

synthesis keep directs the synthesis tool to not optimize away the registers
or the wires that connect them.
*/

module Lab3 (clock, A, B, C, sum);
input clock;
input [7:0] A, B, C;
output [9:0] sum;

reg [7:0] reg_A, reg_B, reg_C /* synthesis keep */;
reg [9:0] reg_sum /* synthesis keep */;

always @ (posedge clock)
    begin
        reg_A <= A;
        reg_B <= B;
        reg_C <= C;
        reg_sum <= reg_A + reg_B + reg_C;
    end

assign sum = reg_sum;

endmodule