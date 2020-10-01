`timescale 1 ns / 100 ps
module tb();

  reg [9:0] testSW;
  reg [3:0] testKEY;
  reg clock;
  wire testVGA_BLANK_N;
	wire testVGA_CLK;
	wire testVGA_HS;
	wire testVGA_SYNC_N;
	wire testVGA_VS;
  wire [7:0]		testVGA_R;
  wire [7:0]		testVGA_G;
  wire [7:0]		testVGA_B;


  PinTest DUT(
    .KEY(testKEY),
    .SW(testSW),
    .CLOCK_50(clock),
    .VGA_BLANK_N(testVGA_BLANK_N),
  	.VGA_B(testVGA_B),
  	.VGA_CLK(testVGA_CLK),
  	.VGA_G(testVGA_G),
  	.VGA_HS(testVGA_HS),
  	.VGA_R(testVGA_R),
  	.VGA_SYNC_N(testVGA_SYNC_N),
  	.VGA_VS(testVGA_VS)
    );

  initial
    begin
      $display ($time, "<< Starting simulation >>");
      //Initialize inputs:
      testSW = 10'b0000000000;
      testKEY[3:0] = 4'b1110;
      clock = 0;
      #600 testKEY[0] = 1;
      #1000 testKEY[0] = 0;
      #2000 testKEY[0] = 1;
      #50000000 $stop;
    end
    always
      #10 clock = ~clock;



endmodule
