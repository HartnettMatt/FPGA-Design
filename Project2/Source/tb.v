`timescale 1 ns / 100 ps
module tb();

  reg [9:0] testSW;
  reg [3:0] testKEY;
  reg clock;
  wire [9:0] testLED;
  wire [6:0] testHEX0;
  wire [6:0] testHEX1;
  wire [6:0] testHEX2;
  wire [6:0] testHEX3;
  wire [6:0] testHEX4;
  wire [6:0] testHEX5;
  wire testAUD_ADCDAT;
  wire testAUD_ADCLRCK;
  wire testAUD_BCLK;
  wire testAUD_DACDAT;
  wire testAUD_DACLRCK;
  wire testAUD_XCK;
  wire testFPGA_I2C_SCLK;
  wire testFPGA_I2C_SDAT;

  Project2 DUT(
    .KEY(testKEY),
    .SW(testSW),
    .CLOCK_50(clock),
    .CLOCK2_50(clock),
    .CLOCK3_50(clock),
    .CLOCK4_50(clock),
    .LEDR(testLED),
    .HEX0(testHEX0),
    .HEX1(testHEX1),
    .HEX2(testHEX2),
    .HEX3(testHEX3),
    .HEX4(testHEX4),
    .HEX5(testHEX5),
    .AUD_ADCDAT(testAUD_ADCDAT),
    .AUD_ADCLRCK(testAUD_ADCLRCK),
    .AUD_BCLK(testAUD_BCLK),
    .AUD_DACDAT(testAUD_DACDAT),
    .AUD_DACLRCK(testAUD_DACLRCK),
    .AUD_XCK(testAUD_XCK),
    .FPGA_I2C_SCLK(testFPGA_I2C_SCLK),
    .FPGA_I2C_SDAT(testFPGA_I2C_SDAT)
    );

  initial
    begin
      $display ($time, "<< Starting simulation >>");
      //Initialize inputs:
      testSW = 10'b0000000000;
      testKEY[3:0] = 4'b1110;
      clock = 0;
      #100 testKEY[0] = 1;
      #200 testKEY[1] = 0;
      #250 testKEY[1] = 1;
      #100000 $stop;
    end
    always
      #10 clock = ~clock;



endmodule
