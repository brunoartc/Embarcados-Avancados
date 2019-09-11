	component niosHello is
		port (
			buttons_export : in  std_logic_vector(5 downto 0) := (others => 'X'); -- export
			clk_clk        : in  std_logic                    := 'X';             -- clk
			leds_export    : out std_logic_vector(5 downto 0);                    -- export
			reset_reset_n  : in  std_logic                    := 'X'              -- reset_n
		);
	end component niosHello;

	u0 : component niosHello
		port map (
			buttons_export => CONNECTED_TO_buttons_export, -- buttons.export
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			leds_export    => CONNECTED_TO_leds_export,    --    leds.export
			reset_reset_n  => CONNECTED_TO_reset_reset_n   --   reset.reset_n
		);

