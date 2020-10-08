
module PD_PIO (
	clk_clk,
	pio_0_external_connection_in_port,
	pio_0_external_connection_out_port,
	pio_1_external_connection_export,
	reset_reset_n,
	pio_2_external_connection_export);	

	input		clk_clk;
	input	[7:0]	pio_0_external_connection_in_port;
	output	[7:0]	pio_0_external_connection_out_port;
	output		pio_1_external_connection_export;
	input		reset_reset_n;
	input	[9:0]	pio_2_external_connection_export;
endmodule
