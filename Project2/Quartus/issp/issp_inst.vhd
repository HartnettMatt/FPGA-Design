	component issp is
		port (
			probe      : in  std_logic_vector(0 downto 0) := (others => 'X'); -- probe
			source     : out std_logic_vector(2 downto 0);                    -- source
			source_clk : in  std_logic                    := 'X'              -- clk
		);
	end component issp;

	u0 : component issp
		port map (
			probe      => CONNECTED_TO_probe,      --     probes.probe
			source     => CONNECTED_TO_source,     --    sources.source
			source_clk => CONNECTED_TO_source_clk  -- source_clk.clk
		);

