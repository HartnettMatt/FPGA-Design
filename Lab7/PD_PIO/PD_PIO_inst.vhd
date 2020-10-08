	component PD_PIO is
		port (
			clk_clk                            : in  std_logic                    := 'X';             -- clk
			pio_0_external_connection_in_port  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			pio_0_external_connection_out_port : out std_logic_vector(7 downto 0);                    -- out_port
			pio_1_external_connection_export   : out std_logic;                                       -- export
			reset_reset_n                      : in  std_logic                    := 'X';             -- reset_n
			pio_2_external_connection_export   : in  std_logic_vector(9 downto 0) := (others => 'X')  -- export
		);
	end component PD_PIO;

	u0 : component PD_PIO
		port map (
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                       clk.clk
			pio_0_external_connection_in_port  => CONNECTED_TO_pio_0_external_connection_in_port,  -- pio_0_external_connection.in_port
			pio_0_external_connection_out_port => CONNECTED_TO_pio_0_external_connection_out_port, --                          .out_port
			pio_1_external_connection_export   => CONNECTED_TO_pio_1_external_connection_export,   -- pio_1_external_connection.export
			reset_reset_n                      => CONNECTED_TO_reset_reset_n,                      --                     reset.reset_n
			pio_2_external_connection_export   => CONNECTED_TO_pio_2_external_connection_export    -- pio_2_external_connection.export
		);

