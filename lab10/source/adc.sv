/*
This code is dependent on the clock frequency used.
In order to use the Analog Discovery 2, set frequency to 1Mhz.
Based on long CONVST pulse timing
Updated to set ADC channel using SW[2:0], 0 to 7
*/
module adc (CLOCK_50, KEY, SW, LEDR, ADC_SCLK, ADC_DIN, ADC_DOUT, ADC_CONVST, HEX5, HEX4, HEX3, HEX2, GPIO);
input logic         CLOCK_50;
input logic [3:0]   KEY;
input logic [9:0]   SW;
output logic [9:0]  LEDR;
output logic        ADC_SCLK;
output logic        ADC_DIN;
input logic         ADC_DOUT;
output logic        ADC_CONVST;
output logic [6:0]  HEX5, HEX4, HEX3, HEX2;
output logic [15:0] GPIO;

parameter ch0 = 12'b100010_000000;  // channel 0, single ended, unipolar output, no sleep
parameter ch1 = 12'b110010_000000;
parameter ch2 = 12'b100110_000000;
parameter ch3 = 12'b110110_000000;
parameter ch4 = 12'b101010_000000;
parameter ch5 = 12'b111010_000000;
parameter ch6 = 12'b101110_000000;
parameter ch7 = 12'b111110_000000;

logic [11:0] adc_channel, adc_data, display_value;
logic [15:0] bcd_disp;
logic        clk_1mhz, locked, reset_n;

assign reset_n = locked && KEY[0];  // include PLL locked signal as part of system reset
assign LEDR = 10'b0;                // turn LEDs off completely

// 1Mhz Clock generation
pll U0 (.refclk(CLOCK_50), .rst(~KEY[0]), .outclk_0(clk_1mhz), .locked(locked));

// ADC timing control (conversion rate in microseconds is parameter)
adc_control #(30) U1 (.clk(clk_1mhz), .reset_n, .adc_clk(ADC_SCLK), .start_conv(ADC_CONVST));

/* Output conversion channel data to ADC from shift register
   Use the start convert pulse to asynchronously load the channel value
   into the shift register since ADC_SCLK isn't running yet.
   Update data to ADC on falling edge so can be latched on rising edge
   The first bit must be available at the first rising clock edge,so
   moved the assignment to ADC_DIN out of the always block.
*/

always_ff @ (negedge ADC_SCLK or posedge ADC_CONVST)
    if (ADC_CONVST == 1'b1)
        unique case (SW[2:0])
            3'd0:  adc_channel <= ch0;
            3'd1:  adc_channel <= ch1;
            3'd2:  adc_channel <= ch2;
            3'd3:  adc_channel <= ch3;
            3'd4:  adc_channel <= ch4;
            3'd5:  adc_channel <= ch5;
            3'd6:  adc_channel <= ch6;
            3'd7:  adc_channel <= ch7;
        endcase
    else
        adc_channel[11:0] <= {adc_channel[10:0], 1'b0};
assign ADC_DIN = adc_channel[11];

/* Capture conversion data in shift register
   The data is output at the ADC on a falling clock edge, therefore
   best to capture it on a rising clock edge.
*/
always_ff @ (posedge ADC_SCLK)
    adc_data[11:0] <= {adc_data[10:0], ADC_DOUT};

/* Move completed conversion into holding register for display
// Using the leading edge of a new conversion guarantees that
the conversion data has been loaded.
*/
always_ff @ (posedge ADC_CONVST)
    display_value <= adc_data;

// Display value (implied decimal point on HEX5, range 0.000 to 4.095)
bin2bcd U2 (.binary_in(display_value), .bcd_out(bcd_disp));
seg7 U3 (.din(bcd_disp[15:12]), .segs(HEX5));
seg7 U4 (.din(bcd_disp[11: 8]), .segs(HEX4));
seg7 U5 (.din(bcd_disp[ 7: 4]), .segs(HEX3));
seg7 U6 (.din(bcd_disp[ 3: 0]), .segs(HEX2));

// Analog Discover debug signals
assign GPIO[0] = locked;
assign GPIO[1] = clk_1mhz;
assign GPIO[2] = ADC_SCLK;
assign GPIO[3] = ADC_CONVST;
assign GPIO[4] = ADC_DIN;
assign GPIO[5] = ADC_DOUT;
assign GPIO[15:6] = adc_data[11:2];

// Add the In System Sources and Probes Core to replace switches

endmodule
