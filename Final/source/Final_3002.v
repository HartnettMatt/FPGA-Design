
module Final_3002(
input 		          		CLOCK_50,
input 		     [1:0]		KEY,
output		     [9:0]		LEDR,
output 		     [6:0]		HEX0, HEX2, HEX3, HEX4, HEX5);

`include "params.vh"
wire pll_reset, counter_reset_n;

// **************************************************
// Here are the various macros to define for the exam 
//`define issp
//`define pll2
// **************************************************

`ifdef issp
	wire [1:0] remote_key;
	issp U0 (.source(remote_key));
	assign pll_reset =        ((KEY[0] == 1'b0) | (remote_key[0] == 1'b0));
	assign counter_reset_n = !((KEY[1] == 1'b0) | (remote_key[1] == 1'b0));
`else
	assign pll_reset =       (KEY[0] == 1'b0);
	assign counter_reset_n = !(KEY[1] == 1'b0);
`endif

// PLL U1 was created using IP Catalog.
// Output of PLL drives a counter that displays to the LEDs on the DE10-Standard board.
// HEX0 is used to show PLL lock status (L = lock, U = unlock).
wire pll_locked;
wire clock_pll;

pll U1 (.refclk (CLOCK_50), .rst (pll_reset), .outclk_0 (clock_pll), .locked (pll_locked));
assign HEX0 = pll_locked ? PLL_Locked : PLL_Unlocked;
counter U2 (.clk (clock_pll), .reset_n (counter_reset_n), .q (LEDR[9:0]));


// Reconfigurable PLL U3 was created using Platform Designer
// This PLL is controlled using the JTAG Master IP.
// HEX5 is used to show lock status (L = lock, U = unlock).
// The counter output is decoded and displayed on HEX4, HEX3, and HEX2 displays.

`ifdef pll2
wire jtag_pll_locked;
wire clock_jtag_pll;
wire [9:0] jtag_pll_count;

jtag_pll U3 (
		.reset_reset_n       (!pll_reset),       
		.clk_clk             (CLOCK_50),            
		.pll_0_locked_export (jtag_pll_locked), 
		.pll_0_outclk0_clk   (clock_jtag_pll));

assign HEX5 = jtag_pll_locked ? PLL_Locked : PLL_Unlocked;
counter U4 (.clk (clock_jtag_pll), .reset_n (counter_reset_n), .q(jtag_pll_count));
display U5 (.count_in(jtag_pll_count), .HEX4(HEX4), .HEX3(HEX3), .HEX2(HEX2));
`endif

endmodule
