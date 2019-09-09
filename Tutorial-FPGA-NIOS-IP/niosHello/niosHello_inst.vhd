	component niosHello is
		port (
			buttons_export              : in  std_logic_vector(5 downto 0) := (others => 'X'); -- export
			clk_clk                     : in  std_logic                    := 'X';             -- clk
			reset_reset_n               : in  std_logic                    := 'X';             -- reset_n
			leds_1_writeresponsevalid_n : out std_logic_vector(3 downto 0)                     -- writeresponsevalid_n
		);
	end component niosHello;

	u0 : component niosHello
		port map (
			buttons_export              => CONNECTED_TO_buttons_export,              -- buttons.export
			clk_clk                     => CONNECTED_TO_clk_clk,                     --     clk.clk
			reset_reset_n               => CONNECTED_TO_reset_reset_n,               --   reset.reset_n
			leds_1_writeresponsevalid_n => CONNECTED_TO_leds_1_writeresponsevalid_n  --  leds_1.writeresponsevalid_n
		);

