/*  adc_control creates the necessary interface signals based on the
    timing model using the long CONVST pulse.  This module was designed based on
    a 1 Mhz clock input, so if the input frequency is changed, code modifications
    will be required.

    A simple counter keeps track of the "state".  The start conversion pulse
    is generated during states 1 and 2, which makes the pulse 2us wide, which
    allows the conversion to complete.

    The width of count controls the ADC sampling rate.  A width of [3:0] forces continuous
    conversion, one conversion every 16us.  This is the minimum conversion rate for this
    approach.

    In order to create the clock properly and without glitches, a synchronous clock gate
    signal is generated using falling clock edges, so that ANDing the clock and the gate
    signal together will not result in glitches.
*/

module adc_control #(parameter CONV_RATE_IN_USEC = 16)
                   (clk, reset_n, adc_clk, start_conv);
input logic clk, reset_n;
output logic adc_clk;
output logic start_conv;

//parameter conv_rate_in_usec = 20;

logic [31:0] count;  // [3:0] is smallest possible size
logic clockgate;

// counter to keep track of states
always_ff @ (posedge clk or negedge reset_n)
    if (reset_n == 1'b0)
        count <= 0;
    else if (count < (CONV_RATE_IN_USEC - 1))
        count <= count + 1'b1;
    else
        count <= 0;

always_ff @ (negedge clk)
    if (reset_n == 1'b0)
        begin : reset
            start_conv = 1'b0;
            clockgate = 1'b0;
        end
    else
        begin : convert
            start_conv <= (count == 1) || (count == 2);
            clockgate <= (count > 2 && count < 15);
        end

assign adc_clk = clockgate ? clk : 1'b0;

endmodule
