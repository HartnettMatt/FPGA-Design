`timescale 1 ns / 100 ps
module tb();

  reg [9:0] testSW;
  reg [3:0] testKEY;
  reg clock;
  reg [7:0] counter;
  wire [9:0] testLED;
  wire [6:0] testHEX0;
  wire [6:0] testHEX1;
  wire [6:0] testHEX2;
  wire [6:0] testHEX3;
  wire [6:0] testHEX4;
  wire [6:0] testHEX5;

  ECEN3002_Lab1 DUT(.KEY(testKEY), .SW(testSW), .CLOCK_50(clock), .LEDR(testLED),.HEX0(testHEX0),.HEX1(testHEX1),.HEX2(testHEX2),.HEX4(testHEX4),.HEX5(testHEX5));

  initial
    begin
      $display ($time, "<< Starting simulation >>");
      //Initialize inputs:
      testSW = 10'b0000000000;
      testKEY[1:0] = 1;
      clock = 1'b0;
      counter = 0;
      // Create a clock signal that has 256 cycles
      while(counter < 8'b11111111) begin
        #20 clock = ~clock;
        // De-assert the reset signal
        if(counter > 8'b00000010)
          begin
            testKEY[0] = 1;
          end

        counter = counter + 1;
      end
  end

endmodule
