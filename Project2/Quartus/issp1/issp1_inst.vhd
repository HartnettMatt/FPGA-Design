	component issp1 is
		port (
			probe  : in  std_logic_vector(5 downto 0) := (others => 'X'); -- probe
			source : out std_logic_vector(1 downto 0)                     -- source
		);
	end component issp1;

	u0 : component issp1
		port map (
			probe  => CONNECTED_TO_probe,  --  probes.probe
			source => CONNECTED_TO_source  -- sources.source
		);

