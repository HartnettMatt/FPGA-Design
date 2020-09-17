`timescale 1 ns / 100 ps
module tb_modelsim();
`include "../source/params.vh"

reg clkin, reset_n;
wire clkout1, clkout2;

top DUT (.clkin(clkin), .reset_n(reset_n), 
         .clkout1(clkout1), .clkout2(clkout2));

always
    #10 clkin = ~clkin;

initial
    begin
        clkin = 0; reset_n = 0;
    #40 reset_n = 1;
    end
initial
  $monitor($time, "  clkin = %b, reset_n = %b ,clkout1 = %b , clkout2 = %b", 
                     clkin, reset_n, clkout1, clkout2);

endmodule
