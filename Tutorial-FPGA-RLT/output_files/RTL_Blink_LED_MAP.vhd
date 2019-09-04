library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; 

entity RTL_Blink_LED_MAP is
	 generic
    (
        leds        : natural
    ); 
    port (
        -- Gloabals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
        fpga_led_pio  : out std_logic_vector(leds-1 downto 0);
		  fpga_switch_pio  : in std_logic_vector(5 downto 0);
		  fpga_button_pio  : in std_logic_vector(5 downto 0)
		  
		  
	);
end entity RTL_Blink_LED_MAP;

architecture rtl of RTL_Blink_LED_MAP is

-- signal
signal blink : std_logic := '0';
signal true_blink : std_logic := '0';

begin

  process(fpga_clk_50) 
      variable counter : integer range 0 to 25000000 := 0;
		variable pwm : integer range 1 to 5 := 1;
      begin
        if (rising_edge(fpga_clk_50)) then
						if (fpga_button_pio(1) = '0') then
							pwm := pwm + 1; 
						end if;
						
                  if (counter < 10000000) then
                      counter := counter + to_integer(signed(fpga_switch_pio));
							if ((counter mod pwm = 0) and (true_blink = '1')) then
								blink <= not true_blink;
							else
								blink <= true_blink;
							end if;
							
							
                  else
                      true_blink <= not true_blink;
							 blink <= true_blink;
                      counter := 0;
                  end if;
						
						
						if (fpga_button_pio(0) = '1') then
							blink <= '0';
						end if;
						
        end if;
  end process;

	
		fpga_led_pio(0) <= blink;
	fpga_led_pio(1) <= blink;
	fpga_led_pio(2) <= blink;
	fpga_led_pio(3) <= blink;
	fpga_led_pio(4) <= blink;
	fpga_led_pio(5) <= blink;
	fpga_led_pio(6) <= fpga_button_pio(0);

end rtl;