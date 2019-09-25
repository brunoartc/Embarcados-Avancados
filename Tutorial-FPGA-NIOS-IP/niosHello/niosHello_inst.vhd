	component niosHello is
		port (
			buttons_export                             : in    std_logic_vector(5 downto 0) := (others => 'X'); -- export
			clk_clk                                    : in    std_logic                    := 'X';             -- clk
			leds_1_writeresponsevalid_n                : out   std_logic_vector(3 downto 0);                    -- writeresponsevalid_n
			peripheral_ps2_0_conduit_end_1_clk_export  : inout std_logic                    := 'X';             -- export
			peripheral_ps2_0_conduit_end_2_data_export : inout std_logic                    := 'X';             -- export
			reset_reset_n                              : in    std_logic                    := 'X'              -- reset_n
		);
	end component niosHello;

	u0 : component niosHello
		port map (
			buttons_export                             => CONNECTED_TO_buttons_export,                             --                             buttons.export
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                 clk.clk
			leds_1_writeresponsevalid_n                => CONNECTED_TO_leds_1_writeresponsevalid_n,                --                              leds_1.writeresponsevalid_n
			peripheral_ps2_0_conduit_end_1_clk_export  => CONNECTED_TO_peripheral_ps2_0_conduit_end_1_clk_export,  --  peripheral_ps2_0_conduit_end_1_clk.export
			peripheral_ps2_0_conduit_end_2_data_export => CONNECTED_TO_peripheral_ps2_0_conduit_end_2_data_export, -- peripheral_ps2_0_conduit_end_2_data.export
			reset_reset_n                              => CONNECTED_TO_reset_reset_n                               --                               reset.reset_n
		);

