`timescale 1 ns / 100 ps
module tb();

reg CLOCK_50;
reg [1:0] KEY;
wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX0;
Final_3002 DUT (.CLOCK_50(CLOCK_50), .KEY(KEY), .HEX5(HEX5), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2), .HEX0(HEX0));


always
  #10 CLOCK_50 = ~CLOCK_50;

initial
  begin
    CLOCK_50 = 1'b1;
    KEY = 2'b00;
    #1000 KEY = 2'b01;
    #1000 KEY = 2'b10;
    #1000 KEY = 2'b11;
    #1000 $stop;
  end
endmodule
