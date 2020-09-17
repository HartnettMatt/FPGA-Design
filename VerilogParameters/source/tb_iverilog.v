`timescale 1 ns / 100 ps
module tb_iverilog();
`include "params.vh"

reg clkin, reset_n;
wire clkout1, clkout2;

top DUT (.clkin(clkin), .reset_n(reset_n), 
         .clkout1(clkout1), .clkout2(clkout2));

initial
  begin
	$dumpfile("tb_iverilog.vcd");
	$dumpvars;
    clkin = 0; reset_n = 0;
  end

always
  #10 clkin = ~clkin;

initial
  begin
    # 40 reset_n = 1;
    # 10000 $finish;
  end

initial
  $monitor($time, "  clkin = %b, reset_n = %b, clkout1 = %b , clkout2 = %b",
                     clkin, reset_n, clkout1, clkout2);

endmodule