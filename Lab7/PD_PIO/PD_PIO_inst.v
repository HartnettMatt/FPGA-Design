	PD_PIO u0 (
		.clk_clk                            (<connected-to-clk_clk>),                            //                       clk.clk
		.pio_0_external_connection_in_port  (<connected-to-pio_0_external_connection_in_port>),  // pio_0_external_connection.in_port
		.pio_0_external_connection_out_port (<connected-to-pio_0_external_connection_out_port>), //                          .out_port
		.pio_1_external_connection_export   (<connected-to-pio_1_external_connection_export>),   // pio_1_external_connection.export
		.reset_reset_n                      (<connected-to-reset_reset_n>),                      //                     reset.reset_n
		.pio_2_external_connection_export   (<connected-to-pio_2_external_connection_export>)    // pio_2_external_connection.export
	);

