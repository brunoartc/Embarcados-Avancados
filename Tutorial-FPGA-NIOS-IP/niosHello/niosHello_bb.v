
module niosHello (
	buttons_export,
	clk_clk,
	reset_reset_n,
	leds_1_writeresponsevalid_n);	

	input	[5:0]	buttons_export;
	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	leds_1_writeresponsevalid_n;
endmodule
