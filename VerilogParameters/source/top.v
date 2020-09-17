module top (input clkin, input reset_n, output clkout1, output clkout2);
`define simulation
`include "params.vh"

clkdiv #(.DIVIDER(DIV1)) U0 (.clk(clkin), .reset_n(reset_n), .clkout(clkout1));
clkdiv #(.DIVIDER(DIV2)) U1 (.clk(clkin), .reset_n(reset_n), .clkout(clkout2));

endmodule