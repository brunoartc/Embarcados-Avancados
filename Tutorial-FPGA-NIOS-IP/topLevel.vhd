library IEEE;
use IEEE.std_logic_1164.all;

entity topLevel is
    port (
        -- Gloabals
        fpga_clk_50        : in  std_logic;             -- clock.clk

        -- I/Os
        fpga_led_pio       : out std_logic_vector(5 downto 0);
		  fpga_button_pio       : in std_logic_vector(5 downto 0)
    );
end entity topLevel;

architecture rtl of topLevel is
component niosHello is
  port (
		buttons_export              : in  std_logic_vector(5 downto 0) := (others => 'X'); -- export
		clk_clk                     : in  std_logic                    := 'X';             -- clk
		leds_1_writeresponsevalid_n : out std_logic_vector(3 downto 0);                    -- writeresponsevalid_n
		reset_reset_n               : in  std_logic                    := 'X'              -- reset_n
  );
end component niosHello;

begin

u0 : component niosHello
  port map (
		buttons_export              => fpga_button_pio, 			 -- buttons.export
		clk_clk                     => fpga_clk_50,     			 --     clk.clk
		leds_1_writeresponsevalid_n => fpga_led_pio(3 downto 0),  --  leds_1.writeresponsevalid_n
		reset_reset_n               => '1'             				 --   reset.reset_n
  );

end rtl;