
module niosHello (
	buttons_export,
	clk_clk,
	leds_1_writeresponsevalid_n,
	peripheral_ps2_0_conduit_end_1_clk_export,
	peripheral_ps2_0_conduit_end_2_data_export,
	reset_reset_n);	

	input	[5:0]	buttons_export;
	input		clk_clk;
	output	[3:0]	leds_1_writeresponsevalid_n;
	inout		peripheral_ps2_0_conduit_end_1_clk_export;
	inout		peripheral_ps2_0_conduit_end_2_data_export;
	input		reset_reset_n;
endmodule
