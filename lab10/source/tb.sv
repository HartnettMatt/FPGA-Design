`timescale 1 ns / 100 ps
module tb();

logic         CLOCK_50;
logic [3:0]   KEY;
logic [9:0]   SW;
logic [9:0]   LEDR;
logic         ADC_SCLK;
logic         ADC_DIN;
logic         ADC_DOUT;
logic         ADC_CONVST;
logic [6:0]   HEX5, HEX4, HEX3, HEX2;
logic [15:0]  GPIO;

adc U0(.*);
initial begin
  KEY [3:0] = 0;
  SW [9:0] = 0;
  ADC_DOUT = 0;
end
always
  #10 CLOCK_50 = ~CLOCK_50;
endmodule
